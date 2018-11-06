function result = canny(file_name, sigma,L_th,H_th)
G_dx=Derive_Gauss_x(sigma);
G_dy=Derive_Gauss_y(sigma);

img = imread(file_name);
l_x = conv2(img, G_dx,'same');
l_y = conv2(img, G_dy,'same');

G_magnitute = sqrt(l_x .^2 + l_y.^2);
G_orientation = atan2(l_y,l_x)*180/pi;
thinned = thinning(G_magnitute,G_orientation);
result = Hysteresis(thinned, H_th, L_th);

end



