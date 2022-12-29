%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgthresh=randomthreshold(img)
[m,n]=size(img);
imgthresh=zeros(m,n);
for i=1:m
    for j=1:n
        thresh=randi(255);
        if img(i,j)>=thresh
            imgthresh(i,j)=255;
        else
            imgthresh(i,j)=0;
        end
    end
end

end