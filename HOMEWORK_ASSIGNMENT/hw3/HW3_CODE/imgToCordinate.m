%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [I,J]=imgToCordinate(img)
[m,n]=size(img);
offset_I=floor(m/2)+1;
offset_J=floor(n/2)+1;
I=zeros(1,m);
J=zeros(1,n);

for i=1:m
    for j=1:n
        I(i,j)=i-offset_I;
        J(i,j)=j-offset_J;
    end
end


end