%% P_mean: function description
function [outputs] = P_mean(image_data, m_shape)
	mask = (1 / prod(m_shape)) * ones(m_shape);
	outputs = uint8(C_convolve(image_data, mask));
