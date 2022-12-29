%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function filterimg=oliPaintingFilter(img,r)
[m,n]=size(img);
imgpadded=universalPadding(img,r);
filterimg=zeros(m,n);
convcore=zeros(2*r+1,2*r+1);

for i=1:m
    for j=1:n
        for p=1:2*r+1
            for q=1:2*r+1
                convcore(p,q)=imgpadded(i+p-1,j+q-1);
            end
        end
        filterimg(i,j)=findCoreMode(convcore);
    end
end

end