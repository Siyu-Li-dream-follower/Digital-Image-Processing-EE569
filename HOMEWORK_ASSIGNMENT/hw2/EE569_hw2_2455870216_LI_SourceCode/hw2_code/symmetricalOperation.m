%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgsym=symmetricalOperation(img)
[m,n]=size(img);
nhalf=ceil(n/2);
imgsym=zeros(m,n);
for j=1:nhalf
    for i=1:m
        imgsym(i,j)=img(i,m-j+1);
        imgsym(i,m-j+1)=img(i,j);   
    end
end

end