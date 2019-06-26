%% P_meanr: function description
function [outputs] = P_meanr(image_data, m_shape, min_v, max_v)
	padded_image = Padding(image_data, m_shape);
	outputs = image_data;

	[rows, columns] = size(image_data);
	for ii=1:rows
		for jj=1:columns
			temp = padded_image(ii:ii + m_shape(1) - 1, jj:jj + m_shape(2) - 1);
			ref_bool = ((temp >= min_v) .* (temp <= max_v));
			n_elements = sum(sum(ref_bool));
			if (n_elements > 0)
				mask = ref_bool / n_elements;
				outputs(ii, jj) = sum(dot(mask, temp));
			end
		end
	end
end
