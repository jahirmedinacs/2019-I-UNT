function threshold=entropy(hist)
  t_vector = double(1:256 < 0);
  
  for t=1:256
    t_vector(t) = core_entropy(hist, t);
  end
  
  [tt, id_x] = max(t_vector);
  threshold = id_x;

end
