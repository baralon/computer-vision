vidObj = VideoWriter('cars5_new.avi');
open(vidObj);

files = dir('results/cars5_frames_5_sigma_20_region_15_resize_factor_1/of_*jpg');
for file = files'
    images(:,:,i)=rgb2gray(imread(strcat(file.folder, '/' ,file.name)));
    writeVideo(vidObj,rgb2gray(imread(strcat(file.folder, '/' ,file.name)))); 
    % Do some stuff
end

close(vidObj);