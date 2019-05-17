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

function var_value=core_isodata(histogram, t)
    w_1 = sum(histogram(1:t));
    w_2 = sum(histogram(t+1:end));
    
    intensity_val = double(0:255);
    p_histogram = histogram .* intensity_val;
    pw_1 = sum(p_histogram(1:t));
    pw_2 = sum(p_histogram(t+1:end));
    
    u_j = ( (w_1 / (pw_1 + 1e-64)) + (w_2 / (pw_2 + 1e-64)) ) / 2.0;
    
    var_value = u_j;
endfunction

function threshold=isodata(img_path)
  histogram = normal_histogram(img_path);
  t_vector = double(1:256 < 0);
  
  current_t = 0;
  ref_last = -1e-64;
  for t=1:255
    t_vector(t) = core_otsu(histogram, t);
    current_t = t;
    
    if ref_last == t_vector(t)
      break;
    endif
    
    ref_last = t_vector(t);
    
  endfor
  
  threshold = current_t;

endfunction

ref_path = navigator(pwd, false, '');
threshold = isodata(ref_path);
binarize(ref_path, threshold);