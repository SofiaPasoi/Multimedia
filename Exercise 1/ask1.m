image=imread('/home/adminn/Desktop/cameraman.tif');

dctImage=dct2(image);
[x,y]=size(image); %vriskw to megethos gia na tin diatreksw
copy=dctImage;

midenismenoi=0;

for i=1:x
    for j=1:y
      value=abs(d(i,j)); %vriskw to apolyto 
      
      if(value<20) % kanw tin sygrisi
        copy(i,j)=0;
        midenismenoi=midenismenoi+1;
      end
    end
end


antistrofo=idct2(copy);
new=uint8(antistrofo);

imshow(new);

display(midenismenoi);

squaredErrorImage = (double(image) - double(dctImage)) .^ 2;
mse = sum(sum(squaredErrorImage)) / (x * y);

PSNR = 10 * log10( 256^2 / mse);
PSNR







 

     
