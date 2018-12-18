function derived_gauss = Derive_gauss_general(sigma,mask_size, direction)

[x,y] = meshgrid(-mask_size:mask_size, -mask_size:mask_size);
mask_g = exp(-(x.^2 + y.^2)/(2*sigma^2));
mask_g=mask_g./sum(mask_g(:));
derive_mask = [1 0 -1];
if direction == 'y'
    derive_mask = derive_mask';
end

derived_gauss = derive_mask;
