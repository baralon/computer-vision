function [U,V] = OF(F1,F2, Sigma_S, Region, min_eign)
   
    im = F1;
    im2 = F2;
    %Setting the window according to regions size
    window = round(Region/2);
    [x,y] = meshgrid(-window:window, -window:window);
    mask_g = exp(-(x.^2 + y.^2)/(2*Sigma_S^2));
    mask_g=mask_g./sum(mask_g(:));

    %Generating the wieght function
    W = diag(mask_g(:));
    %creating the derived images in the sepcial domain 
    l_x = conv2(im, [-1 0 1; -2 0 2; -1 0 1],'same');
    l_y = conv2(im, [-1 0 1; -2 0 2; -1 0 1]','same');
    %creating the derived images in the temporal domain 
    l_t_weighted = double(im) - double(im2);
    directions = zeros(size(im,1),size(im,2), 2);
    eign_values = zeros(size(im,1),size(im,2));
    
    for i = window + 1 : size(im,1) - window
        for j= window + 1 : size(im,2) - window
            %creating patches size of regions
            l_x_window = l_x(i- window: i+window, j-window: j+window);
            l_y_window = l_y(i- window: i+window, j-window: j+window);
            l_t_window = l_t_weighted(i- window: i+window, j-window: j+window);
            %Converting the patches to vectros to construct A
            l_x_window = l_x_window(:);
            l_y_window = l_y_window(:);
            A = [l_x_window, l_y_window];
            %Constructing weighted C 
            C = A' * W * A;
            %Instead of checking rank C which is inaccurate due to noize 
            %I will check whether rank C = 2 using the eigen values of
            %The matrix with some threshhold I found per video. 
            %For example for the cars video smaller_eign = 10000 was pretty
            %good
            smaller_eign = min(eig(C));
            eign_values(i,j) = smaller_eign;
            if (smaller_eign > min_eign) 
                %In case rank C == 2 then solving the equations.
                b =  A' * W * double((-l_t_window(:)));
                results = pinv(C) * double(b);
                directions(i,j,:) = results;            
            end
        end
     
    end

    U = directions(:,:,1);
    V = directions(:,:,2);

end

