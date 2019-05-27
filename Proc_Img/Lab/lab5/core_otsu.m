function var_value=core_otsu(hist, t)
    w_1 = sum(hist(1:t-1));
    w_2 = sum(hist(t:end));
    
    ref_val = double(0:255);    
    
    u_1 = sum((ref_val(1:t-1) .* hist(1:t-1)) ./ (w_1 + 1e-64));
    u_2 = sum((ref_val(t:end) .* hist(t:end)) ./ (w_2 + 1e-64));
    
    u_t = w_1*u_1 + w_2*u_2;
    
    var_value = w_1 * pow2(u_t - u_1) + w_2 * pow2(u_t - u_2);
end