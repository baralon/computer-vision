% Image L
 % You are given
 % The projection matrix
    M_L= [1100.504780,0,331.023000,0; 0, 1097.763735,259.386377, 0; 0, 0,1,0];
    
 %Rotation: 
     R_L=[ 1  0 0 
         0 1 0
         0 0 1];
%Focal length: 
    f_L=1.0;
    
% Compute COP1:
  T_L=[0; 0; 0];

%Compute the image center: 
     ox_L = M_L(1, 3);
     oy_L = M_L(1, 3);
     
% compute the scale factor:
     Sx_L = M_L(1, 1);
     Sy_L = M_L(1, 2);
     
 % Compute intrinsic projection matrices: 
    Mint_L=M_L(:, 1:3);
     
% Image R: 
%You are given the intrinsic parameters: 
    %Image center: 
    ox_R = 320.798101; 
    oy_R = 236.431326;

    % Scale factor: 
    Sx_R = 1095.671499;
    Sy_R = 1094.559584;
   
    % Focal length: 
    f_R=1;
     
    % Translation w.r.t. the world origin
    T_R=-[178.2218
          18.8171
          -13.7744];
    % Rotation
    R_R =[
         0.9891    0.0602   -0.1346
        -0.0590    0.9982    0.0134
         0.1351   -0.0053    0.9908];

% Compute intrinsic projection matrices: Mint1 and Mint2
   Mint_R=[ Sx_R    0       ox_R; 
            0       Sy_R    oy_R; 
            0       0       1];
      
% Compute the projection matrix
    M_R = [Mint_R [0;0;0]] * [[R_R -R_R*T_R]; [0 0 0 1]];

% Compute 
    COP_L = null(M_L);
    COP_R = null(M_R);