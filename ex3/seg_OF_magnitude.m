function connected_components = seg_OF_magnitude(U,V,th)
%SEG_OF_MAGNITUDE Summary of this function goes here
%   Detailed explanation goes here
map = sqrt(U .^ 2 + V.^2);
map(map <= th) = 0;
map(map > th) = 1;
connected_components = bwlabel(map);
end

