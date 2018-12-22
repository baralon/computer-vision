function [idx] = seg_OF_orientation(U,V, bins)
%SEG_OF_ORIENTATION labeling componenets if their orientation is similar
O = atan2(U,V) .* 180 ./ pi;
% process_orientation = O;
% process_orientation(process_orientation > (0 - 22.5) & process_orientation <= (0 + 22.5)) = 0;
% process_orientation(process_orientation > (45-22.5) & process_orientation <= (45+22.5)) = 1;
% process_orientation(process_orientation > (90-22.5) & process_orientation <= (90+22.5)) = 2;
% process_orientation(process_orientation > (135-22.5) & process_orientation <= (135+22.5)) = 2;
% 
% process_orientation(process_orientation > (135+22.5) | process_orientation <= (-135-22.5)) = 0;
% process_orientation(process_orientation > (-135-22.5) & process_orientation <= (-135+22.5)) = 1;
% process_orientation(process_orientation > (-90-22.5) & process_orientation <= (-90+22.5)) = 2;
% process_orientation(process_orientation > (-45-22.5) & process_orientation <= (-45+22.5)) = 3;

O_vec = O(:);
[idx, m] = kmeans(O_vec, bins);
idx = reshape(idx,[size(U,1),size(U,2)]);

idx = process_orientation;
end

