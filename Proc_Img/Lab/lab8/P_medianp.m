%% P_median: function description
function [outputs] = P_medianp(image_data, weight)
	m_shape = size(weight);
	n_elements = sum(sum(weight));
	elements = prod(m_shape);

	padded_image = Padding(image_data, m_shape);
	outputs = uint8(zeros(size(image_data)));

	single_mid = (mod(n_elements, 2) == 1);

	[rows, columns] = size(image_data);
	for ii=1:rows
		for jj=1:columns
			temp = padded_image(ii:ii + m_shape(1) - 1, jj:jj + m_shape(2) - 1);
			sub_output = uint8(ones([1 n_elements]));

			flat_temp = reshape(temp, [1 elements]);
			flat_weight = reshape(weight,[1 elements]);

			ref = 1;
			for ll=1:elements
				sub_output(ref:ref + flat_weight(ll) - 1) *= flat_temp(ll);
				ref = ref + flat_weight(ll);
			end
			sub_output = sort(sub_output);
			
			if single_mid
				outputs(ii, jj) = sub_output(ceil(n_elements/2));
			else
				outputs(ii, jj) = round(sum(sub_output(n_elements / 2 : (n_elements / 2) + 1) ) / 2);
			end
			
		end
	end
end
