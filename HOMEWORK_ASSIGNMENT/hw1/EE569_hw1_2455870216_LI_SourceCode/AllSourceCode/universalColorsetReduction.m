%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function reducedimg=universalColorsetReduction(img,r)      % 64 color r=4, 512 color r=8.can deal with r whethe it can divide 256 with residual or not
[m,n]=size(img);
reducedimg=zeros(m,n);
for i=1:m
    for j=1:n
        img(i,j)=img(i,j)+1;
    end
end
interval=floor(256/r);
residual=mod(256,r);
reflection=zeros(1,256);

for i=1:r
    if i==r
        minj=(i-1)*interval+1;
        maxj=i*interval+residual;
    else
        minj=(i-1)*interval+1;
        maxj=i*interval;
    end
    for j=minj:maxj        % build a dictionary for look up
        reflection(1,j)=round(0.5*(minj+maxj));
    end
end

for i=1:m
    for j=1:n
        reducedimg(i,j)=reflection(1,img(i,j));
    end
end

end