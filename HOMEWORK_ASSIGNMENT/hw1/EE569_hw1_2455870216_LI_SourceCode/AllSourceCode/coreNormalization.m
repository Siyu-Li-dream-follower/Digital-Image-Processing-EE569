%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function normconvcore=coreNormalization(convcore)
[m,n]=size(convcore);
sum=0;
for i=1:m
    for j=1:n
        sum=sum+convcore(i,j);
    end
end

normconvcore=zeros(m,n);

for i=1:m
    for j=1:n
        normconvcore(i,j)=convcore(i,j)/sum;
    end
end

end