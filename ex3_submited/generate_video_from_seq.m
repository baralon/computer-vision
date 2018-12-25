function generate_video_from_seq(seq,target_path)

vidObj = VideoWriter(target_path);
open(vidObj);
for k = 1: size(seq, 4)
    writeVideo(vidObj,mat2gray(seq(:,:,:,k))); 
    % Do some stuff
end
close(vidObj);

end

