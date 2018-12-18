function ret_map = change_detection(seq,th)

background_map = zeros(size(seq,1), size(seq,2));

gray_scale_seq = zeros(size(seq,1),size(seq,2), size(seq,4));

number_of_frames = size(seq,4)  ;
window = 6;
[x,y] = meshgrid(-window:window, -window:window);
mask_g = exp(-(x.^2 + y.^2)/(2*2^2));
mask_g=mask_g./sum(mask_g(:));
% calculating greqscle map while cleaning noise
for k =1: size(seq,4)
    gray_scale_seq(:,:,k) = conv2(rgb2gray(seq(:,:,:,k)), mask_g,'same');
end

% calculating median map
for i = 1: size(seq,1)
    for j = 1: size(seq,2)
        background_map(i,j) = median(gray_scale_seq(i,j,:));
    end
end

ret_map = zeros(size(seq));


for k = 1: number_of_frames
    for i = 1: size(seq,1)
        for j = 1: size(seq,2)
            if ( abs(gray_scale_seq(i,j,k) - background_map(i,j)) > th)
                ret_map(i,j,:,k) = seq(i,j,:,k);
            end
        end
    end
end

end

