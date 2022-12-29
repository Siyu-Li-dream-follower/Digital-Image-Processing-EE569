%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem1d_structural_edge()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ski_person
E = imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\ski_person_se_edge.tif');
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
    disp(['Precision_structural_edge_skiperson_ground_truth=',num2str(i) '=',num2str(P)]); % Ground truth 1*5 cell
    disp(['Recall_structural_edge_skiperson_ground_truth=',num2str(i) '=',num2str(R)]);
    disp(['F_score_structural_edge_skiperson_ground_truth=',num2str(i) '=',num2str(F)]);
    
end

[thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,EGT); %cntP cntR sumP sumR 99*1 double V 4-D double visualization of edge matches
[P,R,F] = calPRFmean(cntR, sumR, cntP, sumP,thrs); %P R F scalar
disp(['Precision_structural_edge_skiperson_overall ',num2str(P)]); % Ground truth 1*5 cell
disp(['Recall_structural_edge_skiperson_overall ',num2str(R)]);
disp(['F_score_structural_edge_skiperson_overall ',num2str(F)]);
%%%%%%%%%%%%%%%%
[P,R,F]=CalPRGdiffThresh(cntR, sumR, cntP, sumP,thrs);


figure(fig_count);
plot(F);
xlabel('Threshold');
ylabel('F_score');
title('F_score under different thresholds skiperson structural edge');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\F_score_under_different_thresholds_skiperson_structural_edge.jpg'];
saveas(gcf,name);
fig_count=fig_count+1;
name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\F_score_under_different_thresholds_skiperson_structural_edge.raw'];
hw2writeraw(F,name2);

figure(fig_count);
plot(P);
xlabel('Threshold');
ylabel('Precision');
title('Precision under different thresholds skiperson structural edge');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Precision_under_different_thresholds_skiperson_structural_edge.jpg'];
saveas(gcf,name);
fig_count=fig_count+1;
name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Precision_under_different_thresholds_skiperson_structural_edge.raw'];
hw2writeraw(P,name2);

figure(fig_count);
plot(R);
xlabel('Threshold');
ylabel('Recall');
title('Recall under different thresholds skiperson structural edge');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Recall_under_different_thresholds_skiperson_structural_edge.jpg'];
saveas(gcf,name);
name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Recall_under_different_thresholds_skiperson_structural_edge.raw'];
hw2writeraw(R,name2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% result
% Precision_structural_edge_skiperson_ground_truth=1=0.61384
% Recall_structural_edge_skiperson_ground_truth=1=0.41376
% F_score_structural_edge_skiperson_ground_truth=1=0.38087
% Precision_structural_edge_skiperson_ground_truth=2=0.58325
% Recall_structural_edge_skiperson_ground_truth=2=0.36811
% F_score_structural_edge_skiperson_ground_truth=2=0.34794
% Precision_structural_edge_skiperson_ground_truth=3=0.65038
% Recall_structural_edge_skiperson_ground_truth=3=0.3284
% F_score_structural_edge_skiperson_ground_truth=3=0.34791
% Precision_structural_edge_skiperson_ground_truth=4=0.57873
% Recall_structural_edge_skiperson_ground_truth=4=0.4143
% F_score_structural_edge_skiperson_ground_truth=4=0.3688
% Precision_structural_edge_skiperson_ground_truth=5=0.61364
% Recall_structural_edge_skiperson_ground_truth=5=0.4204
% F_score_structural_edge_skiperson_ground_truth=5=0.38398
% Precision_structural_edge_skiperson_overall 0.65715
% Recall_structural_edge_skiperson_overall 0.38322
% F_score_structural_edge_skiperson_overall 0.39152

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% elephant

E = imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\elephant_se_edge.tif');

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
    disp(['Precision_structural_edge_elephant_ground_truth=',num2str(i) '=',num2str(P)]); % Ground truth 1*5 cell
    disp(['Recall_structural_edge_elephant_ground_truth=',num2str(i) '=',num2str(R)]);
    disp(['F_score_structural_edge_elephant_ground_truth=',num2str(i) '=',num2str(F)]);
    
end

[thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,EGT); %cntP cntR sumP sumR 99*1 double V 4-D double visualization of edge matches
[P,R,F] = calPRFmean(cntR, sumR, cntP, sumP,thrs); %P R F scalar
disp(['Precision_structural_edge_elephant_overall ',num2str(P)]); % Ground truth 1*5 cell
disp(['Recall_structural_edge_elephant_overall ',num2str(R)]);
disp(['F_score_structural_edge_elephant_overall ',num2str(F)]);
%%%%%%%%%%%%%%%%
[P,R,F]=CalPRGdiffThresh(cntR, sumR, cntP, sumP,thrs);


figure(fig_count);
plot(F);
xlabel('Threshold');
ylabel('F_score');
title('F_score under different thresholds elephant structural edge');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\F_score_under_different_thresholds_elephant_structural_edge.jpg'];
saveas(gcf,name);
fig_count=fig_count+1;
name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\F_score_under_different_thresholds_elephant_structural_edge.raw'];
hw2writeraw(F,name2);

figure(fig_count);
plot(P);
xlabel('Threshold');
ylabel('Precision');
title('Precision under different thresholds elephant structural edge');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Precision_under_different_thresholds_elephant_structural_edge.jpg'];
saveas(gcf,name);
fig_count=fig_count+1;
name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Precision_under_different_thresholds_elephant_structural_edge.raw'];
hw2writeraw(P,name2);

figure(fig_count);
plot(R);
xlabel('Threshold');
ylabel('Recall');
title('Recall under different thresholds elephant structural edge');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Recall_under_different_thresholds_elephant_structural_edge.jpg'];
saveas(gcf,name);
name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Recall_under_different_thresholds_elephant_structural_edge.raw'];
hw2writeraw(R,name2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% result

% Precision_structural_edge_elephant_ground_truth=1=0.75841
% Recall_structural_edge_elephant_ground_truth=1=0.25828
% F_score_structural_edge_elephant_ground_truth=1=0.28039
% Precision_structural_edge_elephant_ground_truth=2=0.75132
% Recall_structural_edge_elephant_ground_truth=2=0.30545
% F_score_structural_edge_elephant_ground_truth=2=0.30917
% Precision_structural_edge_elephant_ground_truth=3=0.78765
% Recall_structural_edge_elephant_ground_truth=3=0.22786
% F_score_structural_edge_elephant_ground_truth=3=0.26512
% Precision_structural_edge_elephant_ground_truth=4=0.37934
% Recall_structural_edge_elephant_ground_truth=4=0.27537
% F_score_structural_edge_elephant_ground_truth=4=0.26078
% Precision_structural_edge_elephant_ground_truth=5=0.72609
% Recall_structural_edge_elephant_ground_truth=5=0.26668
% F_score_structural_edge_elephant_ground_truth=5=0.27957
% Precision_structural_edge_elephant_overall 0.83485
% Recall_structural_edge_elephant_overall 0.26245
% F_score_structural_edge_elephant_overall 0.31292


end