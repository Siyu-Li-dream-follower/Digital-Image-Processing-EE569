%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function halftoned_img=ditheringOperation(img,threshindex)
[p,q]=size(threshindex);
[m,n]=size(img);

halftoned_img=zeros(m,n);
num_row=ceil(m/p);
num_col=ceil(n/q);
imgpad=zeros(num_row*p,num_col*q);

for i=1:m
    for j=1:n
        imgpad(i,j)=img(i,j);
    end
end

halftoned_result=zeros(num_row*p,num_col*q);

for i=1:num_row
    for j=1:num_col
        for k=1:p
            for l=1:q
                if imgpad((i-1)*p+k,(j-1)*q+l) <= threshindex(k,l)
                    halftoned_result((i-1)*p+k,(j-1)*q+l)=0;
                else
                    halftoned_result((i-1)*p+k,(j-1)*q+l)=255;
                end
            end
        end
    end
end

halftoned_img=halftoned_result(1:m,1:n);

end