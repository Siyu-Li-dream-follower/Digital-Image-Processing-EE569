%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function pic_MVBQ=MVBQmethod(r,g,b,FS_core)
[m,n]=size(r);

[row,col]=size(FS_core);
r_padded=zeroPadding(r,row,col);
g_padded=zeroPadding(g,row,col);
b_padded=zeroPadding(b,row,col);

rowpadwidth=floor(row/2);
colpadwidth=floor(col/2);

[y,z]=size(r_padded);
rpixel_transformed=zeros(y,z);
gpixel_transformed=zeros(y,z);
bpixel_transformed=zeros(y,z);

FS_core_sym=symmetricalOperation(FS_core);

for i=1:m
    res=mod(i,2);
    switch res
        case 1
            for j=1:n
%                 
                space = decideMBVQspace(r_padded(i+rowpadwidth,j+colpadwidth),g_padded(i+rowpadwidth,j+colpadwidth),b_padded(i+rowpadwidth,j+colpadwidth));
                
                [rpixel_transformed(i+rowpadwidth,j+colpadwidth),gpixel_transformed(i+rowpadwidth,j+colpadwidth),bpixel_transformed(i+rowpadwidth,j+colpadwidth)] = ...
                    getNearestVertex(space, r_padded(i+rowpadwidth,j+colpadwidth),g_padded(i+rowpadwidth,j+colpadwidth),b_padded(i+rowpadwidth,j+colpadwidth));

                error_r=r_padded(i+rowpadwidth,j+colpadwidth)-rpixel_transformed(i+rowpadwidth,j+colpadwidth);
                error_g=g_padded(i+rowpadwidth,j+colpadwidth)-gpixel_transformed(i+rowpadwidth,j+colpadwidth);
                error_b=b_padded(i+rowpadwidth,j+colpadwidth)-bpixel_transformed(i+rowpadwidth,j+colpadwidth);
                
                for p=1:row
                    for q=1:col
                        r_padded(i+p-1,j+q-1)=r_padded(i+p-1,j+q-1)+error_r*FS_core(p,q);
                        g_padded(i+p-1,j+q-1)=g_padded(i+p-1,j+q-1)+error_g*FS_core(p,q);
                        b_padded(i+p-1,j+q-1)=b_padded(i+p-1,j+q-1)+error_b*FS_core(p,q);
                    end
                end
                
            end
            
        otherwise
            for j=n:-1:1
                
                space = decideMBVQspace(r_padded(i+rowpadwidth,j+colpadwidth),g_padded(i+rowpadwidth,j+colpadwidth),b_padded(i+rowpadwidth,j+colpadwidth));
                
                [rpixel_transformed(i+rowpadwidth,j+colpadwidth),gpixel_transformed(i+rowpadwidth,j+colpadwidth),bpixel_transformed(i+rowpadwidth,j+colpadwidth)] = ...
                    getNearestVertex(space, r_padded(i+rowpadwidth,j+colpadwidth),g_padded(i+rowpadwidth,j+colpadwidth),b_padded(i+rowpadwidth,j+colpadwidth));
               
                error_r=r_padded(i+rowpadwidth,j+colpadwidth)-rpixel_transformed(i+rowpadwidth,j+colpadwidth);
                error_g=g_padded(i+rowpadwidth,j+colpadwidth)-gpixel_transformed(i+rowpadwidth,j+colpadwidth);
                error_b=b_padded(i+rowpadwidth,j+colpadwidth)-bpixel_transformed(i+rowpadwidth,j+colpadwidth);
                
                for p=1:row
                    for q=1:col
                        r_padded(i+p-1,j+q-1)=r_padded(i+p-1,j+q-1)+error_r*FS_core_sym(p,q);
                        g_padded(i+p-1,j+q-1)=g_padded(i+p-1,j+q-1)+error_g*FS_core_sym(p,q);
                        b_padded(i+p-1,j+q-1)=b_padded(i+p-1,j+q-1)+error_b*FS_core_sym(p,q);
                    end
                end
                
            end
            
    end
end


pic_MVBQ=zeros(m,n,3);

for i=1:m
    for j=1:n
        pic_MVBQ(i,j,1)=rpixel_transformed(i+rowpadwidth,j+colpadwidth);
        pic_MVBQ(i,j,2)=gpixel_transformed(i+rowpadwidth,j+colpadwidth);
        pic_MVBQ(i,j,3)=bpixel_transformed(i+rowpadwidth,j+colpadwidth);
    end
end



end
