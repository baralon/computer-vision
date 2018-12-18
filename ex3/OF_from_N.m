% 1. write a matlab function:  [U,V]=OF(F1,F2, Sigma_S, Region) F1,F2: 
% two frames from a sequence. Region is the local neighborhood window 
% for computing the matrix A. Sigma_S =  spatial Gaussian smoothing 
% parameter (see matlab tips below: 
% If smoothing in the spatial domains, try using a very gentle Gaussian 
% filter (i.e., a small sigma). )
% Output are 2 matrices: 
% U is the x-component flow V is the y-component flow 
function [U,V]=OF_from_N(F1,F2, Sigma_S, Region)

%% 1. Smooth the image in the spatial domain 

% create gaussian with the width of region and given sigma 
[x,y] = meshgrid(-Region:Region, -Region:Region);

% avoid divide by zero:
if (Sigma_S==0)
    Gauss_mask_2D = 1;
else
    Gauss_mask_2D = exp(-(x.^2 + y.^2)/(2*Sigma_S^2));
    Gauss_mask_2D = Gauss_mask_2D./sum(Gauss_mask_2D(:));
end

F1_smoothed = conv2(F1, Gauss_mask_2D, 'same');
F2_smoothed = conv2(F2, Gauss_mask_2D, 'same');

% derivation masks:
deriv_x_mask = [-1 0 1];
deriv_y_mask = [
                -1
                 0
                 1
                  ];

% now we'll get I_x and I_y for all the pixels:
I_x = conv2(F1_smoothed, deriv_x_mask, 'same');
I_y = conv2(F1_smoothed, deriv_y_mask, 'same');

%% 2. Smooth the image in the temporal  domain 
% we'll get I_t by substructing the two sequential images:
% -->  -I_t = I_x*u +I_y*v
I_t = conv2(F2_smoothed-F1_smoothed, Gauss_mask_2D, 'same');

%% 3. For each pixel: 
% now we'll get [u;v] motion vector of pixel i.

% we'll assume that for K pixels (this is our Region parameter) arround
% pixel i - the movement is similiar. 

A = zeros(Region^2,2);
B = zeros(Region^2,1);
U = zeros(size(F1,1),size(F1,2));
V = zeros(size(F1,1),size(F1,2));

for i = ceil(Region/2)+1 : Region : size(F1,1)-ceil(Region/2)
    for j = ceil(Region/2)+1 : Region : size(F1,2)-ceil(Region/2)
        % build A(:,1)
        if mod(Region,2) == 0
            patch = I_x((i-round(Region/2)+1:i+round(Region/2)) , (j-round(Region/2)+1:j+round(Region/2)));
        else
            patch = I_x((i-round(Region/2)+1:i+round(Region/2)-1) , (j-round(Region/2)+1:j+round(Region/2)-1));
        end
        A(:,1) = reshape(patch, 1, Region^2);
        
        % build A(:,2)
        if mod(Region,2) == 0
            patch = I_y((i-round(Region/2)+1:i+round(Region/2)) , (j-round(Region/2)+1:j+round(Region/2)));
        else
            patch = I_y((i-round(Region/2)+1:i+round(Region/2)-1) , (j-round(Region/2)+1:j+round(Region/2)-1));
        end
        A(:,2) = reshape(patch, 1, Region^2);
        
        %Build B
        if mod(Region,2) == 0
            patch = -I_t((i-round(Region/2)+1:i+round(Region/2)) , (j-round(Region/2)+1:j+round(Region/2)));
        else
            patch = -I_t((i-round(Region/2)+1:i+round(Region/2)-1) , (j-round(Region/2)+1:j+round(Region/2)-1));
        end
        B(:) = reshape(patch, 1, Region^2);
                
        % we'll define G as A^T * A
        G = A'*A;
        
        % if rank G == 0 % patch without uniq
        % if rank G == 1 % pixel on edge
        % if rank G == 2 % it's a corner - cumpute [u;v] the motion vector
        if rank(G)==2
            A_pinv = pinv(A); %inv(A'*A)*A';
            A_pinv_B =(A_pinv*B)';
            U(i,j)= -A_pinv_B(1,1);
            V(i,j)= A_pinv_B(1,2);
        end
    end
end

end