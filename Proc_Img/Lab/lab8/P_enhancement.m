%% P_enhancement: function description
function [outputs] = P_enhancement(image_data, m_shape)
	mask = (-1 / (prod(m_shape) - 1)) * ones(m_shape);
	c =  ceil(size(mask)/2);
	mask(c(1), c(2)) = 1;
	
	outputs = C_convolve(image_data, mask);
end