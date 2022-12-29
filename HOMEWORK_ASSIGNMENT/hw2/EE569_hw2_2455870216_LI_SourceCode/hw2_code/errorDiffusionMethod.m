%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function pic_errordiffusion=errorDiffusionMethod(pic,diffmatrix)
[m,n]=size(pic);

[row,col]=size(diffmatrix);
pic_padded=zeroPadding(pic,row,col);

rowpadwidth=floor(row/2);
colpadwidth=floor(col/2);

[y,z]=size(pic_padded);
pic_thresh_padded=zeros(y,z);

diffmatrix_sym=symmetricalOperation(diffmatrix);
EDMthresh=floor(255*0.5);

for i=1:m
    res=mod(i,2);
    switch res
        case 1
            for j=1:n
                if pic_padded(i+rowpadwidth,j+colpadwidth) <= EDMthresh
                    pic_thresh_padded(i+rowpadwidth,j+colpadwidth)=0;
                else
                    pic_thresh_padded(i+rowpadwidth,j+colpadwidth)=255;
                end
                error=pic_padded(i+rowpadwidth,j+colpadwidth)-pic_thresh_padded(i+rowpadwidth,j+colpadwidth);
                
                for p=1:row
                    for q=1:col
                        pic_padded(i+p-1,j+q-1)=pic_padded(i+p-1,j+q-1)+error*diffmatrix(p,q);
                    end
                end
                
            end
            
        otherwise
            for j=n:-1:1
                
                if pic_padded(i+rowpadwidth,j+colpadwidth) <= EDMthresh
                    pic_thresh_padded(i+rowpadwidth,j+colpadwidth)=0;
                else
                    pic_thresh_padded(i+rowpadwidth,j+colpadwidth)=255;
                end
                error=pic_padded(i+rowpadwidth,j+colpadwidth)-pic_thresh_padded(i+rowpadwidth,j+colpadwidth);
                
                for p=1:row
                    for q=1:col
                        pic_padded(i+p-1,j+q-1)=pic_padded(i+p-1,j+q-1)+error*diffmatrix_sym(p,q);
                    end
                end
                
            end
    end
end

pic_errordiffusion=zeros(m,n);

for i=1:m
    for j=1:n
        pic_errordiffusion(i,j)=pic_thresh_padded(i+rowpadwidth,j+colpadwidth);
    end
end

end