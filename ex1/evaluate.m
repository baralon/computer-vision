function [P,R, F] = evaluate(E,GT)
%EVALUATE Summary of this function goes here
%   Detailed explanation goes here
dilatedI = imdilate(E, strel('diamond',1));
[P, R, F] = evaluate_naive(dilatedI, GT);


end

    