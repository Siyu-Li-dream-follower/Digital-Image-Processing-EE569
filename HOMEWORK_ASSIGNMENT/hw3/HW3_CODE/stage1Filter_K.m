%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function stage1result_K = stage1Filter_K(bond, img_ori)
[m,n] = size(bond);
imgpad=hw3zeroPadding(img_ori,1);
stage1result_K = zeros(m,n);

for i=1:m
    for j=1:n
        neighborInfo=[imgpad(i,j),imgpad(i,j+1),imgpad(i,j+2),imgpad(i+1,j),imgpad(i+1,j+2),...
            imgpad(i+2,j),imgpad(i+2,j+1),imgpad(i+2,j+2)];
        switch bond(i,j)
            case 4 % 4
                stage1result_K(i,j) = matrixCompare(neighborInfo,[0,1,0,0,1,0,0,0]) || ...
                      matrixCompare(neighborInfo,[0,1,0,1,0,0,0,0]) || ...
                      matrixCompare(neighborInfo,[0,0,0,1,0,0,1,0]) || ...
                      matrixCompare(neighborInfo,[0,0,0,0,1,0,1,0]) || ...
                      ... % 5
                      matrixCompare(neighborInfo,[0,0,1,0,1,0,0,1]) || ...
                      matrixCompare(neighborInfo,[1,1,1,0,0,0,0,0]) || ...
                      matrixCompare(neighborInfo,[1,0,0,1,0,1,0,0]) || ...
                      matrixCompare(neighborInfo,[0,0,0,0,0,1,1,1]);
            case 6 % 9
                stage1result_K(i,j) = matrixCompare(neighborInfo,[1,1,1,0,1,0,0,0]) || ...
                      matrixCompare(neighborInfo,[0,1,1,0,1,0,0,1]) || ...
                      matrixCompare(neighborInfo,[1,1,1,1,0,0,0,0]) || ...
                      matrixCompare(neighborInfo,[1,1,0,1,0,1,0,0]) || ...
                      matrixCompare(neighborInfo,[1,0,0,1,0,1,1,0]) || ...
                      matrixCompare(neighborInfo,[0,0,0,1,0,1,1,1]) || ...
                      matrixCompare(neighborInfo,[0,0,0,0,1,1,1,1]) || ...
                      matrixCompare(neighborInfo,[0,0,1,0,1,0,1,1]);
            case 7 % 10
                stage1result_K(i,j) = matrixCompare(neighborInfo,[1,1,1,0,1,0,0,1]) || ...
                      matrixCompare(neighborInfo,[1,1,1,1,0,1,0,0]) || ...
                      matrixCompare(neighborInfo,[1,0,0,1,0,1,1,1]) || ...
                      matrixCompare(neighborInfo,[0,0,1,0,1,1,1,1]);
            case 8 % 11
                stage1result_K(i,j) = matrixCompare(neighborInfo,[0,1,1,0,1,0,1,1]) || ...
                      matrixCompare(neighborInfo,[1,1,1,1,1,0,0,0]) || ...
                      matrixCompare(neighborInfo,[1,1,0,1,0,1,1,0]) || ...
                      matrixCompare(neighborInfo,[0,0,0,1,1,1,1,1]);
            case 9 % 12
                stage1result_K(i,j) = matrixCompare(neighborInfo,[1,1,1,0,1,0,1,1]) || ...
                      matrixCompare(neighborInfo,[0,1,1,0,1,1,1,1]) || ...
                      matrixCompare(neighborInfo,[1,1,1,1,1,1,0,0]) || ...
                      matrixCompare(neighborInfo,[1,1,1,1,1,0,0,1]) || ...
                      matrixCompare(neighborInfo,[1,1,1,1,0,1,1,0]) || ...
                      matrixCompare(neighborInfo,[1,1,0,1,0,1,1,1]) || ...
                      matrixCompare(neighborInfo,[1,0,0,1,1,1,1,1]) || ...
                      matrixCompare(neighborInfo,[0,0,1,1,1,1,1,1]);
            case 10 % 13
                stage1result_K(i,j) = matrixCompare(neighborInfo,[1,1,1,0,1,1,1,1]) || ...
                      matrixCompare(neighborInfo,[1,1,1,1,1,1,0,1]) || ...
                      matrixCompare(neighborInfo,[1,1,1,1,0,1,1,1]) || ...
                      matrixCompare(neighborInfo,[1,0,1,1,1,1,1,1]);
            case 11 % 14
                stage1result_K(i,j) = matrixCompare(neighborInfo,[1,1,1,1,1,0,1,1]) || ...
                      matrixCompare(neighborInfo,[1,1,1,1,1,1,1,0]) || ...
                      matrixCompare(neighborInfo,[1,1,0,1,1,1,1,1]) || ...
                      matrixCompare(neighborInfo,[0,1,1,1,1,1,1,1]);
            otherwise
                stage1result_K(i,j) = 0;
        end
    end
end
end