%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function magnitude=finalGradientMap(x_sobel,y_sobel)
[m,n]=size(x_sobel);
magnitude=zeros(m,n);

for i=1:m
    for j=1:n
        magnitude(i,j)=sqrt(x_sobel(i,j)^2+y_sobel(i,j)^2);
    end
end

end