function y=leer()
   
%file_name = 'plate.png'
file_name = 'platesp.png'
%file_name = 'test.png'
%file_name = 'test2.png'

im=imread(strcat('./lab3/',file_name));
elems = numel(im);
ref_range = 0:1:256;
hist_base = zeros(1,256);

%%Histograma
disp(size(hist_base));
for ii = 0:256
    hist_base(1, ii + 1) = sum(sum(im == ii));
end

%%Histograma (Normal)
hist_norm = hist_base / elems; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(sum(hist_norm)); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%Histograma Acumulativo
hist_cum = cumsum(hist_base);

%%Histograma Normalizado
hist_cum_norm = hist_cum / elems;
%binarizacion
threshold = 127; %%%%%%%%%%%%%%%%%%%%%%%%%%%%

bin_im = (im > threshold) * 255;

%%%%%%%%%% PLOT

figure

subplot(3,2,1);
imshow(im)
title(file_name)

subplot(3,2,2);
imshow(bin_im)
title('Binarizacion')
xlabel(strcat('T: ', num2str(threshold)));

subplot(3,2,3);
bar(ref_range, hist_base, 5)
title(strcat('Histograma ',file_name))

subplot(3,2,4);
bar(ref_range, hist_norm, 5)
title(strcat('Histograma Normalizado',file_name))

subplot(3,2,5)
bar(ref_range, hist_cum, 5)
title(strcat('Histograma Acumulativo',file_name))

subplot(3,2,6)
bar(ref_range, hist_cum_norm, 5)
title(strcat('Histograma Normalizado',file_name))


end   