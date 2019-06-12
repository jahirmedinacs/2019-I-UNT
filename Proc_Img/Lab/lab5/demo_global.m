im = imread('./pictures/plate.png');

n_hist = int64(1:256 < 0);

%{
for i=0:255
  n_hist(i+1) = sum(sum(im == i));
end
%}

n_hist = normal_histogram(im);

threshold = otsu(n_hist);
display(threshold);
bin_im = binarize(im, threshold);
show_result(im, bin_im, threshold);

%{
threshold = entropy(n_hist);
bin_im = binarize(im, threshold);
show_result(im, bin_im, threshold, n_hist);

threshold = isodata(n_hist);
bin_im = binarize(im, threshold);
show_result(im, bin_im, threshold, n_hist);
%}

clc