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
  disp(sum(hist_norm));
  histogram=hist_norm;

%{  
  elems = numel(im);
  hist_base = int64(1:256 < 0);

  for ii = 0:255
      hist_base(ii + 1) = sum(sum(im == ii));
  end

  hist_norm = hist_base / elems;
  
  hist_norm = hist_norm .* (hist_norm > 1e-12);
  
  disp(sum(hist_norm));
%}

endfunction

function var_value=core_otsu(histogram, t)
    w_1 = sum(histogram(1:t)) + 1e-32;
    w_2 = sum(histogram(t+1:end)) + 1e-32;
    ref_val = 1:256;
    
    u_1 = sum(ref_val(1:t) .* histogram(1:t)) / w_1;
    u_2 = sum(ref_val(t+1:end) .* histogram(t+1:end)) / w_2;
    
    u_t = w_1*u_1 + w_2*u_2;
    
    var_value = w_1 * pow2(u_t - u_1) + w_2 * pow2(u_t - u_2);
endfunction

function threshold=otsu(img_path)
  histogram = normal_histogram(img_path);
  t_vector = int64(1:256 < 0);
  
  max_ref = -1e32;
  for t=1:255
    if histogram(t) > 0
      t_vector(t) = core_otsu(histogram, t);
    endif
  endfor
  
  [_, id_x] = max(t_vector);
  threshold = id_x;

endfunction

ref_path = navigator(pwd, false, '');
threshold = otsu(ref_path);
binarize(ref_path, threshold);