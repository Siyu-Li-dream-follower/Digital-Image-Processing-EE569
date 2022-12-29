%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function gray=RGB2GRAY(r,g,b)
[m,n]=size(r);
gray=zeros(m,n);
for i=1:m
    for j=1:n
        gray(i,j)=0.2989*r(i,j)+0.5870 *g(i,j)+0.1140*b(i,j);
    end
end


end