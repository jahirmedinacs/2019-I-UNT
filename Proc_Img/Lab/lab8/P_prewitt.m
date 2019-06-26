%% P_prewitt: function description
function [outputs] = P_prewitt(image_data)
	mask_x = repmat([-1 0 1], 3 , 1)';
	mask_y = mask_x';

	x_proc = C_convolve(image_data, mask_x);
	y_proc = C_convolve(image_data, mask_y);

	outputs = uint8(sqrt((x_proc .^ 2) + (y_proc .^ 2)));

end