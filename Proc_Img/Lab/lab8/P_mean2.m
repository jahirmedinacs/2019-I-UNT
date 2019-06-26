%% P_mean2: function description
function [outputs] = P_mean2(image_data, m_shape)
	mask = (1 / (prod(m_shape) + 1)) * ones(m_shape);
	c =  ceil(size(mask)/2);
	mask(c(1), c(2)) *= 2;
	outputs = uint8(C_convolve(image_data, mask));