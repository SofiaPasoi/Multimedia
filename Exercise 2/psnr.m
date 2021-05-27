function p = psnr (frame1, frame2, rows,cols)
  squaredErrorImage1 = (double(frame1) - double( frame2)) .^ 2;
  mse1 = sum(sum(squaredErrorImage1)) / (rows * cols);
  p= 10*log10((255^2)/mse1);

endfunction

