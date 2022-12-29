%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function noisevar=noisevariance(noiseimg)
[m,n]=size(noiseimg);
noise_avg=noiseaverage(noiseimg);
noisevar=0;

for i=1:m
    for j=1:n
        noisevar=noisevar+(noiseimg(i,j)-noise_avg)^2;
    end
end

denomin=m*n;
noisevar=noisevar/denomin;

end