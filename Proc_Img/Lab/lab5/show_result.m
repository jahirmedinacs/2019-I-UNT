function show_result(im, bin_im, threshold, hist)
  
  ref_range=0:255;
  
  figure
  subplot(3,1,1);
  imshow(im)

  subplot(3,1,2);
  imshow(bin_im)
  title('Binarizacion')
  xlabel(strcat('T: ', num2str(threshold)));

  subplot(3,1,3);
  bar(ref_range, hist, 5)
  
end