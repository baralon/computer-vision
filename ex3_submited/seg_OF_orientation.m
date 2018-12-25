function [idx] = seg_OF_orientation(U,V, bins)
%SEG_OF_ORIENTATION labeling componenets if their orientation is similar
O = atan2(U,V) .* 180 ./ pi;

O_vec = O(:);
[idx, m] = kmeans(O_vec, bins);
idx = reshape(idx,[size(U,1),size(U,2)]);

end

