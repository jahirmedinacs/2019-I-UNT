%%{
function threshold=otsu(hist)
  t_vector = double(1:256 < 0);
  
  for t=1:256
    t_vector(t) = core_otsu(hist, t);
  
  end
  
  [tt, id_x] = max(t_vector);
  threshold = id_x;

end
%%}

%{
function level = otsu(histogramCounts)
total = sum(histogramCounts); % '''total''' is the number of pixels in the given image. 
%% OTSU automatic thresholding
top = 256;
sumB = 0;
wB = 0;
maximum = 0.0;
sum1 = dot(0:top-1, histogramCounts);
for ii = 1:top
    wF = total - wB;
    if wB > 0 && wF > 0
        mF = (sum1 - sumB) / wF;
        val = wB * wF * ((sumB / wB) - mF) * ((sumB / wB) - mF);
        if ( val >= maximum )
            level = ii;
            maximum = val;
        end
    end
    wB = wB + histogramCounts(ii);
    sumB = sumB + (ii-1) * histogramCounts(ii);
end
end
}%