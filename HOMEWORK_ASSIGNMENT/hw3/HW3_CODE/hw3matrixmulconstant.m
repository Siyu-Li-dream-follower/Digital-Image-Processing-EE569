%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgout=hw3matrixmulconstant(img,constant)
[m,n]=size(img);
imgout=zeros(m,n);
for i=1:m
    for j=1:n
        imgout(i,j)=img(i,j)*constant;
    end
end

end