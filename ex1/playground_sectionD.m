% J

%church
chuch_res = sobel("Images/Church.jpg", 2);

% golf
golf_res = sobel("Images/Golf.jpg", 2);

% nuns
nuns_res = sobel("Images/Nuns.jpg", 2);


% K

Soble will fail in images with a lot of noise since it does not have the
smoothing stage that canny has.
In addition,the edges will be thick with comparison to canny, we we inspire 
an accurate describption of the edges.

[results_chruch,results_golf,results_nun] = performance_evaluation_sobel("naive")
[results_chruch_not_naive,results_golf_not_naive,results_nun_not_naive] = performance_evaluation_sobel("not_naive")

% you can see that with the unnaive results the better results (visually as
% well) comes with th of about 72 (then it starts declining)