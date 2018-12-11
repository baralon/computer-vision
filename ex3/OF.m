function [U,V, directions] = OF(F1,F2, Sigma_S, Region)
   
    im=imresize(F1,1); %resize the image
    im2=imresize(F2,1);
    window = round(Region/2);
    G_dx=Derive_Gauss_x(Sigma_S);
    G_dy=Derive_Gauss_y(Sigma_S);
    [x,y] = meshgrid(-6:6, -6:6);
    mask_g = exp(-(x.^2 + y.^2)/(2*Sigma_S^2));
    mask_g=mask_g./sum(mask_g(:));  %gaussian mask to convove with t
    l_x = conv2(im, G_dx,'same');
    l_y = conv2(im, G_dy,'same');
    l_t = im - im2;
    g_magnitude = sqrt(l_x.^2 + l_y.^2);
    g_magnitude(g_magnitude < 3) = 0;
    l_x = g_magnitude .* l_x;
    l_y = g_magnitude .* l_y;
%     imshow(g_magnitude,[]);
    directions = zeros(size(im,1),size(im,2), 2);
    
    for i = window + 1 : size(im,1) - window
        for j= window + 1 : size(im,2) - window
            if (l_y(i,j) == 0 && l_x(i,j) == 0)
                directions(i,j,:) = 0;
            else
                l_x_window = l_x(i- window: i+window, j-window: j+window);
                l_y_window = l_y(i- window: i+window, j-window: j+window);
                l_t_window = l_t(i- window: i+window, j-window: j+window);
                l_x_window = l_x_window(:);
                l_y_window = l_y_window(:);
                b = -l_t_window(:);
                A = [l_x_window, l_y_window];
                results = A \ b;
                directions(i,j,:) = results;
            end

            
        end
     
    end

    U = directions(:,:,1);
    V = directions(:,:,2);

end

