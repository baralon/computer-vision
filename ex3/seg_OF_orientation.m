function m = seg_OF_orientation(U,V)
%SEG_OF_ORIENTATION Summary of this function goes here
%   Detailed explanation goes here
O = atan2(U,V) .* 180 ./ pi;
m = kmeans(O, 5);
end

