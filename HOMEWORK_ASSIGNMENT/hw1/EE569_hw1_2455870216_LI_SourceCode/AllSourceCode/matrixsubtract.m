%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function sub=matrixsubtract(ori1,ori2)
[m,n]=size(ori1);
[p,q]=size(ori2);
if m~=p || n~=q
    disp('only matrices have the same size can do subtraction operation');
end
sub=zeros(m,n);
for i=1:m
    for j=1:n
        sub(i,j)=ori1(i,j)-ori2(i,j);
    end
end

end