%% c_convolve: function description
function [output] = C_convolve(image_data, filter_data)
	output = zeros(size(image_data));

	padded_image = Padding(image_data, size(filter_data));

	[rows, columns] = size(image_data);
	[f_rows, f_columns] = size(filter_data);
	
	for ii=1:rows
		for jj=1:columns
			output(ii, jj) = sum(dot(filter_data, padded_image(ii:ii + f_rows - 1, jj:jj + f_columns - 1)));
		end
	end
end
