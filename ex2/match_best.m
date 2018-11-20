function index = match_best(Features_L, Features_R, indel_L)

best = intmax;
for i=1:length(Features_R)
    v = Features_L(indel_L, :) - Features_R(i,:);
    D = sqrt(v * v');
    if D < best 
        best = D;
        index = i;
    end
end
end

