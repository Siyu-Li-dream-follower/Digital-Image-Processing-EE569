%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [sortindex,sortvalue]=bubblesortValueIndex(orivector)
%%% biggest at the front
vec_length=length(orivector);
sortindex=zeros(1,vec_length);
for i=1:vec_length
    sortindex(1,i)=i;
end

for p=1:vec_length
    for q=1:vec_length-p
        if orivector(1,q) < orivector(1,q+1)
            
            temppixelnum=orivector(1,q);
            orivector(1,q)=orivector(1,q+1);
            orivector(1,q+1)=temppixelnum;
            
            tempvalue=sortindex(1,q);
            sortindex(1,q)=sortindex(1,q+1);
            sortindex(1,q+1)=tempvalue;
            
        end
    end
end
sortvalue=orivector;

end