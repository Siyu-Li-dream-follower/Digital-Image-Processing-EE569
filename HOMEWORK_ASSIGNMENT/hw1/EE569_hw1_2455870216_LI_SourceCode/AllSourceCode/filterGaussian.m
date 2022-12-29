%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function filterimg=filterGaussian(img,r,sigma)
[m,n]=size(img);
new_img=universalPadding(img,r);
filterimg=zeros(m,n);%convcorecenter=r+1;
convcore=zeros(2*r+1,2*r+1);

for i=1:2*r+1
    for j=1:2*r+1
        convcore(i,j)=(1/sqrt(2*pi*sigma^2))*exp(-((i-(r+1))^2+(j-(r+1))^2)/(2*sigma^2));
    end
end

normconvcore=coreNormalization(convcore);

for i=1:m
    for j=1:n
        sum=0;
        for p=1:2*r+1
            for q=1:2*r+1
                sum=sum+normconvcore(p,q)*new_img(i+p-1,j+q-1);
            end
        end
        filterimg(i,j)=sum;
    end
end

end