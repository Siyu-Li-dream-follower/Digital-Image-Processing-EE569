%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function img_padded=zeroPadding(img,rowker,colker)
[m,n]=size(img);
rowside=floor(rowker/2);
colside=floor(colker/2);
img_padded=zeros(m+2*rowside,n+2*colside);
for i=1:m
    for j=1:n
        img_padded(i+rowside,j+colside)=img(i,j);
    end
end

end