function [results_chruch,results_golf,results_nun] = performance_evaluation_sobel(evaluation_type)
%PERFORMANCE_EVALUATION_SOBEL Summary of this function goes here
%   Detailed explanation goes here
church_gt = imread('Images/Church_GT.bmp');
golf_gt =  imread('Images/Golf_GT.bmp');
nuns_gt = imread('Images/Nuns_GT.bmp');
  
  parameters = [1:100];
  [h,w] = size(parameters);
  results_chruch = zeros(27, 4);
  results_golf = zeros(27, 4);
  results_nun = zeros(27, 4);
  
  for i = 1:w
      canny_church = sobel('Images/Church.jpg', i);
      canny_golf = sobel('Images/Golf.jpg',i);
      canny_nuns = sobel('Images/Nuns.jpg', i);
      
      canny_church(canny_church > 0) = 1;
      canny_golf(canny_golf > 0) = 1;
      canny_nuns(canny_nuns > 0) = 1;
      
      if (evaluation_type == "naive")
        [P_ch, R_ch, F_ch] = evaluate_naive(canny_church,church_gt);
      else
        [P_ch, R_ch, F_ch] = evaluate(canny_church,church_gt);
      end
      
      
      results_chruch(i, 1) = P_ch;
      results_chruch(i, 2) = R_ch;
      results_chruch(i, 3) = F_ch;
      results_chruch(i, 4) = i;;
      
      if (evaluation_type == "naive")
        [P_go, R_go, F_go] = evaluate_naive(canny_golf,golf_gt);
      else
        [P_go, R_go, F_go] = evaluate(canny_golf,golf_gt);
      end
      
      results_golf(i, 1) = P_go;
      results_golf(i, 2) = R_go;
      results_golf(i, 3) = F_go;
      results_golf(i, 4) = i;
      
      if (evaluation_type == "naive")
        [P_nu, R_nu, F_nu] = evaluate_naive(canny_nuns,nuns_gt);
      else
        [P_nu, R_nu, F_nu] = evaluate(canny_nuns,nuns_gt);
      end
      
      results_nun(i, 1) = P_nu;
      results_nun(i, 2) = R_nu;
      results_nun(i, 3) = F_nu;
      results_nun(i, 4) = i;
  end
end

