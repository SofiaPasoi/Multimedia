function [b a] = intra_mode(frame, rows,cols, QP)
  
  m=1;
  while m<=rows
    n=1;
    while n<=cols    
      %DCT
      dct(m:m+3,n:n+3)= integer_transform(frame(m:m+3,n:n+3));   
      %KVANTISI
      b(m:m+3,n:n+3)= quantization(dct(m:m+3,n:n+3),QP);    
      %ANTISROFI KVANTISI
      antistrofi_kvantisi(m:m+3,n:n+3)= inv_quantization(b(m:m+3,n:n+3),QP);   
      %ANISTROFOS DCT
      a(m:m+3,n:n+3)= inv_integer_transform(antistrofi_kvantisi(m:m+3,n:n+3));    
       
      n=n+4;
     end   
     m=m+4;
  end
  
endfunction
