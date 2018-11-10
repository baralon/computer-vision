% please notice:
% fill your code where you see empty []
% you can change this documnet as you wish. please notify me if you find
% any errors.
%
% Good luck 
% Yael & Nir

%% section A

% Q. a.

% generate an image with a 1x3 white patch
I_QAa = zeros(512);
I_QAa(100, 50:52) = 1;

% generate a mask
convMask_QAa = -1.*ones(5);
convMask_QAa(3, 2:4) = 1;


% convolve mask and image 
Iresult_QAa = conv2(I_QAa,convMask_QAa,'same');

maxi = max(Iresult_QAa(:));
indices = ismember(Iresult_QAa, maxi);

[max_rowqa1,max_colqa1] = find(indices);

% find maximal value location (using code!)
maxLocation_x = max_rowqa1(1);
maxLocation_y = max_colqa1(1);

% show generated image & mark maximal value
figure();
imshow(I_QAa);
hold on;
plot(maxLocation_x, maxLocation_y, '*r')
title('QAa: original image with max value marked');

% show mask used
figure();
imshow(convMask_QAa, []);
title('QAa: masked used')

% show convolution result
figure();
imshow(Iresult_QAa, []);
title('QAa: convolution results');

% Q. b.
% please fill in a similar fashion to QAa

I_QAb =ones(400,400);
I_QAb(:, 1:100) = 0;
I_QAb(:,100:200) = 50;
I_QAb(:, 200:300) = 100;
I_QAb(:,300:400) = 150;

% mask
convMask_QAb = (1/9).*ones(1,9);

% convolve mask and image 
Iresult_QAb = conv2(I_QAb,convMask_QAb,'same');

h1 = figure();
imshow(I_QAb,[]);
title('QAB: original image');

figure();
imshow(Iresult_QAb, []);
title('QAb: convolution results');

% Q. c.
% please fill in a similar fashion to QAa
% image
I_QAc = zeros(400);
I_QAc(200, 100:104) = 1;
I_QAc(198:202,102) = 1;

%mask
convMask_QAc = -1.*ones(5);
convMask_QAc(3, 2:4) = 1;
convMask_QAc(2:4, 3) = 1;

Iresult_QAc = conv2(I_QAc,convMask_QAc,'same');

figure();
imshow(I_QAc,[])
title('QAc: original result');

figure();
imshow(Iresult_QAc,[]);
title('QAc: convolution result');

%% section B
% after you write the functions uncomment and run:

% Q. BB.

% generate a synthetic image to test your canny edge detector
im_test = createSyntheticImage_QBb();
im_test_name = 'QBb_imageForCanny.jpg';
imwrite(im_test, im_test_name);

L_th = 1;
H_th = 2;
sigmaCanny = 2;

im_test_edges = canny(im_test_name, sigmaCanny ,L_th, H_th);
figure;
subplot(1, 2, 1);
imshow(im_test, []);
title('QBb: edges on synthetic  image');
subplot(1, 2, 2);
imshow(im_test_edges, []);
title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% Q. BC

% choose an image to run your edge detector on 
imageName_QBC = "Images/panda.gif";
I_BC = imread(imageName_QBC);
L_th = 2;
H_th = 3;
sigmaCanny = 2;

% run canny edge detector
I_BC_edges = canny(imageName_QBC, sigmaCanny ,L_th, H_th);

% show results

figure;
subplot(1, 2, 1);
imshow(I_BC, []);
title('QBc: edges on panda image');
subplot(1, 2, 2);
imshow(I_BC_edges, []);
title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% Q. BD 
% please fill in a similar way
imageName_QBD_1 = "Images/Church.jpg";
I_BD_1 = imread(imageName_QBD_1);

% run canny edge detector
I_BD_edges_1 = canny(imageName_QBD_1, sigmaCanny ,L_th, H_th);

% show results

figure;
subplot(1, 2, 1);
imshow(I_BD_1, []);
title('QBc: edges on Church image');
subplot(1, 2, 2);
imshow(I_BD_edges_1, []);
title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

imageName_QBD_2 = "Images/Golf.jpg";
I_BD_2 = imread(imageName_QBD_2);

% run canny edge detector
I_BD_edges_2 = canny(imageName_QBD_2, sigmaCanny ,L_th, H_th);

% show results

figure;
subplot(1, 2, 1);
imshow(I_BD_2, []);
title('QBc: edges on Golf image');
subplot(1, 2, 2);
imshow(I_BD_edges_2, []);
title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);



imageName_QBD_3 = "Images/Nuns.jpg";
I_BD_3 = imread(imageName_QBD_3);

% run canny edge detector
I_BD_edges_3 = canny(imageName_QBD_3, sigmaCanny ,L_th, H_th);

% show results

figure;
subplot(1, 2, 1);
imshow(I_BD_3, []);
title('QBc: edges on Nuns image');
subplot(1, 2, 2);
imshow(I_BD_edges_3, []);
title(['Lth = ' num2str(L_th) ', Hth = ' num2str(H_th) ', \sigma = ' num2str(sigmaCanny)]);

% Q. BE
figure;
subplot(1, 2, 1);
imshow(I_BD_3, []);
title('QBc: edges on Nuns image');
subplot(1, 2, 2);
imshow(canny(imageName_QBD_3, 5 ,3, 7), []);
title(['Lth = ' num2str(3) ', Hth = ' num2str(7) ', \sigma = ' num2str(5)]);


figure;
subplot(1, 2, 1);
imshow(I_BD_3, []);
title('QBc: edges on Nuns image');
subplot(1, 2, 2);
imshow(canny(imageName_QBD_3, 3 ,10, 13), []);
title(['Lth = ' num2str(10) ', Hth = ' num2str(13) ', \sigma = ' num2str(3)]);

%% section C

% Q. CG 
   
[results_chruch,results_golf,results_nun] = performance_evaluation_canny("naive");
  
%   best measurements
figure;
imshow(canny("Images/Church.jpg",results_chruch(5, 4),results_chruch(5, 6),results_chruch(5, 5)), []);
title(['Lth = ' num2str(results_chruch(5, 6)) ', Hth = ' num2str(results_chruch(5, 5)) ', \sigma = ' num2str(results_chruch(5, 4))]);
figure;
imshow(canny("Images/Golf.jpg",results_golf(9, 4),results_golf(9, 6),results_golf(9, 5)), []);
title(['Lth = ' num2str(results_golf(9, 6)) ', Hth = ' num2str(results_golf(9, 5)) ', \sigma = ' num2str(results_golf(9, 4))]);
figure;
imshow(canny("Images/Nuns.jpg",results_nun(5, 4),results_nun(5, 6),results_nun(5, 5)), []);
title(['Lth = ' num2str(results_golf(9, 6)) ', Hth = ' num2str(results_golf(9, 5)) ', \sigma = ' num2str(results_nun(5, 4))]);

% please replace val1/2/3/.. with your values
L_th = results_chruch(:,6);
H_th = results_chruch(:,5);
sigma = results_chruch(:,4);

% test values effect

disp(results_chruch(:, 1:3));
disp(results_golf(:, 1:3));
disp(results_nun(:, 1:3));

% Q. CI
% create a function and test results

[results_chruch,results_golf,results_nun] = performance_evaluation_canny("not_naive");


% please replace val1/2/3/.. with your values
L_th = results_chruch(:,6)
H_th = results_chruch(:,5);
sigma = results_chruch(:,4);

% test values effect

disp(results_chruch(:, 1:3));
disp(results_golf(:, 1:3));
disp(results_nun(:, 1:3));

best_res =  max(results_chruch_re(:,3));
figure;
imshow(canny("Images/Church.jpg",3,4,2), []);
title(['Lth = ' num2str(2) ', Hth = ' num2str(4) ', \sigma = ' num2str(2)]);


