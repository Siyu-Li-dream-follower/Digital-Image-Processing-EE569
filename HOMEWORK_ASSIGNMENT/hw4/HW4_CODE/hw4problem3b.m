%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw4problem3b()

Dog_1 = im2single(imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\Dog_1.png'));
Dog_2 = im2single(imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\Dog_2.png'));
Dog_3 = im2single(imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\Dog_3.png'));
Cat = im2single(imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\Cat.png'));

Dog_1_gray = single(rgb2gray(Dog_1));
Dog_2_gray = single(rgb2gray(Dog_2));
Dog_3_gray = single(rgb2gray(Dog_3));
Cat_gray = single(rgb2gray(Cat));


%%%%%%%%%%%%%%%% Plot 1
[feature1,descriptor1] = vl_sift(Dog_1_gray,'PeakThresh', 0.015, 'Levels', 4, 'Octaves', 5, 'Magnif', 2);
[feature3,descriptor3] = vl_sift(Dog_3_gray,'PeakThresh', 0.02, 'Levels', 4, 'Octaves', 5, 'Magnif', 2);

[matches, scores] = vl_ubcmatch(descriptor1,descriptor3); % match stores the relative position of 1 and 2 image separately 1st at match(1,:)
[sortindex,~]=bubblesortValueIndex(scores);
matches = matches(:, sortindex) ;
[~,nd1]=size(Dog_1_gray);
%%% plot original image
figcount=1;
figure(figcount);
imagesc(cat(2, Dog_1, Dog_3)) ;
hold on ;
%%% plot matched feature points
xaxis1 = feature1(1,matches(1,:)) ;        % use relative position to find x location and y location x is one f1(1,:) y is on f1(2,:)
xaxis2 = feature3(1,matches(2,:)) + nd1 ; % add column of 1st picture Dog_1 to obtain a image with size of both images combined
yaxis1 = feature1(2,matches(1,:)) ;
yaxis2 = feature3(2,matches(2,:)) ;
coordinate = line([xaxis1 ; xaxis2], [yaxis1 ; yaxis2]) ;
set(coordinate,'linewidth', 1, 'color', 'b') ;
vl_plotframe(feature1(:,matches(1,:))) ;
feature3(1,:) = feature3(1,:) + nd1 ; %%% give an offset on x axis to show on the cat image correctly
vl_plotframe(feature3(:,matches(2,:))) ;
axis image off ;
% filepath=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem3\feature_matchplot1.jpg'];
% saveas(gcf,filepath);
figcount=figcount+1;

%%%%%%%%%%%%%%%%%%%%%% Plot 2 
[feature2,descriptor2] = vl_sift(Dog_2_gray,'PeakThresh', 0.03, 'EdgeThresh',5);
[feature3,descriptor3] = vl_sift(Dog_3_gray, 'PeakThresh', 0.02, 'Levels', 4, 'Octaves', 5, 'Magnif', 2);

[matches, scores] = vl_ubcmatch(descriptor3,descriptor2); 
[sortindex,~]=bubblesortValueIndex(scores);
[~,nd3]=size(Dog_3_gray);
matches = matches(:, sortindex) ;

figure(figcount);
imagesc(cat(2, Dog_3, Dog_2)) ;
hold on ;

xaxis1 = feature3(1,matches(1,:)) ;
xaxis2 = feature2(1,matches(2,:)) + nd3 ;
yaxis1 = feature3(2,matches(1,:)) ;
yaxis2 = feature2(2,matches(2,:)) ;
coordinate = line([xaxis1 ; xaxis2], [yaxis1 ; yaxis2]) ;
set(coordinate,'linewidth', 1, 'color', 'b') ;
vl_plotframe(feature3(:,matches(1,:))) ;
feature2(1,:) = feature2(1,:) + nd3 ;
vl_plotframe(feature2(:,matches(2,:))) ;
axis image off ;
% filepath=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem3\feature_matchplot2.jpg'];
% saveas(gcf,filepath);
figcount=figcount+1;

%%%%%%%%%%%%%%%%%%%% Plot 3
[feature3,descriptor3] = vl_sift(Dog_3_gray,'PeakThresh', 0.02, 'Levels', 4, 'Octaves', 5, 'Magnif', 2);
[feature4,descriptor4] = vl_sift(Cat_gray,'PeakThresh', 0.02, 'Levels', 4, 'Octaves', 5, 'Magnif', 2);

[matches, scores] = vl_ubcmatch(descriptor3,descriptor4); 

[sortindex,~]=bubblesortValueIndex(scores);
matches = matches(:, sortindex) ;

figure(figcount);
imagesc(cat(2, Dog_3, Cat)) ;
hold on ;

xaxis1 = feature3(1,matches(1,:)) ;
xaxis2 = feature4(1,matches(2,:)) + nd3 ;
yaxis1 = feature3(2,matches(1,:)) ;
yaxis2 = feature4(2,matches(2,:)) ;

coordinate = line([xaxis1 ; xaxis2], [yaxis1 ; yaxis2]) ;
set(coordinate,'linewidth', 1, 'color', 'b') ;
vl_plotframe(feature3(:,matches(1,:))) ;
feature4(1,:) = feature4(1,:) + nd3 ;
vl_plotframe(feature4(:,matches(2,:))) ;
axis image off ;
% filepath=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem3\feature_matchplot3.jpg'];
% saveas(gcf,filepath);
figcount=figcount+1;

%%%%%%%%%%%%%%%%%%%%% Plot 4
[feature1,descriptor1] = vl_sift(Dog_1_gray,'PeakThresh', 0.015, 'Levels', 4, 'Octaves', 5, 'Magnif', 2);
[feature4,descriptor4] = vl_sift(Cat_gray, 'PeakThresh', 0.02, 'Levels', 4, 'Octaves', 5, 'Magnif', 2);

[matches, scores] = vl_ubcmatch(descriptor1,descriptor4); 

[sortindex,~]=bubblesortValueIndex(scores);
matches = matches(:, sortindex) ;

figure(figcount);
imagesc(cat(2, Dog_1, Cat)) ;
hold on ;

xaxis1 = feature1(1,matches(1,:)) ;
xaxis2 = feature4(1,matches(2,:)) + nd1 ;
yaxis1 = feature1(2,matches(1,:)) ;
yaxis2 = feature4(2,matches(2,:)) ;

coordinate = line([xaxis1 ; xaxis2], [yaxis1 ; yaxis2]) ;
set(coordinate,'linewidth', 1, 'color', 'b') ;
vl_plotframe(feature1(:,matches(1,:))) ;
feature4(1,:) = feature4(1,:) + nd1 ;
vl_plotframe(feature4(:,matches(2,:))) ;
axis image off ;
% filepath=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem3\feature_matchplot4.jpg'];
% saveas(gcf,filepath);

end