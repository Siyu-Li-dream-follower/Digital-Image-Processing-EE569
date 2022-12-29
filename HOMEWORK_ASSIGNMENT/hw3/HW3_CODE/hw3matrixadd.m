%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgout=hw3matrixadd(img1,img2)
[m,n]=size(img1);
imgout=zeros(m,n);
for i=1:m
    for j=1:n
        imgout(i,j)=img1(i,j)+img2(i,j);
    end
end

end