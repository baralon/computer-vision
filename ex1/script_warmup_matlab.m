%%% STEP A : Read and dispaly an image.
    
                %load image into cones1 and dsiaply its size
                           Im_c1=imread('cones1.tif');
                           size(Im_c1)
                           sprintf('The height of the image is: %.0f',size(Im_c1,1))
                           sprintf('The width of the image  is: %.0f',size(Im_c1,2))                %show image
                           imshow(Im_c1);
                    
                % Display a section through the image i.e. a plot of the grayscale
                % values of row 250.  The section is overlay the original image.
                % Note that dark regions have low intensity values.
    
                            hold on;
                            plot([1,size(Im_c1,2)],[250,250])
                            plot(size(Im_c1,1)-Im_c1(250,:),'r'); 
                            % note, the y axis in an image is upsidedown
                            %      therefore we plot the '-' of the
                            %      function
                            
                  
            % The section is displayed in a new window.
                        figure;
                        plot(Im_c1(250,:),'r');
             % Put a  title on the figure
                 
                        title('A section through row 250');
           
      
     %  Your part: Display a vertical  section through cones1  of  column  330;
     % ****************************  ADD HERE   ********************
     % Question: A1
     
     
    
     plot([330, 330], [1 size(Im_c1,1)])
     % ****************************  UP TO HERE   ********************
    
%%% STEP B: Smooth the image with a Gaussian
        % define the mask:
          G=G_mask(6,2); 
          figure;
          surfl(G);
          
     %  Your part: Display a horizontal  section through the center of the
     %  mask
     
       % ****************************  ADD HERE   ********************
     % Question: B2
     imshow(Im_c1_smooth);
    
    G1=G_mask(6,1);
    Im_smooth_G1=conv2(Im_c1,G1,'same');
    
     imshow(Im_smooth_G1, []);
     
     G3=G_mask(6,3);
     Im_smooth_G3=conv2(Im_c1,G3,'same');
     imshow(Im_smooth_G3, []);
     
     G5=G_mask(6,5);
     Im_smooth_G5=conv2(Im_c1,G5,'same');
     imshow(Im_smooth_G5, []);
     
     G40=G_mask(6,80);
     Im_smooth_G40=conv2(Im_c1,G40,'same');
     imshow(Im_smooth_G40, []);
     
%      we can notice that larger sigma creates a stronger blurr => that
%      theline through row is smoother
plot(Im_smooth_G1(:,250), 'r');
plot(Im_smooth_G3(:,250), 'b');
 plot(Im_smooth_G5(:,250), 'g');
     
     % ****************************  UP TO HERE   ********************
     
     
     
   % Convolve the image with the mask:
        
           Im_c1_smooth=conv2(Im_c1,G,'same');
           imshow(Im_c1_smooth,[]) % note: sicnce the values are not integers between 0 to 255, 
                                   % we use the parameter [] for better
                                   % visualization. Try without it.
           
           
           
    %  Your part: 
     % The reset of questions B
     
    Im_c1_smooth2=conv2(Im_c1,G,'same');
     
     % ****************************  UP TO HERE   ********************
     
           
         

%%% STEP C: Compute the derivatives of an image using convolution

            % The simple convolution kernel
                    mask_dy=[1; 0; -1]
                    mask_dx=mask_dy'
                
                    I_dx=conv2(Im_c1,mask_dx,'same');
                    I_dy=conv2(Im_c1,mask_dy,'same');
                
            % Display the convolved images
                    figure; imshow(abs(I_dx),[]);
                    figure; imshow(abs(I_dy),[]);
             
    
        % Sections through the intensity in  blue and its x-derivative in
        % red.
       
                figure; 
                plot(Im_c1(250,:));
                h1=figure;      % you can later use figure(h1) to return to this figure.
                plot(Im_c1(250,:));
                hold on; 
                plot(I_dx(250,:),'r')
                
%                 8. In Order to plot negative gradients - as in hanges in negative directions changes as well .
% ===== second derivitive mask =====

                
        