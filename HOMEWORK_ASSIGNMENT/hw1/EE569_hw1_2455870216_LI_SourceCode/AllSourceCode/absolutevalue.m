%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function absvalue=absolutevalue(img)
[m,n]=size(img);
absvalue=zeros(m,n);
for i=1:m
    for j=1:n
        absvalue(i,j)=abs(img(i,j));
    end
end

end