%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function filterimg=filterOperation(img,kernel)
[m,n]=size(img);
[km,kn]=size(kernel);
pad_length=floor(km);
imgpad=hw4ReflecPadding(img,pad_length);
filterimg=zeros(m,n);

for i=1:m
    for j=1:n
        
        for p=1:km
            for q=1:kn
                filterimg(i,j)=filterimg(i,j)+imgpad(i+p-1,j+q-1)*kernel(p,q);
            end
        end
        
    end
end

end