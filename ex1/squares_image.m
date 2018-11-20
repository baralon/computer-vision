function sq_img=squares_image(img,sqSize)
    
%    USAGE: squares_image(img,sqSize)
%
% Creates a squares image such that each square has the mean value
% of the corresponding square in the given input image. 
% The squares image will be displayed and written to the given output file.
%
% inFile - The input file name (containing a grayscale image).
% sqSize - The size of each square.
% outFile - The output file name in which the squares image will be written.
%
% Written by Michael Rubinstein 037279148
% Last Modified 26/10/02



% Get number of rows and cols in img.
[rows,cols,c]=   size(img);
if c>1 img=rgb2gray(img); end
new_rows=floor(rows/sqSize)*sqSize;
new_cols=floor(cols/sqSize)*sqSize;
sq_img=zeros(new_rows,new_cols);

% Create the squares image.
for i = 1:sqSize:new_rows
    for j = 1:sqSize:new_cols   
            sq_img(i:i+sqSize-1,j:j+sqSize-1) = mean2(img(i:i+sqSize-1,j:j+sqSize-1));
    end
end

% Display the squares image.
figure; imshow(sq_img,[]);
    
