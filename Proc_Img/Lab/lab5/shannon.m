function entropy=shannon(data_array)
  entropy = -1 * sum(data_array .* log2(data_array + 1e-64));
end