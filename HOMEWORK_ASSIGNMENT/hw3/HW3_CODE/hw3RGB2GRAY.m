%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function gray=hw3RGB2GRAY(img)
[m,n,d]=size(img);
r=img(:,:,1);
g=img(:,:,2);
b=img(:,:,3);
gray=zeros(m,n);
for i=1:m
    for j=1:n
        gray(i,j)=0.2989*r(i,j)+0.5870 *g(i,j)+0.1140*b(i,j);
    end
end


end