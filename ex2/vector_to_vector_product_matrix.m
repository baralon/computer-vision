function result = vector_to_vector_product_matrix(u)
%VECTOR_TO_VECTOR_PRODUCT_MATRIX Summary of this function goes here
%   Detailed explanation goes here
result = [0 -u(3) u(2); 
          u(3) 0 -u(1);
         -u(2) u(1) 0];
end

