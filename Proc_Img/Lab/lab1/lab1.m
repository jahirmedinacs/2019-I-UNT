
function [big_bertha] = lab2(def, m1_shape, m2_shape, m3_shape)
    %nivel 1
    %fila columna
    m1_shape=[3 3];
    m2_shape=[4 4];
    m3_shape=[3 5];
    
    m1 = [1:1:9];
    m1 = transpose(reshape(m1, m1_shape));
        
    m2 = [10:1:25];
    m2 = transpose(reshape(m2, m2_shape));
    
    m3 = [30:10:170];
    m3 = transpose(reshape(m3, flip(m3_shape)));
    disp(m3);
    big_bertha = zeros([m1_shape(1) + m2_shape(1), m2_shape(2) + m3_shape(1)]);
    size(big_bertha)
    %asignando
    
    big_bertha(1,1:3) = flip(m1(1, 1:3));
    big_bertha(2,1:3) = m1(2, 1:3);
    big_bertha(3,1:3) = flip(m1(3, 1:3));
    
    big_bertha(1:m2_shape(1), m1_shape(2) + 1:end) = m2;
    
    big_bertha(4,1:3) = flip(m1(1, 1:3));
    big_bertha(5:end, 1:5) = m3;
    big_bertha(5:end, 6:7) = flip(m3(1:end, 4:end), 2);
    
    big_bertha;
    
end