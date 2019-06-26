%% P_kirsch: function description
function [outputs] = P_kirsch(image_data, rotation)
	m_shape = 3;

	mask_0 = repmat([-1 0 1], m_shape , 1)';
	mask_45 = flip(tril(-1 * ones(m_shape), -1) + triu(ones(m_shape), 1));
	mask_90 = mask_0';
	mask_135 = flip(mask_45);

	masks = [mask_0 mask_45 mask_90 mask_135];
	masks = reshape(masks, [3 3 4]);
	pre_output = uint8(zeros([size(image_data) 4]));

	if (rotation > 4 || rotation < 1)
		for ll=1:4
			pre_output(:, :,ll) = uint8(C_convolve(image_data, masks(:, :,ll)));
		end
		outputs = max(pre_output, [], 3);
	else
		outputs = uint8(C_convolve(image_data, masks(:, :,rotation)));
	end
end