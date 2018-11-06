function mask_g = G_mask(mask_size, sigma)

[x,y] = meshgrid(-mask_size:mask_size, -mask_size:mask_size);
mask_g = exp(-(x.^2 + y.^2)/(2*sigma^2));
mask_g=mask_g./sum(mask_g(:));

