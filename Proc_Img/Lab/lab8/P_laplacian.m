%% P_laplacian: function description
function [outputs] = P_laplacian(image_data, intensity)
	mask = fspecial('laplacian', intensity);
	outputs = uint8(C_convolve(image_data, mask));