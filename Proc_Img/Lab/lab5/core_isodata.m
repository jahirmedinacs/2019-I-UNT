function var_value=core_isodata(histogram, t)
    w_1 = sum(histogram(1:t));
    w_2 = sum(histogram(t+1:end));
    
    intensity_val = double(0:255);
    p_histogram = histogram .* intensity_val;
    pw_1 = sum(p_histogram(1:t));
    pw_2 = sum(p_histogram(t+1:end));
    
    u_j = ( (w_1 / (pw_1 + 1e-64)) + (w_2 / (pw_2 + 1e-64)) ) / 2.0;
    
    var_value = u_j;
end