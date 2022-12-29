%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function matrixthresh=indextothresh(matrixindex)
[m,n]=size(matrixindex);
matrixthresh=zeros(m,n);
for i=1:m
    for j=1:n
        matrixthresh(i,j)=((matrixindex(i,j)+0.5)/(m*n))*255;
    end
end

end