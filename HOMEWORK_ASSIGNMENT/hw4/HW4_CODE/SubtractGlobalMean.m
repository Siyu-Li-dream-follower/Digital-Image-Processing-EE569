%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function img_out=SubtractGlobalMean(img)
[m,n]=size(img);
img_out=zeros(m,n);
total_sum=0;
for i=1:m
    for j=1:n
        total_sum=total_sum+img(i,j);
    end
end
mean=total_sum/(m*n);
for i=1:m
    for j=1:n
        img_out(i,j)=img(i,j)-mean;
    end
end

end