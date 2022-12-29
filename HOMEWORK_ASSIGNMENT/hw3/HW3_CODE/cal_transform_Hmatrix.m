%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function Hmatrix = cal_transform_Hmatrix(matched_on_side, matched_on_middle)

%%%%% It is calculated from (0,0), -1 is mandatory in use.
[m, ~] = size(matched_on_side);
a = zeros(2*m, 8);
b = zeros(2*m, 1);
matched_on_side = matched_on_side-1;
matched_on_middle = matched_on_middle-1;

for i=1:m
    a(2*i - 1, :) = [matched_on_side(i,1), matched_on_side(i,2), 1, 0, 0, 0,...
        -matched_on_side(i,1)*matched_on_middle(i,1), -matched_on_side(i,2)*matched_on_middle(i,1)];
    a(2*i, :) = [0, 0, 0, matched_on_side(i,1), matched_on_side(i,2), 1,...
        -matched_on_side(i,1)*matched_on_middle(i,2), -matched_on_side(i,2)*matched_on_middle(i,2)];
    
    b(2*i - 1) = matched_on_middle(i,1);
    b(2*i) = matched_on_middle(i,2);
end

temp = a \ b;

tempnew=ones(9,1);
for i=1:8
    tempnew(i,1)=temp(i,1);
end

Hmatrix = zeros(3,3);
index = 1;

for i=1:3
    for j=1:3
        Hmatrix(i,j) = tempnew(index);
        index = index + 1;
    end
end

end
