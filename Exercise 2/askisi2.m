fin= fopen('/home/adminn/Desktop/polymesa/frame0.raw','r');
frame0= fread(fin,[176,144])';
fclose(fin);

fin= fopen('/home/adminn/Desktop/polymesa/frame1.raw','r');
frame1= fread(fin,[176,144])';
fclose(fin);

%orizw tis times twn statherwn
QP= 27;
R=64;

%elegxw an oi eikones exoun idio megethos
b=si(frame0,frame1);

if(b==0)%an den exoun idio megethos kalw tis sunartiseis me to diko tous size
   [rows0 cols0]= size(frame0);
   [rows1 cols1]= size(frame1);
   [frame0_kvantisi frame0_antisrofos_dct]=intra_mode(frame0,rows0,cols0,QP);
   [err_kvantisi err_antisrofos_dct]=intra_mode(err,rows1,cols1,QP);
else %an exoyn idio megethos orizw 1 koino size kai kalw me ayto
   [rows cols]=size(frame0);
   [frame0_kvantisi frame0_antisrofos_dct]=intra_mode(frame0,rows,cols,QP);
   [err_kvantisi err_antisrofos_dct]=intra_mode(err,rows1,cols1,QP);
end


display("erotima 2:")
%vriskw to post_scalling gia to frame0
post_scalling=round(frame0_antisrofos_dct/R);

%kalw ti synartisi entrp gia na parv tin entropia
entrp0=entrp(frame0_kvantisi);
entrp0

%emfanizw to post_scalling
ps=post_scalling;
imshow(ps,[]);

%kalw ti synartisi psnr gia na parv to psnr
PSNR0=psnr(frame0,post_scalling,rows,cols);
PSNR0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%kalw ti synartisi dianisma gia na parw tin provlepsi
pr= dianisma(frame1,post_scalling,rows, cols);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

display("erotima 4:")

%vriskw to sfalma afairwntas tin provlepsi apo to arxiko frame1
err=frame1-pr;

%kalw ti synartisi entrp gia na parv tin entropia
entrp1=entrp(err_kvantisi);
entrp1

%vriskw to post_scalling gia to sfalma
post_scalling_err=round(err_antisrofos_dct/R);

% Anadimiourgia frame1
anadimiourgimeno_frame1=pr+post_scalling_err;

%emfanizw to anadimiourgimeno_frame1
figure;
imshow(anadimiourgimeno_frame1,[]);

%kalw ti synartisi psnr gia na parv to psnr
PSNR1=psnr(frame1,anadimiourgimeno_frame1,rows,cols);
PSNR1




