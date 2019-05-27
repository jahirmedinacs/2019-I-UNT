function output=normal_histogram(im)
  elems = numel(im);
  hist_base = double(1:256 < 0);

  for ii = 0:255
    hist_base(ii + 1) = sum(sum(im == ii));
  end
  
  hist_norm = hist_base / elems;
  output=hist_norm;

end