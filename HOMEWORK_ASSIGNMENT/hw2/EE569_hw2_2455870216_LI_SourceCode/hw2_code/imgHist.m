%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23rd 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function pmf=imgHist(img)          % Calculate histodiagram, pmf here means probability mass function
pmf=zeros(1,256);
[m,n]=size(img);
img=uint8(img);
imgtemp=zeros(m,n);
for i=1:m
    for j=1:n
        imgtemp(i,j)=img(i,j)+1;
    end
end

for k=1:256
    for i=1:m
        for j=1:n
            if imgtemp(i,j)==k
                pmf(1,k)=pmf(1,k)+1;
            end
        end
    end
end

end