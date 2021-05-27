image=imread('/home/adminn/Desktop/cameraman.tif');
[rows ,cols]= size(image);

entropy(image)
%%Q1=[ [16 11 10 16 24 40 51 61];[12 12 14 19 26 58 60 55];
%    [14 13 16 24 40 57 69 56];[14 17 22 29 51 87 80 62];
%    [18 22 37 56 68 109 103 77];[24 35 55 64 81 104 113 92];
 %    [49 64 78 87 103 121 120 101];[72 92 95 98 112 100 103 99]
  % ];
 
 
Q1=[ [48 33 30 48 72 120 153 183];[36 36 42 57 78 174 180 165 ];
     [42 39 48 72 120 171 207 168];[142 51 66 87 153 261 240 186];
    [54 66 111 108 204 323 309 231];[72 105 165 192 243 312 339 276];
     [147 192 234 261 309 363 360 303];[216 276 285 294 336 300 309 247]
   ];
%Q1=[ [64 44 40 64 96 160 204 244];[48 48 56 76 104 323 240 220 ];
 %    [56 52 64 96 160 228 276 224 ];[56 68 88 116 204 348 320 248 ];
 %   [72 88 148 224 272 436 412 308];[96 140 220 256 324 416 452 368];
 %   [196 256 312 348 412 484 480 404];[288 368 380 392 448 400 412 396]
  % ];
   
m=1;
while m<=rows
    n=1;
    while n<=cols
        dct_block(m:m+7,n:n+7)=dct2(image(m:m+7,n:n+7)./Q1);
        kvantismeno(m:m+7,n:n+7)=round( dct_block(m:m+7,n:n+7));
        antistrofo(m:m+7,n:n+7)= kvantismeno(m:m+7,n:n+7).*Q1;
        idctantistrofo(m:m+7,n:n+7)= idct2(antistrofo(m:m+7,n:n+7));
        n=n+8;
    end
       
    
    m=m+8;
end
 

% Erotima 6
abs_kblock= uint8(abs(kvantismeno));
entropy(abs_kblock)
 

% Erotima 9
final= uint8(idctantistrofo);
 
% Erotima 10
squaredErrorImage = (double(image) - double(final)) .^ 2;
mse = sum(sum(squaredErrorImage)) / (x * y);

PSNR = 10 * log10( 256^2 / mse);
PSNR
 
imshow(final);
  
%figure;imagesc(img_new);colormap(gray);  