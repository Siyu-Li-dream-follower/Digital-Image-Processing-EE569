%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
%%%%% This Function is written by myself by following the flowchart from
%%%%% the paper rather than open source code looked up on the internet.
function filterimg=NLmeansfilter(img,rsmall,rlarge,h,sigma)
[m,n]=size(img);
filterimg=zeros(m,n);
imgpadded=universalPadding(img,rsmall);
convcore=zeros(2*rsmall+1,2*rsmall+1); % core center: rsmall+1
for i=1:2*rsmall+1
    for j=1:2*rsmall+1
        convcore(i,j)=(1/sqrt(2*pi*sigma^2))*exp(-((i-rsmall-1)^2+(j-rsmall-1)^2)/(2*sigma^2));
    end
end         % two times of normalization, one is small window comparison, another is to sum up all small window comparison value to calculate the pixel in filtered image
normconvcore=coreNormalization(convcore);
for i=1:m
    for j=1:n
        centerwindow=imgpadded(i:i+2*rsmall,j:j+2*rsmall); % for neighborhood pixel window, it varies with k,l, we will define it later
        rowmin_neiPixelWindow=max(1+rsmall,i+rsmall-rlarge);
        rowmax_neiPixelWindow=min(i+rsmall+rlarge,m+rsmall);
        colmin_neiPixelWindow=max(1+rsmall,j+rsmall-rlarge);
        colmax_neiPixelWindow=min(n+rsmall,j+rsmall+rlarge);
        filteredvalue=0;
        sum=0;
        weight=zeros(1+2*rsmall,1+2*rsmall);
        for k=rowmin_neiPixelWindow:rowmax_neiPixelWindow
            for l=colmin_neiPixelWindow:colmax_neiPixelWindow
                neiPixelWindow=imgpadded(k-rsmall:k+rsmall,l-rsmall:l+rsmall);
                summation=0;
                for p=1:1+2*rsmall
                    for q=1:1+2*rsmall
                        summation=summation+normconvcore(p,q)*(centerwindow(p,q)-neiPixelWindow(p,q))^2;
                    end
                end
                weight(k,l)=exp(-summation/(h^2));
            end
        end
                normweight=coreNormalization(weight);
                for k=rowmin_neiPixelWindow:rowmax_neiPixelWindow
                    for l=colmin_neiPixelWindow:colmax_neiPixelWindow
                        filteredvalue=filteredvalue+normweight(k,l)*imgpadded(k,l);
                    end
                end
                filterimg(i,j)=filteredvalue;
    end
end

end