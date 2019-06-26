%% P_sobel: function description
function [outputs] = P_sobel(image_data)
	mask_x = [-1 0 1]' * [1 2 1];
	mask_y = mask_x';
	
	x_proc = C_convolve(image_data, mask_x);
	y_proc = C_convolve(image_data, mask_y);

	outputs = uint8(sqrt((x_proc .^ 2) + (y_proc .^ 2)));

end