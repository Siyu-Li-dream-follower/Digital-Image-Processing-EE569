%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function filterimg=bilateralfilter(img,r,sigmac,sigmas)
[m,n]=size(img);
new_img=universalPadding(img,r);
filterimg=zeros(m,n);
convcore=zeros(2*r+1,2*r+1); 
% here you cannot preset the core because the intensity term changes with
% i,j change
       
for i=1:m
    for j=1:n
        sum=0;
        for p=1:2*r+1
            for q=1:2*r+1
                convcore(p,q)=exp(-((1+r-p)^2+(1+r-q)^2)/(2*sigmac^2)-(new_img(i+r,j+r)-new_img(i-1+p,j-1+q))^2/(2*sigmas^2));
            end
        end
        normconvcore=coreNormalization(convcore);
        for p=1:2*r+1
            for q=1:2*r+1
                sum=sum+normconvcore(p,q)*new_img(i-1+p,j-1+q);
            end
        end
        filterimg(i,j)=sum;
    end
end

end