% A - I implemented the requested function canny(‘file_name’, sigma ,L_th, H_th)

% B

meshed = meshgrid(1:5)


% C 

%Submit this image:
imshow(canny('Images/panda.gif', 3, 1 ,2), [] );

Figure; imshow(E1,[]);

%D
figure;
imshow(canny('Images/Golf.jpg', 1, 20 ,10), [] );
figure;
imshow(canny('Images/Church.jpg', 1, 20 ,10), [] );
figure;
    

% The sigma parameter affects the weight of the local env around the pixel.
% This can be demonstrates by running the canny edge detector 
% the following two values of sigma. you can clearly see in the second
% image how you can see more details in the head cover of the more further
% nun.
E1 = canny('Images/Nuns.jpg',3,3 ,1);
E2 = canny('Images/Nuns.jpg',1,3 ,1);



figure; imshow(E1,[]);
title('Using sigma1')
figure; imshow(E2,[]);
title('Using sigma2')

%E

%Sigma weight how much weight we are going to give the local enviroment
%around each pixel when convulvinng the gaussian mask with the original
%image
%H_th - It the maximum size of a gradian that will allow to stay at the
%image. When it is too high subtle changes will not enter the output. Too
%low, and too many false positive will enter the output and we might not
%understand what it is that we are seeing.
%L_th is the secondary maximum size, it will help connects pixels in
%between high-gradient pixels. When too high suble changes willnot enter
%the output, and the output edges will seem cut in the middle. When too
%low to many false positive will go into the output.



