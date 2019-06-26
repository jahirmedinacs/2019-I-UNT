%% EqualizLocale: function description
function [outputs] = EqualizLocale(image_data, m_shape)
	outputs = uint8(zeros(size(image_data)));

	padded_image = Padding(image_data, m_shape);

	[rows, columns] = size(image_data);
	window_dim = prod(m_shape);
	c = ceil(m_shape / 2);
	for ii=1:rows
		for jj=1:columns
			temp = padded_image(ii:ii + m_shape(1) - 1, jj:jj + m_shape(2) - 1);
			
			%{
			uniques = unique(temp);
			s_uniques = size(uniques);
			
			alt_hist = zeros([1 prod(s_uniques)]);
			for ll=1:s_uniques
				alt_hist(ll) = sum(sum(temp == uniques(ll)));
			end
			alt_hist = alt_hist / window_dim;

			ref_center = temp(c(1), c(2));
			
			eq_val = round(255 * sum(alt_hist(1:find(uniques == ref_center)(1))));

			ii
			jj
			eq_val
			%}
			ref_center = temp(c(1), c(2));
			
			alt_hist = Histogram(temp, true);
			alt_hist
			eq_val = round(255 * sum(alt_hist(1:(ref_center + 1))))			

			outputs(ii, jj) = eq_val;

		end
	end
end
