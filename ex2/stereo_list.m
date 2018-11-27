function P = stereo_list(ps1,ps2, M_L,M_R)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

p_l_pinv = pinv(M_L);
p_r_pinv = pinv(M_R);
ps_L_new = [];
ps_R_new = [];
for i=1:length(ps1)
    ps_L_new = [ps_L_new; [ps1(i,:), 1]];
    ps_R_new = [ps_R_new; [ps2(i,:), 1]];
end

projections_L = p_l_pinv * ps_L_new';
projections_R = p_r_pinv * ps_R_new';


for i = 1: size(projections_R,2)
    projections_R(:,i) = projections_R(:,i) ./ projections_R(4,i);
end

cop_L = null(M_L);
cop_L = cop_L ./ cop_L(4);
cop_R = null(M_R);
cop_R = cop_R ./ cop_R(4);

u_L = projections_L([1:3],:) - repmat(cop_L(1:3), [1,size(projections_L,2)]);
u_R = projections_R([1:3],:) - repmat(cop_R(1:3), [1,size(projections_R,2)]);
A = [u_L,u_R];

end

