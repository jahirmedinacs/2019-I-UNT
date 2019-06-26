%% Equaliz: function description
function [outputs] = Equaliz(image_data)
	ref_hist = Histogram(image_data, true);

	outputs = uint8(zeros(size(image_data)));
	for ii=1:256
		eq_val = round(255 * sum(ref_hist(1:ii)));
		outputs = outputs + (eq_val * (image_data == (ii - 1)));
	end
end
