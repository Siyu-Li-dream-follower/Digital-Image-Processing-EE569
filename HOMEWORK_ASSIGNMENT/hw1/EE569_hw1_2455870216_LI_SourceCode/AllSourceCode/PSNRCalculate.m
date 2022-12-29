%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function PSNR = PSNRCalculate(img1, img2)
[m,n]=size(img1);
% convert to doubles
img1=double(img1);
img2=double(img2);
imgdifference=zeros(m,n);
imgdiffsqrt=zeros(m,n);
imgdifference=matrixsubtract(img1,img2);
countzero=0;
%%%Avoid divided by zero
for i=1:m
    for j=1:n
        if imgdifference(i,j)==0
            countzero=countzero+1;
        end
    end
end
if countzero==m*n
    MeanSquareError=0.01;
else
    MeanSquareError=0;
end
for i=1:m
    for j=1:n
        imgdiffsqrt(i,j)=imgdifference(i,j)^2;
    end
end
for i=1:m
    for j=1:n
        MeanSquareError=MeanSquareError+(1/(m*n))*imgdiffsqrt(i,j);
    end
end
PSNR=10*log10(255*255/MeanSquareError);

end