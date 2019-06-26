%% Histogram: function description
function [outputs] = Histogram(image_data, normalized)
	outputs = zeros([1 256]);
	
	for ii=1:256
		outputs(ii) += sum(sum(image_data == (ii - 1)));
	end
	
	if (normalized)
		outputs = outputs / prod(size(image_data));
	end
end