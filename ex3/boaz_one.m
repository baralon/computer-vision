function [U, V] = boaz_one(F1, F2, Sigma_S, Region)

    I_x = conv2(F1, [-1 0 1; -2 0 2; -1 0 1], 'same');
    I_y = conv2(F1, [-1 -2 -1; 0 0 0; 1 2 1], 'same');
    I_t = cast(F2 - F1, 'double');
    
    margin = floor(Region / 2);
    [X, Y] = meshgrid(-margin:margin, -margin:margin);
    gaussian_conv = exp((X.^2) / Sigma_S + ((Y.^2) / Sigma_S)) / (2 * pi * Sigma_S^2);
    
    I_x_I_x = conv2(I_x.^2, gaussian_conv, 'same');
    I_y_I_y = conv2(I_y.^2, gaussian_conv, 'same');
    I_x_I_y = conv2(I_x .* I_y, gaussian_conv, 'same');
    
    I_x_I_t = conv2(I_x .* I_t, gaussian_conv, 'same');
    I_y_I_t = conv2(I_y .* I_t, gaussian_conv, 'same');

    [h, w] = size(F1);
    
    U = zeros(h, w);
    V = zeros(h, w);
    
    for i=1:h
        for j=1:w
            C = [   I_x_I_x(i, j) I_x_I_y(i, j); 
                    I_x_I_y(i, j) I_y_I_y(i, j)];

            if rank(C) ~= 0
                X = inv(C) * [I_x_I_t(i, j); I_y_I_t(i, j)];
                u = X(1);
                v = X(2);
            else
                u = 0;
                v = 0;
            end
            
            U(i, j) = u;
            V(i, j) = v;
        end
    end
end