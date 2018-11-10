function [P,R, F] = evaluate_naive(E,GT)
%EVALUATE_NAIVE

% intersection_matrix = (E == GT);
[h, w]  = size(E);
intersection_matrix = zeros(h,w);
for i = 1:h
    for j = 1:w
        if (E(i,j) == GT(i,j) && E(i,j) == 1)
            intersection_matrix(i,j) = 1;
        end
    end
    
end


equals_size = sum(sum(intersection_matrix));
E_size = sum(sum(E));
P = equals_size / E_size;

G_size = sum(sum(GT));
R = equals_size / G_size;

F = (2 * ( P * R)) / (P + R);
end

