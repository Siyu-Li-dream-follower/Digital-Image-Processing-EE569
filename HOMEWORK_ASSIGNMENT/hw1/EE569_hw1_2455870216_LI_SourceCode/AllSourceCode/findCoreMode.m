%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function modeconvcore=findCoreMode(convcore)
[m,n]=size(convcore);

restoration=zeros(1,256);
for i=1:m
    for j=1:n
        restoration(1,convcore(i,j))=restoration(1,convcore(i,j))+1;
    end
end
maxres=max(restoration);
count=0;
modeconvcore=0;
for k=1:256                        % the case that one faces multiple may ocurr
    if restoration(1,k)==maxres
        modeconvcore=modeconvcore+k;
        count=count+1;
    end
end
modeconvcore=modeconvcore/count;

end