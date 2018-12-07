function depth = depth(T, f, disparity)
%DEPTH_MAP Summary of this function goes here
%   Detailed explanation goes here
depth = (f *T / (disparity + 100)) ;
end

