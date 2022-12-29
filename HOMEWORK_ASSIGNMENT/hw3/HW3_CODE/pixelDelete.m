%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgnew = pixelDelete(img, existanceMap)

[m,n] = size(img);
imgnew=zeros(m,n);
for i=1:m
    for j=1:n
        
        if existanceMap(i,j) == 1
            imgnew(i,j) = 0;
        else
            imgnew(i,j)=img(i,j);
        end
        
    end
end


end