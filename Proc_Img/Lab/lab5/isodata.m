function threshold=isodata(hist)
  histogram = hist;
  t_vector = double(1:256 < 0);
  
  current_t = 0;
  ref_last = -1e-64;
  for t=1:255
    t_vector(t) = core_isodata(histogram, t);
    current_t = t;
    
    if ref_last == t_vector(t)
      break;
    endif
    
    ref_last = t_vector(t);
    
  endfor
  
  threshold = current_t;

endfunction

function var_value=core_isodata(histogram, t)
    w_1 = sum(histogram(1:t));
    w_2 = sum(histogram(t+1:end));
    
    intensity_val = double(0:255);
    p_histogram = histogram .* intensity_val;
    pw_1 = sum(p_histogram(1:t));
    pw_2 = sum(p_histogram(t+1:end));
    
    u_j = ( (w_1 / (pw_1 + 1e-64)) + (w_2 / (pw_2 + 1e-64)) ) / 2.0;
    
    var_value = u_j;
endfunction