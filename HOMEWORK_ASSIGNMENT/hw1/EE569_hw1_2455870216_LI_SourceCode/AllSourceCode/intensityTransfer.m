%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function transferedimg=intensityTransfer(img,transferfuc)
[m,n]=size(img);
newtranferfuc=zeros(1,257);
newtranferfuc(1,2:257)=transferfuc(1,1:256);     % avoid indexed by zero and meanwhile do not accidently change final image pixel values
transferedimg=zeros(m,n);
for i=1:m
    for j=1:n
        transferedimg(i,j)=newtranferfuc(1,img(i,j)+1); % transferedimg(i,j)=transferfuc(1,img(i,j)+1); The method +1 here is to avoid indexed by zero, but it will make every pixel +1 in the final picture, so we won't use this.
    end
end
end