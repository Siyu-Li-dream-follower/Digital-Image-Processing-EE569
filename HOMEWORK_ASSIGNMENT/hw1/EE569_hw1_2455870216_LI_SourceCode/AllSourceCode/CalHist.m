%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function pmf=CalHist(img)          % Calculate histodiagram, pmf here means probability mass function
pmf=zeros(1,256);
[m,n]=size(img);

for k=1:256
    for i=1:m
        for j=1:n
            if img(i,j)==k
                pmf(1,k)=pmf(1,k)+1;
            end
        end
    end
end

end