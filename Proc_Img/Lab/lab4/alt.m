function histogram=normal_histogram(data)
  elems = numel(data);
  hist_base = double(1:256 < 0);

  for ii = 0:255
    hist_base(ii + 1) = sum(sum(data == ii));
  end
  
  hist_norm = hist_base / elems;
  histogram=hist_norm;

endfunction