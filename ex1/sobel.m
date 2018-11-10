function result = sobel(file_name,th)
%SOBEL Summary of this function goes here
%   Detailed explanation goes here
I_x = [-1 0 1];
I_y = I_x';

I = imread(file_name);
G_x = conv2(I, I_x, 'same');
G_y = conv2(I, I_y, 'same');

result = sqrt(G_x.^2 + G_y.^2);
result(result < th) = 0;
result(result >= th) = 1;

end

