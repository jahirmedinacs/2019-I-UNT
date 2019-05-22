function bin_im=binarize(im, threshold)
  bin_im = (im > threshold) * 255;
endfunction