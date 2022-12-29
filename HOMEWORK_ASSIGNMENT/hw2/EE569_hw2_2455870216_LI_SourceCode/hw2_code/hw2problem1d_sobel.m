%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem1d_sobel()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% a
E = imread('ski_sobel_edge.tif');
E = im2double(E);
fig_count=1;
figure(fig_count);
imshow(E);
fig_count=fig_count+1;
EGT=load('ski_person_GT.mat');
EGT=EGT.groundTruth;
for i=1:length(EGT)
    
    EGTsingleLayer=EGT(i);
    [thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,EGTsingleLayer); %cntP cntR sumP sumR 99*1 double V 4-D double visualization of edge matches
    [P,R,F] = calPRFmean(cntR, sumR, cntP, sumP,thrs); %P R F scalar
    disp(['Precision_sobel_skiperson_ground_truth=',num2str(i) '=',num2str(P)]); % Ground truth 1*5 cell
    disp(['Recall_sobel_skiperson_ground_truth=',num2str(i) '=',num2str(R)]);
    disp(['F_score_sobel_skiperson_ground_truth=',num2str(i) '=',num2str(F)]);
    
end

[thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,EGT); %cntP cntR sumP sumR 99*1 double V 4-D double visualization of edge matches
[P,R,F] = calPRFmean(cntR, sumR, cntP, sumP,thrs); %P R F scalar
disp(['Precision_sobel_skiperson_overall ',num2str(P)]); % Ground truth 1*5 cell
disp(['Recall_sobel_skiperson_overall ',num2str(R)]);
disp(['F_score_sobel_skiperson_overall ',num2str(F)]);
%%%%%%%%%%%%%%%%
[P,R,F]=CalPRGdiffThresh(cntR, sumR, cntP, sumP,thrs);


figure(fig_count);
plot(F);
xlabel('Threshold');
ylabel('F_score');
title('F_score under different thresholds skiperson');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\F_score_under_different_thresholds_skiperson.jpg'];
% saveas(gcf,name);
fig_count=fig_count+1;
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\F_score_under_different_thresholds_skiperson.raw'];
% hw2writeraw(F,name2);

figure(fig_count);
plot(P);
xlabel('Threshold');
ylabel('Precision');
title('Precision under different thresholds skiperson');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Precision_under_different_thresholds_skiperson.jpg'];
% saveas(gcf,name);
fig_count=fig_count+1;
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Precision_under_different_thresholds_skiperson.raw'];
% hw2writeraw(P,name2);

figure(fig_count);
plot(R);
xlabel('Threshold');
ylabel('Recall');
title('Recall under different thresholds skiperson');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Recall_under_different_thresholds_skiperson.jpg'];
% saveas(gcf,name);
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Recall_under_different_thresholds_skiperson.raw'];
% hw2writeraw(R,name2);

%%%%%%%%%%%%%%%%%%% ski_person sobel result
% Precision_sobel_ground_truth=1=0.56956
% Recall_sobel_ground_truth=1=0.42884
% F_score_sobel_ground_truth=1=0.30019
% Precision_sobel_ground_truth=2=0.55878
% Recall_sobel_ground_truth=2=0.41627
% F_score_sobel_ground_truth=2=0.30368
% Precision_sobel_ground_truth=3=0.71572
% Recall_sobel_ground_truth=3=0.40047
% F_score_sobel_ground_truth=3=0.33734
% Precision_sobel_ground_truth=4=0.53331
% Recall_sobel_ground_truth=4=0.4253
% F_score_sobel_ground_truth=4=0.28811
% Precision_sobel_ground_truth=5=0.5725
% Recall_sobel_ground_truth=5=0.43465
% F_score_sobel_ground_truth=5=0.30225
% Precision_sobel_overall 0.74694
% Recall_sobel_overall 0.41921
% F_score_sobel_overall 0.3622

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
E = imread('ele_sobel_edge.tif');
E = im2double(E);
fig_count=fig_count+1;
figure(fig_count);
imshow(E);
fig_count=fig_count+1;
EGT=load('elephant_GT.mat');
EGT=EGT.groundTruth;
for i=1:length(EGT)
    
    EGTsingleLayer=EGT(i);
    [thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,EGTsingleLayer); %cntP cntR sumP sumR 99*1 double V 4-D double visualization of edge matches
    [P,R,F] = calPRFmean(cntR, sumR, cntP, sumP,thrs); %P R F scalar
    disp(['Precision_sobel_elephant_ground_truth=',num2str(i) '=',num2str(P)]); % Ground truth 1*5 cell
    disp(['Recall_sobel_elephant_ground_truth=',num2str(i) '=',num2str(R)]);
    disp(['F_score_sobel_elephant_ground_truth=',num2str(i) '=',num2str(F)]);
    
end

[thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,EGT); %cntP cntR sumP sumR 99*1 double V 4-D double visualization of edge matches
[P,R,F] = calPRFmean(cntR, sumR, cntP, sumP,thrs); %P R F scalar
disp(['Precision_sobel_elephant_overall ',num2str(P)]); % Ground truth 1*5 cell
disp(['Recall_sobel_elephant_overall ',num2str(R)]);
disp(['F_score_sobel_elephant_overall ',num2str(F)]);
%%%%%%%%%%%%%%%%
[P,R,F]=CalPRGdiffThresh(cntR, sumR, cntP, sumP,thrs);


figure(fig_count);
plot(F);
xlabel('Threshold');
ylabel('F_score');
title('F_score under different thresholds elephant');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\F_score_under_different_thresholds_elephant.jpg'];
% saveas(gcf,name);
fig_count=fig_count+1;
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\F_score_under_different_thresholds_elephant.raw'];
% hw2writeraw(F,name2);

figure(fig_count);
plot(P);
xlabel('Threshold');
ylabel('Precision');
title('Precision under different thresholds elephant');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Precision_under_different_thresholds_elephant.jpg'];
% saveas(gcf,name);
fig_count=fig_count+1;
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Precision_under_different_thresholds_elephant.raw'];
% hw2writeraw(P,name2);

figure(fig_count);
plot(R);
xlabel('Threshold');
ylabel('Recall');
title('Recall under different thresholds elephant');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Recall_under_different_thresholds_elephant.jpg'];
% saveas(gcf,name);
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Recall_under_different_thresholds_elephant.raw'];
% hw2writeraw(R,name2);

%%%%%%%%%%%%%%%% elephant_sobel_result
% Precision_sobel_elephant_ground_truth=1=0.39335
% Recall_sobel_elephant_ground_truth=1=0.40375 %num:0.31763012 denomin:0.7971
% F_score_sobel_elephant_ground_truth=1=NaN %%%0.39848 by hand
% Precision_sobel_elephant_ground_truth=2=0.42349
% Recall_sobel_elephant_ground_truth=2=0.42426
% F_score_sobel_elephant_ground_truth=2=0.27687
% Precision_sobel_elephant_ground_truth=3=0.55573
% Recall_sobel_elephant_ground_truth=3=0.4017
% F_score_sobel_elephant_ground_truth=3=0.32188
% Precision_sobel_elephant_ground_truth=4=0.54048
% Recall_sobel_elephant_ground_truth=4=0.43075
% F_score_sobel_elephant_ground_truth=4=0.28657
% Precision_sobel_elephant_ground_truth=5=0.59802
% Recall_sobel_elephant_ground_truth=5=0.42803
% F_score_sobel_elephant_ground_truth=5=0.30855
% Precision_sobel_elephant_overall 0.76973
% Recall_sobel_elephant_overall 0.41566
% F_score_sobel_elephant_overall 0.38143


end