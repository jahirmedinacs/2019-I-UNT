clear;
clc;

function path_chossed=navigator(path_ref, last, file_chosed)
  clc;
  if strcmp(file_chosed,'')
    printf('\nArchivo Seleccionado :\t VACIO');
  elseif
    printf('\nArchivo Seleccionado :\t %s | %s/', file_chosed, path_ref);
  endif
  
  current_dir = dir(path_ref);  
  if last
    printf('\n\n');
    path_chossed = path_ref;
  else
    for ii=1:size(current_dir)(1)
      file_name = current_dir(ii);
      printf('\n(%d) \t >>>  %s', ii, file_name.name);   
      ii = ii + 1;
    endfor
    
    printf('\n(-1) \t >>> Terminar y Usar Archivo Seleccionado');   
    option_chosed = input('\n\nArchivo?\t:>>> ');

    if option_chosed == -1
      path_chossed = navigator(path_ref, true, file_chosed);
    elseif
      next_path = strcat(strcat(what(path_ref).path, '/'), current_dir(option_chosed).name);
      path_chossed = navigator(next_path, false, current_dir(option_chosed).name);
    endif
  endif
endfunction

function binarize(img_path, threshold)
  im = imread(img_path);
  bin_im = (im > threshold) * 255;
  
  ref_range=0:255;
  hist_base=normal_histogram(img_path); 
  
  figure

  subplot(3,1,1);
  imshow(im)

  subplot(3,1,2);
  imshow(bin_im)
  title('Binarizacion')
  xlabel(strcat('T: ', num2str(threshold)));

  subplot(3,1,3);
  bar(ref_range, hist_base, 5)
  
endfunction

function histogram=normal_histogram(img_path)
  im=imread(img_path);
  
  elems = numel(im);
  hist_base = double(1:256 < 0);

  for ii = 0:255
    hist_base(ii + 1) = sum(sum(im == ii));
  end
  
  hist_norm = hist_base / elems;
  histogram=hist_norm;

endfunction

function entropy=shannon(data_array)
  entropy = -1 * sum(data_array .* log2(data_array + 1e-64));
endfunction

function rebased=onebase(data_array)
  %{
  min_ref = min(data_array)
  max_ref = max(data_array)
  
  data_array = data_array - min_ref;
  data_array = data_array - min_ref / (max_ref - min_ref);
  %}
  
  data_array = data_array * ( 1.0 / (sum(data_array) + 1e64));
  
  rebased = data_array;
endfunction

function var_value=core_entropia(histogram, t)
    %{
    white = histogram(1:t);
    black = histogram(t+1:end);
    
    e_1 = shannon(white);
    e_2 = shannon(black);
    %}
    
    %%{
    white = histogram(1:t);
    black = histogram(t+1:end);
    
    e_1 = shannon(onebase(white));
    e_2 = shannon(onebase(black));
    %%}
    
    %{
    w_1 = sum(histogram(1:t));
    w_2 = sum(histogram(t+1:end));
    
    pre_e_1 = histogram(1:t) ./ (w_1 + 1e-64);
    e_1 = -1 * sum(pre_e_1 .* log2(pre_e_1));
    
    pre_e_2 = histogram(t+1:end) ./ (1 - w_1 + 1e-64);
    e_2 = -1 * sum(pre_e_2 .* log2(pre_e_2));
    %}
    
    %{
    e_1 = -1 * sum(histogram(1:t) .* log2(histogram(1:t)));
    e_2 = -1 * sum(histogram(t+1:end) .* log2(histogram(t+1:end)));
    %}
    
    var_value = e_1 + e_2;
endfunction

function threshold=entropia(img_path)
  histogram = normal_histogram(img_path);
  t_vector = double(1:256 < 0);
  
  for t=1:255
    t_vector(t) = core_entropia(histogram, t);
  endfor
  
  [_, id_x] = max(t_vector);
  threshold = id_x;

endfunction

ref_path = navigator(pwd, false, '');
threshold = entropia(ref_path);
binarize(ref_path, threshold);