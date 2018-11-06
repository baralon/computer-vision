function result = Hysteresis(img,H_th, L_th)
[h,w] = size(img);
mask = [1 1 1; 1 0 1; 1 1 1];
lower_values_removed = img;
lower_values_removed(lower_values_removed < L_th) = 0;
% marking the pixels that are between 
lower_values_removed( lower_values_removed >= L_th & lower_values_removed < H_th) = -1; 
result = zeros(h,w);
for i=2:h-1
    for j = 2:w-1
%         Checking whether the marked pixels had a change because of value
%         because of a neighbour 
        if (lower_values_removed(i,j) > H_th)
            result(i,j) = img(i,j);
        elseif (lower_values_removed(i,j) == -1) && ...
             (lower_values_removed(i-1,j) >= H_th || ...
                lower_values_removed(i-1,j+1) >= H_th || ...
                lower_values_removed(i,j+1) >= H_th || ...
                lower_values_removed(i+1,j+1) >= H_th || ...
                lower_values_removed(i+1,j) >= H_th || ...
                lower_values_removed(i+1,j-1) >= H_th || ...
                lower_values_removed(i,j-1) >= H_th || ...
                lower_values_removed(i-1,j-1) >= H_th )
                
            result(i,j) = img(i,j);
                
            
        end  
    end
end
