function result = proj(M,p)
new_p = [p' 1];
result = M * new_p';
result = result ./ result(3);
result = result(1:2);
end

