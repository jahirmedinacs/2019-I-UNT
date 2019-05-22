function demo_entropy(path)
  if !isempty(path)
    ref_path = path;
  else 
    ref_path = file_chooser("../", false, '');
  endif
  
  im = imread(ref_path);

  n_hist = normal_histogram(im);
  threshold = entropy(n_hist);
  bin_im = binarize(im, threshold);

  show_result(im, bin_im, threshold, n_hist);

endfunction