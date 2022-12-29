%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function labelmap_24=rowToMatrixReshape(label_24,m,n)
[d,~]=size(label_24);
labelmap_24=zeros(m,n,d);
for layer=1:d
    count=1;
    for i=1:m
        for j=1:n
            labelmap_24(i,j,d)=label_24(d,count);
            count=count+1;
        end
    end
end

end