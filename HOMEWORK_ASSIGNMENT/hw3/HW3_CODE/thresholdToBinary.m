%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function img_bin=thresholdToBinary(img,thresh)
[m,n]=size(img);
img_bin=zeros(m,n);
for i=1:m
    for j=1:n
        if img(i,j)>thresh
            img_bin(i,j)=1;
        else
            img_bin(i,j)=0;
        end
    end
end


end