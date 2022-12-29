%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function img_padded=hw3zeroPadding(img,padsize)
[m,n]=size(img);

img_padded=zeros(m+2*padsize,n+2*padsize);
for i=1:m
    for j=1:n
        img_padded(i+padsize,j+padsize)=img(i,j);
    end
end

end