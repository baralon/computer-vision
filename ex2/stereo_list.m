function P = stereo_list(ps1,ps2, M_L,M_R)

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


for j = 1: size(projections_R,2)
    projections_R(:,j) = projections_R(:,j) ./ projections_R(4,j);
end

projections_L_homo = projections_L([1:3], :);
projections_R_homo = projections_R([1:3], :);

cop_L = null(M_L);
cop_L = cop_L ./ cop_L(4);
cop_R = null(M_R);
cop_R = cop_R ./ cop_R(4);

cop_L_homo = cop_L(1:3);
cop_R_homo = cop_R(1:3);

u_L = projections_L_homo - repmat(cop_L_homo, [1,size(projections_L_homo,2)]);
u_R = projections_R_homo - repmat(cop_R_homo, [1,size(projections_R_homo,2)]);

P = [];
b= cop_L_homo - cop_R_homo;

for j = 1: size(u_L,2)
    current_u_L = u_L(:,j);
    current_u_R = u_R(:,j);
    A = [current_u_L * -1, current_u_R];
    result = A \ b;
    p_l_candidate = cop_L_homo + result(1) *  current_u_L;
    p_r_candidate = cop_R_homo + result(1) *  current_u_R;
    current_p = (p_l_candidate + p_r_candidate) * 0.5;
    P = [P; current_p'];
end

% I will do a verification to the first point that is returned in P
first_P = P(1,:);
first_P_homo = [first_P, 1]';
first_project_L = M_L * first_P_homo;
p_L_candidate = first_project_L ./ first_project_L(3);
p_L_candidate = p_L_candidate(1:2);

first_project_R = M_R * first_P_homo;
p_R_candidate = first_project_R ./ first_project_R(3);
p_R_candidate = p_R_candidate(1:2);




end

