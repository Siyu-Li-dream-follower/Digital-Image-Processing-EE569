%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgfiltered=imgMajorPulling(imgori,r)
[m,n]=size(imgori);
imgpad=hw4ReflecPadding(imgori,r);
imgfiltered=zeros(m,n);

for i=1:m
    for j=1:n
        valuehist=zeros(1,255);
       
        for p=1:2*r+1
            for q=1:2*r+1
                valuehist(1,imgpad(i+p-1,j+q-1))=valuehist(1,imgpad(i+p-1,j+q-1))+1;
            end
        end
        [valueindex,~]=bubblesortValueIndex(valuehist);
        imgfiltered(i,j)=valueindex(1,1);
    end
end


end