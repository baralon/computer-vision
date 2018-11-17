function result = homo(vec)
%HOMO Summary of this function goes here
%   Detailed explanation goes here;
[r, h] = size(vec);
result = vec ./ vec(r);
result = result(1: size(vec)-1);

end

