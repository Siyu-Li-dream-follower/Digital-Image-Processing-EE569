%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function indexoritemp=indexPadding(indexori,k)
[m,n]=size(indexori);
indexoritemp=indexori;
for time=1:k
    indextemp=zeros(m*(2^time),n*(2^time));
    range_m=m*(2^(time-1));
    range_n=n*(2^(time-1));
    for i=1:range_m
        for j=1:range_n
            indextemp(i,j)=1+4*indexoritemp(i,j);
            indextemp(i+range_m,j)=3+4*indexoritemp(i,j);
            indextemp(i,j+range_n)=2+4*indexoritemp(i,j);
            indextemp(i+range_m,j+range_n)=4*indexoritemp(i,j);
        end
    end
    indexoritemp=zeros(m*(2^time),n*(2^time));
    indexoritemp=indextemp;
end

end
