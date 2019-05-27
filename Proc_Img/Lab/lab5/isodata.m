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
    end
    
    ref_last = t_vector(t);
    
  end
  
  threshold = current_t;

 end