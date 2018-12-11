%Script HW3

vid = VideoReader('marple7.avi');
mov=read(vid);
G_dx=Derive_Gauss_x(2);
G_dy=Derive_Gauss_y(2);

currAxes = axes;
vidObj = VideoWriter('new_marple.avi');
open(vidObj);
for i=1:round((size(mov,4)-1))
    im=rgb2gray(mov(:,:,:,i)); %covert to gray scale
    %    im=imresize(im,0.3); %resize the image
    imshow(im,[]);
    im2=rgb2gray(mov(:,:,:,i));
    [u12,v12, direction] = OF(im,im2,2,5);
    [X Y]=meshgrid(1:size(im,2),1:size(im,1));
    nu12=medfilt2(u12,[5 5]);
    nv12=medfilt2(v12,[5 5]);
    figure; 
    imshow(rgb2gray(mov(:,:,:,i)),[]);
    hold on;
    quiver(X(1:5:end,1:5:end),Y(1:5:end,1:5:end), ...
    nu12(1:5:end,1:5:end),nv12(1:5:end,1:5:end),5);
 
    %%% put here your optical flow results on im and its successive frame using quiver
    pause(0.1);
    hold off;
end
    