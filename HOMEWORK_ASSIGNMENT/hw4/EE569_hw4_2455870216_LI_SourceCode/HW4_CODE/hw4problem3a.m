%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw4problem3a()
%addpath(genpath('D:\MATLAB2020a\vlfeat-0.9.21'));
% run('D:\MATLAB2020a\vlfeat-0.9.21\toolbox\vl_setup');
% 
% vl_version verbose
Dog_1 = im2single(imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\Dog_1.png'));
Dog_3 = im2single(imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\Dog_3.png'));

Dog_1_g = single(rgb2gray(Dog_1));
Dog_3_g = single(rgb2gray(Dog_3));

[feature1,descriptor1] = vl_sift(Dog_1_g);
[feature3,descriptor3] = vl_sift(Dog_3_g);

scale_vector_dog3 = feature3(3, :); %%% the third row contains the scales
[maxindex_3,~]=bubblesortValueIndex(scale_vector_dog3);
d3_max = descriptor3(:, maxindex_3(1,1));
f3_max = feature3(:, maxindex_3(1,1));

%%%% kdtree search
kdtree=vl_kdtreebuild(double(descriptor1));
[mindistance_index,~]=vl_kdtreequery(kdtree,double(descriptor1),double(d3_max));
point_matched_f=feature1(:,mindistance_index);
%point_matched_d=descriptor1(:,mindistance_index);

figcount=1;
figure(figcount);
imshow(Dog_3);
hold on
imgoutput1 = vl_plotframe(f3_max) ; 
set(imgoutput1,'color','y','linewidth',5);
figcount=figcount+1;

figure(figcount);
imshow(Dog_1);
hold on
imgoutput2 = vl_plotframe(point_matched_f) ;
set(imgoutput2,'color','y','linewidth',5);

end