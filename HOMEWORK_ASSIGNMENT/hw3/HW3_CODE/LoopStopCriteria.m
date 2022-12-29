%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function logicvalue=LoopStopCriteria(img1,img2)
[m,n]=size(img1);
imgdiff=zeros(m,n);
for i=1:m
    for j=1:n
        imgdiff(i,j)=abs(img1(i,j)-img2(i,j));
    end
end

logicvalue=0;

for i=1:m
    for j=1:n
        logicvalue=logicvalue+imgdiff(i,j);
    end
end



end