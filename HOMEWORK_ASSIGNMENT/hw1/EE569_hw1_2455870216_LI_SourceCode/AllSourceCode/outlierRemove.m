%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function filterimg=outlierRemove(img,threshold)
[m,n] = size(img);
imgPadded=universalPadding(img,1);
filterimg=zeros(m,n);

for i =1:m
    for j=1:n
        average = 0.125*(imgPadded(i,j)+imgPadded(i,j+1)+imgPadded(i,j+2)+imgPadded(i+1,j)+ ...
            imgPadded(i+1,j+2)+imgPadded(i+2,j)+imgPadded(i+2,j+1)+imgPadded(i+2,j+2));
        if abs(img(i,j) - average) > threshold
            filterimg(i,j) = average;
        else
            filterimg(i,j)=img(i,j);
        end
    end
end

end