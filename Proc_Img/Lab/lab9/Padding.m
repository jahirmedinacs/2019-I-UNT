%% Padding: function description
function [reflect_matrix] = Padding(input_matrix, filter_shape)
	rows = floor(filter_shape(1) / 2);
	columns = floor(filter_shape(2) / 2);
	
	ref_size = size(input_matrix);
	reflect_matrix = uint8(zeros([ref_size(1) + 2 * rows, ref_size(2) + 2 * columns]));

	%% Adding center
	reflect_matrix(1 + rows:1 + rows + ref_size(1) - 1, 1 + columns:1 + columns + ref_size(2) - 1 ) = input_matrix;
	%% Reflecting (Central Up)
	reflect_matrix(1: 1+ rows -1, 1 + rows: 1 + rows + ref_size(2) - 1) = flip(input_matrix(1:1+ rows - 1, 1:end), 1);
	%% Reflecting (Central Down)	
	reflect_matrix(1+ rows + ref_size(1): end, 1 + rows: 1 + rows + ref_size(2) - 1) = flip(input_matrix, 1)(1:1+ rows - 1, 1:end);

	%% Reflecting (Central Left)
	reflect_matrix(1 + rows: 1 + rows + ref_size(1) - 1, 1: 1+ columns - 1) = flip(input_matrix(1:end, 1:1+ columns - 1), 2);
	%% Reflecting (Central Rigth)	
	reflect_matrix(1 + rows: 1 + rows + ref_size(1) - 1, 1+ columns + ref_size(2): end) = flip(input_matrix, 2)(1:end, 1:1+ columns - 1);

	%% Reflecting Corners
	%%%
	%% Upper Left
	reflect_matrix(1: 1 + rows - 1, 1: 1 + columns - 1) = flip(flip(input_matrix(1:1 + rows - 1, 1: 1 + columns - 1)),2)';
	%% Lower Left 
	reflect_matrix(1 + rows + ref_size(1): end, 1: 1 + columns - 1) = flip(flip(input_matrix)'(1:1 + rows - 1, 1: 1 + columns - 1),2);
	%%%
	%% Upper Rigth
	 reflect_matrix(1 + rows + ref_size(1): end, 1 + columns + ref_size(2): end) = flip(flip(input_matrix(end - rows  + 1:end, end - columns + 1:end)),2)';
	%% Lower Rigth 
	reflect_matrix(1: 1 + rows - 1, 1 + columns + ref_size(2): end) = flip(flip(input_matrix)'(end - rows  + 1:end, end - columns + 1:end),2);

end