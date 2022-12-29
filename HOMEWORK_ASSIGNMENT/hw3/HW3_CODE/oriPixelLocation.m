%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [J, I] = oriPixelLocation(n, m)

J = zeros(m, n); %% represent x
I = zeros(m, n); %% represent y
for i=1:m
    for j=1:n
        I(i,j) = i;
        J(i,j) = j;
    end
end

end