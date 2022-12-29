%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw4problem3c()

Dog_1 = im2single(imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\Dog_1.png'));
Dog_2 = im2single(imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\Dog_2.png'));
Dog_3 = im2single(imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\Dog_3.png'));
Cat = im2single(imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\Cat.png'));

Dog_1_gray = single(rgb2gray(Dog_1));
Dog_2_gray = single(rgb2gray(Dog_2));
Dog_3_gray = single(rgb2gray(Dog_3));
Cat_gray = single(rgb2gray(Cat));

[feature1,descriptor1] = vl_sift(Dog_1_gray, 'PeakThresh', 0.015, 'Levels', 4, 'Octaves', 5, 'Magnif', 2) ;
[feature2,descriptor2] = vl_sift(Dog_2_gray, 'PeakThresh', 0.03, 'EdgeThresh',5) ;
[feature3,descriptor3] = vl_sift(Dog_3_gray, 'PeakThresh', 0.02, 'Levels', 4, 'Octaves', 5, 'Magnif', 2) ;
[feature4,descriptor4] = vl_sift(Cat_gray, 'PeakThresh', 0.02, 'Levels', 4, 'Octaves', 5, 'Magnif', 2) ;

descriptor1 = PrincipleComponentAnalysis(double(descriptor1'), 20); % descriptor 128*252
descriptor2 = PrincipleComponentAnalysis(double(descriptor2'), 20);
descriptor3 = PrincipleComponentAnalysis(double(descriptor3'), 20);
descriptor4 = PrincipleComponentAnalysis(double(descriptor4'), 20);


rmpath('D:\MATLAB2020a\vlfeat-0.9.21\toolbox\noprefix');
[~, center, sumd, d] = kmeans(double([descriptor1, descriptor2, descriptor3, descriptor4]'),8);

%%%%%%%%%%%%% Calculated Ordered Center Matrix
[mcenter,ncenter]=size(center);
distance_ori=zeros(1,mcenter);
for i=1:mcenter
    for j=1:ncenter
        distance_ori(1,i)=distance_ori(1,i)+center(i,j)^2;
    end
end

[index,~]=bubblesortValueIndex(distance_ori);

center_ordered=zeros(mcenter,ncenter);
for i=1:mcenter
    for j=1:ncenter
        center_ordered(index(i),j)=center(i,j);
    end
end

center_ordered=center_ordered';
[mcentero,ncentero]=size(center_ordered); % mcentero 20 ncentero 8

%%%%%%%%%%%% Plot Histogram of Feature of Dog 3
[~, nfeature3] = size(feature3);

feature_class_3 = zeros(1, nfeature3);
for i=1:nfeature3
    dis_des_centero=zeros(1,ncentero);
    for j=1:ncentero
        for k=1:mcentero
            dis_des_centero(1,j)=dis_des_centero(1,j)+(center_ordered(k,j)-descriptor3(k,i))^2;
        end
    end
    [value, class] = min(dis_des_centero);
    feature_class_3(i) = class;
end

hist_dog_3 = zeros(1, 8);
for i = 1:nfeature3
    hist_dog_3(feature_class_3(i)) = hist_dog_3(feature_class_3(i)) + 1;
end

figcount=1;
figure(figcount);
bar(hist_dog_3);
ylim([0 (max(hist_dog_3)+5)])
title('Histogram of Dog_3 Features');
% filepath=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem3\hist_dog3.jpg'];
% saveas(gcf,filepath);
figcount=figcount+1;

%%%%%%%%%%%% Plot Histogram of Feature of Dog 1
[~, nfeature1] = size(feature1);

feature_class_1 = zeros(1, nfeature1);
for i=1:nfeature1
    dis_des_centero=zeros(1,ncentero);
    for j=1:ncentero
        for k=1:mcentero
            dis_des_centero(1,j)=dis_des_centero(1,j)+(center_ordered(k,j)-descriptor1(k,i))^2;
        end
    end
    [value, class] = min(dis_des_centero);
    feature_class_1(i) = class;
end

hist_dog_1 = zeros(1, 8);
for i = 1:nfeature1
    hist_dog_1(feature_class_1(i)) = hist_dog_1(feature_class_1(i)) + 1;
end

figure(figcount);
bar(hist_dog_1);
ylim([0 (max(hist_dog_1)+5)])
title('Histogram of Dog_1 Features');
% filepath=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem3\hist_dog1.jpg'];
% saveas(gcf,filepath);
figcount=figcount+1;

%%%%%%%%%%%% Plot Histogram of Feature of Dog 2
[~, nfeature2] = size(feature2);

feature_class_2 = zeros(1, nfeature2);
for i=1:nfeature2
    dis_des_centero=zeros(1,ncentero);
    for j=1:ncentero
        for k=1:mcentero
            dis_des_centero(1,j)=dis_des_centero(1,j)+(center_ordered(k,j)-descriptor2(k,i))^2;
        end
    end
    [value, class] = min(dis_des_centero);
    feature_class_2(i) = class;
end

hist_dog_2 = zeros(1, 8);
for i = 1:nfeature2
    hist_dog_2(feature_class_2(i)) = hist_dog_2(feature_class_2(i)) + 1;
end

figure(figcount);
bar(hist_dog_2);
ylim([0 (max(hist_dog_2)+5)])
title('Histogram of Dog_2 Features');
% filepath=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem3\hist_dog2.jpg'];
% saveas(gcf,filepath);
figcount=figcount+1;

%%%%%%%%%%%% Plot Histogram of Feature of Cat
[~, nfeature4] = size(feature4);

feature_class_4 = zeros(1, nfeature4);
for i=1:nfeature4
    dis_des_centero=zeros(1,ncentero);
    for j=1:ncentero
        for k=1:mcentero
            dis_des_centero(1,j)=dis_des_centero(1,j)+(center_ordered(k,j)-descriptor4(k,i))^2;
        end
    end
    [value, class] = min(dis_des_centero);
    feature_class_4(i) = class;
end

hist_cat = zeros(1, 8);
for i = 1:nfeature4
    hist_cat(feature_class_4(i)) = hist_cat(feature_class_4(i)) + 1;
end

figure(figcount);
bar(hist_cat);
ylim([0 (max(hist_cat)+5)])
title('Histogram of Cat Features');
% filepath=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem3\hist_cat.jpg'];
% saveas(gcf,filepath);


end