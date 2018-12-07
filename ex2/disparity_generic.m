function [m, m_distance, m_lookup, m_real_values] = disparity_generic(im1, im2, patch_size, disparity_range, disparity_type)

view1_img = imread(im1);
view2_img = imread(im2);

if (strcmp(disparity_type, 'gradient')) 
    view1_img = gradient_magnitude(view1_img);    
    view2_img = gradient_magnitude(view2_img);
end

[rows,colls] = size(view1_img);
m_distance = ones(rows, colls) * -1;
m = zeros(rows, colls);
m_real_values = zeros(rows, colls);
m_lookup = zeros(rows, colls, 2);


% going throght the image pixel by pixel
for i = patch_size(1):size(view1_img,1) - patch_size(1)
   for j = patch_size(2):size(view1_img,2)-patch_size(2)
       patch = (view1_img(i-floor(patch_size(1)/2):i + floor(patch_size(1)/2), j-floor(patch_size(2)/2):j+floor(patch_size(2)/2)));
       v1 = double(reshape(patch, [1, patch_size(1) * patch_size(2)]));
       v1_norm = sqrt(v1*v1');
       temp_legit_range = [j - disparity_range(2): j - disparity_range(1), ...
                            j + disparity_range(1):j+ disparity_range(2)];
       legit_range =  [];
        for k = 1: length(temp_legit_range)
            if(temp_legit_range(k) - floor(patch_size(2)/2) > 0 && temp_legit_range(k) + floor(patch_size(2)/2) < colls)
                legit_range = [legit_range, temp_legit_range(k)];
            end
        end

%      going  throuhg the other image
       for z = 1:length(legit_range)
%            display("i: " + string(i) + " j: " + string(j))
           patch = (view2_img(i-floor(patch_size(1)/2):i + floor(patch_size(1)/2), legit_range(z)-floor(patch_size(2)/2):legit_range(z)+floor(patch_size(2)/2)));
           v2_candidate = double(reshape(patch, [1, patch_size(1) * patch_size(2)]));
           v2_candidate_norm =  sqrt(v2_candidate * v2_candidate');
           distance = (v1 * v2_candidate') / (v1_norm * v2_candidate_norm);
           if (distance > m_distance(i,j))
              m_distance(i,j) =  distance;
              m(i,j) =  abs(j - legit_range(z));
              m_real_values(i,j) = j - legit_range(z);
              m_lookup(i,j,:) = [i,legit_range(z)];      
           end
           
       end
       
   end
end

end