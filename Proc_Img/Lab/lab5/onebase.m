function rebased=onebase(data_array)
  data_array = data_array * ( 1.0 / (sum(data_array) + 1e64));
  rebased = data_array;
endfunction