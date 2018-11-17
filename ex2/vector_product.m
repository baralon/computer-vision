function result = vector_product(u,v)
%VECTOR_PRODUCT Summary of this function goes here
%   Detailed explanation goes here
u_x = [0 -u(3) u(2); 
       u(3) 0 -u(1);
       -u(2) u(1) 0];
   
result = u_x * v';
end

