function [U,V, directions, eign_values] = OF_no_wieght(F1,F2, Sigma_S, Region)
   
    im = F1;
    im2 = F2;
    window = round(Region/2);
    [x,y] = meshgrid(-window:window, -window:window);
    mask_g = exp(-(x.^2 + y.^2)/(2*Sigma_S^2));
    mask_g=mask_g./sum(mask_g(:));
    W = diag(mask_g(:));
    l_x = conv2(im, [-1 0 1; -2 0 2; -1 0 1],'same');
    l_y = conv2(im, [-1 0 1;  -2 0 2; -1 0 1]','same');
%     l_t_weighted = conv2(im - im2,mask_g, 'same');
    l_t = conv2(im, ones(2), 'same') + conv2(im2, -ones(2), 'same');
    directions = zeros(size(im,1),size(im,2), 2);
    eign_values = zeros(size(im,1),size(im,2));
    
    for i = window + 1 : size(im,1) - window
        for j= window + 1 : size(im,2) - window
            l_x_window = l_x(i- window: i+window, j-window: j+window);
            l_y_window = l_y(i- window: i+window, j-window: j+window);
            l_t_window = l_t(i- window: i+window, j-window: j+window);
            l_x_window = l_x_window(:);
            l_y_window = l_y_window(:);
            A = [l_x_window, l_y_window];
            C = A' * A;
            smaller_eign = min(eig(C));
            eign_values(i,j) = smaller_eign;
            if (smaller_eign > 2000000) 
                b =  -l_t_window(:);
                results = A \ b;
                directions(i,j,:) = results;            
            end
        end
     
    end

    U = directions(:,:,1);
    V = directions(:,:,2);

end

