function Pairs_clean = remove_incorrect_matches(Pairs,Points_L,Points_R,F,th)

candidates_L = Points_L(Pairs(:,1),:);
candidates_R = Points_R(Pairs(:,2),:);
candidates_L_points = zeros(2, length(candidates_L));
candidates_R_points = zeros(2, length(candidates_R));


for i = 1:length(candidates_L) 
    candidates_L_points(:,i) = candidates_L(i).Location;
    candidates_R_points(:,i) = candidates_R(i).Location;
end
distances = sampsonDistance(F, candidates_L_points, candidates_R_points);

Pairs_clean = [];
for i = 1:length(distances) 
    if (distances(i) < th) 
       Pairs_clean = [Pairs_clean; Pairs(i,:)];
    end
end

end

