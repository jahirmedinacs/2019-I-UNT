ref_path = navigator(pwd, false, '');
threshold = otsu(ref_path);
bin_im(ref_path, threshold);