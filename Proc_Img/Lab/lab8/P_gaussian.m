%% P_gaussian: function description
function [outputs] = P_gaussian(image_data, m_shape, sigma)
	mask = fspecial('gaussian', m_shape, sigma);
	outputs = uint8(C_convolve(image_data, mask));