%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function binarized=threshBinarize(img,thresh)
[m,n]=size(img);
imgpmf=imgHist(img);
imgcdf=imgCDF(imgpmf);
lencdf=length(imgcdf);
value=floor(imgcdf(1,lencdf)*thresh);

for i=1:(lencdf-1)
    if imgcdf(1,i)<=value && value <= imgcdf(1,i+1)
        distance1=value-imgcdf(1,i);
        distance2=imgcdf(1,i+1)-value;
        if distance1 > distance2
            threshtrans=i;
        else
            threshtrans=i-1;
        end
    end
end
 
binarized=zeros(m,n);

for i=1:m
    for j=1:n
        if img(i,j) >= threshtrans
            binarized(i,j)=255;
        else
            binarized(i,j)=0;
        end
    end
end


end