
% F
    a - P measurement punish false positives because |E| is in the
    denominator. We need to have as few false positives as possible, but
    also we need to keep positive false to the fewest as well because of
    the intersection in the nominator. This requires probably a a subtle
    balance between the parameters
    b - R will be high if we will have as many possible of matching value. We don't care about false positives, we are not punished for them.
    Thus we would like sigma to be low case we dont care about noises,
    and we want H_th, and L_th to be low as well because we don't mind false positives.
    I think just running with low paramters value will yield a high
    performance for R
    c - This pretty much gives us the balance between two measurements
    that can be very differnt 
    
    
  % G + H
%     The parameters are under performance_evaluation
  [results_chruch,results_golf,results_nun] = performance_evaluation_canny("naive");
  
%   best chruch measurements
    figure;
    % sigma  1
    % H_th 4
    % L_th  1
    imshow(canny("Images/Church.jpg",results_chruch(5, 4),results_chruch(5, 5),results_chruch(5, 6)), []);
    % best golf measruement
%     sigma: 2
%     H_th : 4
%     L_th: 1
    figure;
    imshow(canny("Images/Golf.jpg",results_golf(9, 4),results_golf(9, 5),results_golf(9, 6)), []);
    % best nuns measruements
%     sigma: 1
%     H_th : 4
%     L_th: 1
    figure;
    imshow(canny("Images/Nuns.jpg",results_nun(5, 4),results_nun(5, 5),results_nun(5, 6)), []);


%   I

 [results_chruch_re,results_golf_re,results_nun_re] = performance_evaluation_canny("regular");
 best_res =  max(results_chruch_re(:,3))
 figure;
 imshow(canny("Images/Church.jpg",3,4,2), []);
 
%  The result do not remain the same. The R results are much better than in
%  the naive version.
%  The results in the naive version that were good remained good with the
%  imdilate, but there are new results that weren't so good in the naive
%  version that are very good now. This has a pretty simple explanation.
% Some areas in the image that should have had a match in the naive
% evaluation, did not have match because of digitization .
% For example mshow(canny("Images/Church.jpg",5,4,3), []); did not receive
% a high result in the naive, but did actually did not receive bad result
% in the evaluate.
  