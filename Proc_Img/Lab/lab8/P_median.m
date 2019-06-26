%% P_median: function description
function [outputs] = P_median(image_data, m_shape)
	elements = prod(m_shape);

	padded_image = Padding(image_data, m_shape);
	outputs = uint8(zeros(size(image_data)));

	single_mid = (mod(elements, 2) == 1);

	[rows, columns] = size(image_data);
	for ii=1:rows
		for jj=1:columns
			temp = padded_image(ii:ii + m_shape(1) - 1, jj:jj + m_shape(2) - 1);
			flat_temp = sort(reshape(temp, [1 elements]));

			if single_mid
				outputs(ii, jj) = flat_temp(ceil(elements/2));
			else
				outputs(ii, jj) = round(sum(flat_temp(elements / 2 : (elements / 2) + 1) ) / 2);
			end
			
		end
	end
end