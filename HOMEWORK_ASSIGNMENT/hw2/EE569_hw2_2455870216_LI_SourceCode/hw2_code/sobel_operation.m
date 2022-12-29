%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [x_sobel,y_sobel]=sobel_operation(grayimg)
[m,n] = size(grayimg);
x_sobel = zeros(m,n);
y_sobel = zeros(m,n);
mask_x = [-1, 0, 1;
    -2, 0, 2;
    -1, 0, 1];
mask_y_temp=symmetricalOperation(mask_x);
mask_y=HW2MatrixTranspose(mask_y_temp);

grayimg_padded = universalReflecPadding(grayimg, 1);


for i=1:m
    for j=1:n
        
        for p=1:3
            for q=1:3
                x_sobel(i,j) = x_sobel(i,j) + grayimg_padded(i+p-1, j+q-1)*mask_x(p,q);
            end
        end
        x_sobel(i,j) = abs(x_sobel(i,j));
    end
end

for i=1:m
    for j=1:n
        
        for p=1:3
            for q=1:3
                y_sobel(i,j) = y_sobel(i,j) + grayimg_padded(i+p-1, j+q-1)*mask_y(p,q);
            end
        end
        y_sobel(i,j) = abs(y_sobel(i,j));
        
    end
end


end