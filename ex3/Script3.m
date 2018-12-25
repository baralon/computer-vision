%Script HW3

img_name = 'moving_me';
vid = VideoReader('moving_me.mp4');
mov=read(vid);

% currAxes = axes;
% vidObj = VideoWriter('new_marple.avi');
% open(vidObj);

frame_jumps = [3];
sigmas = [7] ;
% sigmas = [10] ;
region_sizes = [15];
resizes = [ 1];
min_eign = 100;

for frames_jump = frame_jumps
    for sigma = sigmas
        for region_size = region_sizes
            for resize_factor = resizes
                display(sprintf('frame_jump: %d, sigma %d, region_size %d, resize_factor: %d', frames_jump, sigma, region_size, resize_factor));
                target_folder_name = "results2/" + img_name + "/" + img_name + "_frames_" + frames_jump + ...
                                     "_sigma_" + sigma + "_region_" + region_size + ...
                                     "_resize_factor_" + resize_factor;
                                 
                mkdir(target_folder_name);
                for i=1:5
                    if (i*frames_jump > size(mov,4) || ...
                        i*frames_jump+frames_jump > size(mov,4)) 
                        continue;
                    end
                    frame = 7 + i*frames_jump;
                    im=rgb2gray(mov(:,:,:,frame)); %covert to gray scale
                    im=double(imresize(im,resize_factor)); %resize the image
                    im2=rgb2gray(mov(:,:,:,frame+frames_jump));
                    im2=double(imresize(im2,resize_factor));
                    tic;
                    [u12,v12] = OF(double(im),double(im2),sigma,region_size, min_eign);
                    
                    toc;
                    [X Y]=meshgrid(1:size(im,2),1:size(im,1));
                    nu12=medfilt2(u12,[5 5]);
                    nv12=medfilt2(v12,[5 5]);
                    f = figure; 
                    show_title = "_frames_" + frames_jump + ...
                                 "_sigma_" + sigma + "_region_" + region_size + ...
                                 "_resize_factor_" + resize_factor + "_" + i;          
                    imshow(im,[]);
                  
                    hold on;
                    quiver(X(1:5:end,1:5:end),Y(1:5:end,1:5:end), ...
                    nu12(1:5:end,1:5:end),nv12(1:5:end,1:5:end),5);

                    %%% put here your optical flow results on im and its successive frame using quiver
                    pause(0.1);
                    hold off;
                    res = getframe;
                    imwrite(res.cdata, sprintf(target_folder_name + '/of_' + img_name + '_%d.jpg',i));
                    close(f);
                    
                    optical_flow_mag_handle = figure();
                    imshow(label2rgb(seg_OF_magnitude(u12,v12, 0.1)),[]);
                    res = getframe;
%                     imwrite(res.cdata, sprintf(target_folder_name + '/' + "mag_optical_flow" +  img_name + '_%d.jpg',i, diff));
                    close(optical_flow_mag_handle);
                    
                    
                    D = zeros(size(im,1), size(im,2), 2);
                    D(:,:,1) = u12 ;
                    D(:,:,2) = v12 ;
                    projection = imwarp(double(im), D);
                    diff = sum(abs(double(im2)-double(projection)), 'all');
                    f = figure();
                    imshow(projection,[]);
                    res = getframe;
                    imwrite(res.cdata, sprintf(target_folder_name + '/' + "projection_" +  img_name + '_%d_diff_%d.jpg',i, diff));
                    close(f);
                    
                    f= figure();
                    diff2 = sum(abs(double(im2)-double(im)), 'all');
                    imshowpair(im,im2)
                    res = getframe;
                    imwrite(res.cdata, sprintf(target_folder_name + '/' + "show_pair_before_wrap_" +  img_name + '_%d_diff_%d.jpg',i, diff2));
                    close(f);
                    
                    f= figure();
                    imshowpair(projection,im2)
                    res = getframe;
                    imwrite(res.cdata, sprintf(target_folder_name + '/' + "show_pair_after_wrap_" +  img_name + '_%d_diff_%d.jpg',i, diff));
                    close(f);
                end
            end
        end
    end
   
end

    