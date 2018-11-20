function [] = draw_epipolar_lines(im_L,im_R,F,p,f1,f2)
l = F * [p' 1]';
y_1 = (-l(1) - l(3)) / l(2);
q = [1, y_1]
y_end = (-l(1) * size(im_R,2) - l(3)) / l(2);
p = [size(im_R,2), y_end]
figure(f2);
hold on;
plot([q(1), p(1)],[q(2),p(2)]);

end

