% In This script I will run the images according to the submitted file
% HW3.doc
% In order to test all the params an come to conclusions I wrote Script3.m
% Which demostrate the way I examnied all parameters over all frames. 
% Let us start wiith the answer to questions 3-5x

% Section A
img_name = 'cars5';
vid = VideoReader('cars5.avi');
mov=read(vid);


k = 2;
current_frame = 16;
next_frame = current_frame + k;
sigma = 1; 
region = 4;
resize_factor = 0.5;

im=rgb2gray(mov(:,:,:,current_frame)); %covert to gray scale
im=double(imresize(im,resize_factor)); %resize the image
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));

[u, v] = show_quivered_image(k, sigma, region, im, im2, 10000);

K = 2; sigma =3; region = 4;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));

show_quivered_image(k, sigma, region, im, im2, 10000);
k = 4; sigma = 1; region = 4;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
show_quivered_image(k, sigma, region, im, im2, 10000);

k = 4; sigma = 3; region = 4;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
show_quivered_image(k, sigma, region, im, im2, 10000);

k = 4; sigma = 3; region = 10;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
show_quivered_image(k, sigma, region, im, im2, 10000);

k = 4; sigma = 7; region = 10;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
show_quivered_image(k, sigma, region, im, im2, 10000);

k = 4; sigma = 7; region = 20;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
show_quivered_image(k, sigma, region, im, im2, 10000);

k = 2; sigma = 7; region = 20;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
show_quivered_image(k, sigma, region, im, im2, 10000);

k = 2; sigma = 1; region = 20;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
show_quivered_image(k, sigma, region, im, im2, 10000);

img_name = 'SLIDE';
vid = VideoReader('SLIDE.mp4');
mov=read(vid);

im=rgb2gray(mov(:,:,:,current_frame)); %covert to gray scale
im=double(imresize(im,resize_factor)); %resize the image


k = 4; sigma = 1; region = 15;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
[U,V] = show_quivered_image(k, sigma, region, im, im2, 0);


k = 4; sigma = 10; region = 15;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
show_quivered_image(k, sigma, region, im, im2, 0);

k = 10; sigma = 3; region = 15;
next_frame = current_frame + k;
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
show_quivered_image(k, sigma, region, im, im2, 0);

% Section B
% Showing seg of magnitude
k = 4; sigma = 7; region = 15; resize_factor = 1;
next_frame = current_frame + k;
im=rgb2gray(mov(:,:,:,current_frame)); %covert to gray scale
im=double(imresize(im,resize_factor)); %resize the image
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
[u, v] = show_quivered_image(k, sigma, region, im, im2, 0);
imshow(label2rgb(seg_OF_magnitude(u,v, 0.09)),[]);

imshow(label2rgb(seg_OF_orientation(u,v,4)), []);

fore_ground_only = change_detection(mov, 10); 
imshow(fore_ground_only(:,:,:,40),[]);

vid = VideoReader('my_pen.mp4');
mov=read(vid);

im=rgb2gray(mov(:,:,:,current_frame)); %covert to gray scale
im=double(imresize(im,resize_factor)); %resize the image

k = 4; sigma = 7; region = 15; resize_factor = 1;
next_frame = current_frame + k;
im=rgb2gray(mov(:,:,:,current_frame)); %covert to gray scale
im=double(imresize(im,resize_factor)); %resize the image
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
[u, v] = show_quivered_image(k, sigma, region, im, im2, 0);
imshow(label2rgb(seg_OF_orientation(u,v,4)), []);

% question 17
vid = VideoReader('moving_me.mp4');
mov=read(vid);
current_frame = 22;
k = 3; sigma = 7; region = 15; resize_factor = 1;
next_frame = current_frame + k;
im=rgb2gray(mov(:,:,:,current_frame)); %covert to gray scale
im=double(imresize(im,resize_factor)); %resize the image
im2=rgb2gray(mov(:,:,:,next_frame)); 
im2=double(imresize(im2,resize_factor));
[u, v] = show_quivered_image(k, sigma, region, im, im2, 100);



function [U, V] = show_quivered_image(k, sigma,region, im, im2, eign)
    [u12,v12] = OF(double(im),double(im2),sigma,region, eign);
    nu12=medfilt2(u12,[5 5]);
    nv12=medfilt2(v12,[5 5]);
    f = figure; 
    show_title = "_frames_" + k + ...
                 "_sigma_" + sigma + "_region_" + region ;          
    imshow(im,[]);
    title(show_title)
    hold on;
    [X Y]=meshgrid(1:size(im,2),1:size(im,1));
    quiver(X(1:5:end,1:5:end),Y(1:5:end,1:5:end), ...
    nu12(1:5:end,1:5:end),nv12(1:5:end,1:5:end),5);

    %%% put here your optical flow results on im and its successive frame using quiver
    
    hold off;
    close(f);
    U = u12;
    V = v12;
end


