%% P_log: function description
function [outputs] = P_log(image_data, m_shape, std_v)
	mask = fspecial('log', m_shape, std_v);
	outputs = uint8(C_convolve(image_data, mask));