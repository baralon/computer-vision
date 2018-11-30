function patch_magnitude = gradient_magnitude(m)
l_x = conv2(m, [1 0 -1; 2 0 -2; 1 0 -1], 'same');
l_y = conv2(m, [1 2 1; 0 0 0; -1 -2 -1]', 'same');
patch_magnitude = sqrt(l_x .^2 + l_y.^2);
end

