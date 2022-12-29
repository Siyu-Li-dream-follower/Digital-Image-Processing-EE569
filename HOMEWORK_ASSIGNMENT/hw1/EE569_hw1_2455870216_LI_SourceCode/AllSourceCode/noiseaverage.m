%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function noiseavg=noiseaverage(noiseimg)
[m,n]=size(noiseimg);
sum=0;

for i=1:m
    for j=1:n
        sum=sum+noiseimg(i,j);
    end
end

denomin=m*n;
noiseavg=sum/denomin;
end