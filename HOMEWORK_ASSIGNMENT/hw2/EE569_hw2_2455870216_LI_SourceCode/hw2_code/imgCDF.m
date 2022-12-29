%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23rd 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgcdf=imgCDF(hist) % hist length 256 only
imgcdf=zeros(1,256);       % most of image have the gray level of 256 so we neither need to enter the array length nor to measure it
temp=0;
for i=1:256
    temp=temp+hist(1,i);
    imgcdf(1,i)=temp;
end

end