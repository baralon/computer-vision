function [results_chruch,results_golf,results_nun] = performance_evaluation_canny(evaluation_type)

church_gt = imread('Images/Church_GT.bmp');
  golf_gt =  imread('Images/Golf_GT.bmp');
  nuns_gt = imread('Images/Nuns_GT.bmp');
  
  parameters = [1 1 1; 
                2 1 1;
                4 1 1;
                1 2 1;
                1 4 1;
                1 2 2;
                1 4 2;
                2 2 1;
                2 4 1;
                2 4 2;
                3 4 2;
                4 4 2;
                4 4 4;
                5 1 1;
                5 2 1;
                5 3 1;
                5 4 1;
                5 4 2;
                5 4 3;
                6 1 1;
                6 2 1;
                6 4 1;
                6 4 2;
                7 1 1;
                7 3 1;
                7 5 1;
                7 5 3;];
   
  [h, w] = size(parameters);
  results_chruch = zeros(h, w + 3);
  results_golf = zeros(h, w + 3);
  results_nun = zeros(h, w + 3);
  
  for i = 1:h
      canny_church = canny('Images/Church.jpg', parameters(i,1), parameters(i,2), parameters(i,3));
      canny_golf = canny('Images/Golf.jpg', parameters(i,1), parameters(i,2), parameters(i,3));
      canny_nuns = canny('Images/Nuns.jpg', parameters(i,1), parameters(i,2), parameters(i,3));
      
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
      results_chruch(i, 4) = parameters(i,1);
      results_chruch(i, 5) = parameters(i,2);
      results_chruch(i, 6) = parameters(i,3);
      
      if (evaluation_type == "naive")
        [P_go, R_go, F_go] = evaluate_naive(canny_golf,golf_gt);
      else
        [P_go, R_go, F_go] = evaluate(canny_golf,golf_gt);
      end
      
      results_golf(i, 1) = P_go;
      results_golf(i, 2) = R_go;
      results_golf(i, 3) = F_go;
      results_golf(i, 4) = parameters(i,1);
      results_golf(i, 5) = parameters(i,2);
      results_golf(i, 6) = parameters(i,3);
      
      
      
      if (evaluation_type == "naive")
        [P_nu, R_nu, F_nu] = evaluate_naive(canny_nuns,nuns_gt);
      else
        [P_nu, R_nu, F_nu] = evaluate(canny_nuns,nuns_gt);
      end
      
      
      results_nun(i, 1) = P_nu;
      results_nun(i, 2) = R_nu;
      results_nun(i, 3) = F_nu;
      results_nun(i, 4) = parameters(i,1);
      results_nun(i, 5) = parameters(i,2);
      results_nun(i, 6) = parameters(i,3);

  end
  
end

