function threshold=entropy(hist)
  t_vector = double(1:256 < 0);
  
  for t=1:256
    t_vector(t) = core_entropy(hist, t);
  endfor
  
  [_, id_x] = max(t_vector);
  threshold = id_x;

endfunction

function var_value=core_entropy(histogram, t)
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