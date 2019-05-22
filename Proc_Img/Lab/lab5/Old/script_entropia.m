function entropy=shannon(data_array)
  entropy = -1 * sum(data_array .* log2(data_array + 1e-64));
endfunction

function rebased=onebase(data_array)
  %{
  min_ref = min(data_array)
  max_ref = max(data_array)
  
  data_array = data_array - min_ref;
  data_array = data_array - min_ref / (max_ref - min_ref);
  %}
  
  data_array = data_array * ( 1.0 / (sum(data_array) + 1e64));
  
  rebased = data_array;
endfunction

function var_value=core_entropia(histogram, t)
    %{
    white = histogram(1:t);
    black = histogram(t+1:end);
    
    e_1 = shannon(white);
    e_2 = shannon(black);
    %}
    
    %%{
    white = histogram(1:t);
    black = histogram(t+1:end);
    
    e_1 = shannon(onebase(white));
    e_2 = shannon(onebase(black));
    %%}
    
    %{
    w_1 = sum(histogram(1:t));
    w_2 = sum(histogram(t+1:end));
    
    pre_e_1 = histogram(1:t) ./ (w_1 + 1e-64);
    e_1 = -1 * sum(pre_e_1 .* log2(pre_e_1));
    
    pre_e_2 = histogram(t+1:end) ./ (1 - w_1 + 1e-64);
    e_2 = -1 * sum(pre_e_2 .* log2(pre_e_2));
    %}
    
    %{
    e_1 = -1 * sum(histogram(1:t) .* log2(histogram(1:t)));
    e_2 = -1 * sum(histogram(t+1:end) .* log2(histogram(t+1:end)));
    %}
    
    var_value = e_1 + e_2;
endfunction

function threshold=entropia(hist)
  t_vector = double(1:256 < 0);
  
  for t=1:255
    t_vector(t) = core_entropia(hist, t);
  endfor
  
  [_, id_x] = max(t_vector);
  threshold = id_x;

endfunction