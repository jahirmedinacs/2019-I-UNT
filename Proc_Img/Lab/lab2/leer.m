#pkg load image

function [f c p]=leer ()
 im=imread('plate.png'); % leer imagenes'C:\plate.png'
 
 figure
 [f c p]=size(im) %dimensiones
 imshow(im);
 
 printf("HOLI %d %d %d\n", f,c,p);
 
 pixel=impixel(im,60,150)
  
 figure 
 subplot(1,2,1); imshow(im)  % filas,columnas, pos(1,..,filasxcolunas)
 subplot(1,2,2); imshow(im)
  whos im
  
 %imd=double(im)
 %imVer=uint8(imd)
end