%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function normgrad=gradientNorm(origrad)
[m,n]=size(origrad);

maxseries=-10000*ones(1,m);
minseries=10000*ones(1,m);
max=-10000;
min=10000;

for i=1:m
    for j=1:n
        if origrad(i,j) > maxseries(1,i)
            maxseries(1,i)=origrad(i,j);
        end
        
        if origrad(i,j) < minseries(1,i)
            minseries(1,i)=origrad(i,j);
        end
    end
    
    if maxseries(1,i) > max
        max=maxseries(1,i);
    end
    if minseries(1,i) < min
        min=minseries(1,i);
    end
    
end

normgrad=zeros(m,n);

for i=1:m
    for j=1:n
        normgrad(i,j)=(255*(origrad(i,j)-min)) / (max-min);
    end
end


end

