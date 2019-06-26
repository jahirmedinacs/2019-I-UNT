%% P_hfrec: function description
function [outputs] = P_hfrec(image_data, m_shape, A)
	low_pass = P_enhancement(image_data, m_shape);

	outputs = uint8((A - 1) * image_data - low_pass);

