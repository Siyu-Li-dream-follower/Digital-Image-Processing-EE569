%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [ISource,JSource]=EGMwrapPointReverseMapping(IDest,JDest)
[m,n] = size(IDest);

ISource = zeros(m,n);
JSource = zeros(m,n);

offset_I=floor(m/2)+1;
offset_J=floor(n/2)+1;

for i=1:m
    for j=1:n
        IDest(i,j)=IDest(i,j)*(2/m);
    end
end

for i=1:m
    for j=1:n
        JDest(i,j)=JDest(i,j)*(2/n);
    end
end

for i=1:m
    for j=1:n
        ISource(i,j) = 0.5 * sqrt(2 + IDest(i,j)^2 - JDest(i,j)^2 + 2 * sqrt(2) * IDest(i,j)) - ...
            0.5 * sqrt(2 + IDest(i,j)^2 - JDest(i,j)^2 - 2 * sqrt(2) * IDest(i,j));
        JSource(i,j) = 0.5 * sqrt(2 - IDest(i,j)^2 + JDest(i,j)^2 + 2 * sqrt(2) * JDest(i,j)) ...
            - 0.5 * sqrt(2 - IDest(i,j)^2 + JDest(i,j)^2 - 2 * sqrt(2) * JDest(i,j));
    end
end

for i=1:m
    for j=1:n
        ISource(i,j)=ISource(i,j)*(m/2)+offset_I;
    end
end

for i=1:m
    for j=1:n
        JSource(i,j)=JSource(i,j)*(n/2)+offset_J;
    end
end




end