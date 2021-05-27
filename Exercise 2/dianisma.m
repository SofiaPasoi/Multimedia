function [DI] = dianisma(frame1,frame2,rows,cols)
q=4;%an thelw na valw kai gia [-8,8] aplws tha allaksw tin timi mias metavlitis --> q=8

m=1;
  while m<=rows
    
  n=1;
    while n<=cols
      count=0;
      x=-q;
      while(x>=-q) && (x<=q)
        y=-q;
        while(y>=-q) && (y<=q)
          
          if(m+x>=1 && n+y>=1 && (m+x+15)<=rows && (n+y+15)<=cols) %elgxw an eimai entos oriwn
            value1=frame1(m:(m+15),n:(n+15))-frame2(m+x :(m+x +15),n+y:(n+y+15)); %vriskw ti diafora
            value2=abs(value1);% vriskw to apoluto
            SAD=sum(sum(value2));%vriskw to athroisma
            
            if (count==0 || SAD<k) %efarmozw to kritirio
                k=SAD;
                newX=x;
                newY=y; 
                count=1;
            end
            
          end
          
          y=y+1;  
        end
        x=x+1;
      end
      DI(m:(m+15),n:(n+15))=frame2(m+newX :(m+newX+15),n+newY:(n+newY+15)); %pairnw tin provlepsi
      n=n+16;
    end
    m=m+16;
  end
  
end

 
 
