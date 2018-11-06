function result = thinning(G_strength,G_orientation)


[h,w] = size(G_strength);

process_orientation = G_orientation;
process_orientation(process_orientation > (0 - 22.5) & process_orientation <= (0 + 22.5)) = 0;
process_orientation(process_orientation > (45-22.5) & process_orientation <= (45+22.5)) = 45;
process_orientation(process_orientation > (90-22.5) & process_orientation <= (90+22.5)) = 90;
process_orientation(process_orientation > (135-22.5) & process_orientation <= (135+22.5)) = -45;

process_orientation(process_orientation > (135+22.5) | process_orientation <= (-135-22.5)) = 0;
process_orientation(process_orientation > (-135-22.5) & process_orientation <= (-135+22.5)) = 45;
process_orientation(process_orientation > (-90-22.5) & process_orientation <= (-90+22.5)) = 90;
process_orientation(process_orientation > (-45-22.5) & process_orientation <= (-45+22.5)) = -45;


result = zeros(h,w);

for i=2:h-1
    for j=2:w-1
        
        if (process_orientation(i,j) == 0)
            if (G_strength(i,j) > max(G_strength(i+1, j), G_strength(i-1, j)))
               result(i,j) =  G_strength(i,j);
            end
            
        elseif(process_orientation(i,j) == 45)
            if (G_strength(i,j) > max(G_strength(i+1, j+1), G_strength(i-1, j-1)))
               result(i,j) =  G_strength(i,j);
            end
            
        elseif(process_orientation(i,j) == -45)
            if (G_strength(i,j) > max(G_strength(i+1, j-1), G_strength(i-1, j+1)))
               result(i,j) =  G_strength(i,j);
            end
            
        elseif(process_orientation(i,j) == 90)
            if (G_strength(i,j) > max(G_strength(i, j+1), G_strength(i, j-1)))
               result(i,j) =  G_strength(i,j);
            end 
        end
        
    end
end


