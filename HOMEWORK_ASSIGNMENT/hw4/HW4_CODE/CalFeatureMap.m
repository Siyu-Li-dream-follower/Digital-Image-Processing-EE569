%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function  feature_map_25_layer = CalFeatureMap(img)
[m,n] = size(img);
feature_map_25_layer = zeros(m,n,25);

L5 = [ 1, 4, 6, 4, 1];
E5 = [-1,-2, 0, 2, 1];
S5 = [-1, 0, 2, 0,-1];
W5 = [-1, 2, 0,-2, 1];
R5 = [ 1,-4, 6,-4, 1];

kernel_LESWR=cell(1,5);

kernel_LESWR{1,1}=L5;
kernel_LESWR{1,2}=E5;
kernel_LESWR{1,3}=S5;
kernel_LESWR{1,4}=W5;
kernel_LESWR{1,5}=R5;

kernel_2dfilter=cell(5);

for i=1:5
    for j=1:5
        kernel_2dfilter{i,j}=kernel_LESWR{1,i}'*kernel_LESWR{1,j};
    end
end

for i=1:5
    for j=1:5
        feature_map_25_layer(:,:,i+j)=filterOperation(img,kernel_2dfilter{i,j});
    end
end

end