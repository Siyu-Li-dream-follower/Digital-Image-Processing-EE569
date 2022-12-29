%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem1d_canny()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ski_person
filepathread=['ski_person.jpg'];
filepathwrite=['ski_canny_edge.tif'];
canny_proba_map(filepathread,filepathwrite);
E = imread(filepathwrite);
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
    disp(['Precision_canny_skiperson_ground_truth=',num2str(i) '=',num2str(P)]); % Ground truth 1*5 cell
    disp(['Recall_canny_skiperson_ground_truth=',num2str(i) '=',num2str(R)]);
    disp(['F_score_canny_skiperson_ground_truth=',num2str(i) '=',num2str(F)]);
    
end

[thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,EGT); %cntP cntR sumP sumR 99*1 double V 4-D double visualization of edge matches
[P,R,F] = calPRFmean(cntR, sumR, cntP, sumP,thrs); %P R F scalar
disp(['Precision_canny_skiperson_overall ',num2str(P)]); % Ground truth 1*5 cell
disp(['Recall_canny_skiperson_overall ',num2str(R)]);
disp(['F_score_canny_skiperson_overall ',num2str(F)]);
%%%%%%%%%%%%%%%%
[P,R,F]=CalPRGdiffThresh(cntR, sumR, cntP, sumP,thrs);


figure(fig_count);
plot(F);
xlabel('Threshold');
ylabel('F_score');
title('F_score under different thresholds skiperson canny');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\F_score_under_different_thresholds_skiperson_canny.jpg'];
% saveas(gcf,name);
fig_count=fig_count+1;
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\F_score_under_different_thresholds_skiperson_canny.raw'];
% hw2writeraw(F,name2);

figure(fig_count);
plot(P);
xlabel('Threshold');
ylabel('Precision');
title('Precision under different thresholds skiperson canny');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Precision_under_different_thresholds_skiperson_canny.jpg'];
% saveas(gcf,name);
fig_count=fig_count+1;
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Precision_under_different_thresholds_skiperson_canny.raw'];
% hw2writeraw(P,name2);

figure(fig_count);
plot(R);
xlabel('Threshold');
ylabel('Recall');
title('Recall under different thresholds skiperson canny');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Recall_under_different_thresholds_skiperson_canny.jpg'];
% saveas(gcf,name);
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Recall_under_different_thresholds_skiperson_canny.raw'];
% hw2writeraw(R,name2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Precision_canny_skiperson_ground_truth=1=0.59903
% Recall_canny_skiperson_ground_truth=1=0.63497
% F_score_canny_skiperson_ground_truth=1=0.60712
% Precision_canny_skiperson_ground_truth=2=0.56984
% Recall_canny_skiperson_ground_truth=2=0.55646
% F_score_canny_skiperson_ground_truth=2=0.55444
% Precision_canny_skiperson_ground_truth=3=0.75607
% Recall_canny_skiperson_ground_truth=3=0.55134
% F_score_canny_skiperson_ground_truth=3=0.62811
% Precision_canny_skiperson_ground_truth=4=0.54871
% Recall_canny_skiperson_ground_truth=4=0.62188
% F_score_canny_skiperson_ground_truth=4=0.57416
% Precision_canny_skiperson_ground_truth=5=0.60009
% Recall_canny_skiperson_ground_truth=5=0.64743
% F_score_canny_skiperson_ground_truth=5=0.61343
% Precision_canny_skiperson_overall 0.77499
% Recall_canny_skiperson_overall 0.59704
% F_score_canny_skiperson_overall 0.66448

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% elephant
filepathread=['elephant.jpg'];
filepathwrite=['elephant_canny_edge.tif'];
canny_proba_map(filepathread,filepathwrite);
E = imread(filepathwrite);

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
    disp(['Precision_canny_elephant_ground_truth=',num2str(i) '=',num2str(P)]); % Ground truth 1*5 cell
    disp(['Recall_canny_elephant_ground_truth=',num2str(i) '=',num2str(R)]);
    disp(['F_score_canny_elephant_ground_truth=',num2str(i) '=',num2str(F)]);
    
end

[thrs,cntR,sumR,cntP,sumP,V] = edgesEvalImg(E,EGT); %cntP cntR sumP sumR 99*1 double V 4-D double visualization of edge matches
[P,R,F] = calPRFmean(cntR, sumR, cntP, sumP,thrs); %P R F scalar
disp(['Precision_canny_elephant_overall ',num2str(P)]); % Ground truth 1*5 cell
disp(['Recall_canny_elephant_overall ',num2str(R)]);
disp(['F_score_canny_elephant_overall ',num2str(F)]);
%%%%%%%%%%%%%%%%
[P,R,F]=CalPRGdiffThresh(cntR, sumR, cntP, sumP,thrs);


figure(fig_count);
plot(F);
xlabel('Threshold');
ylabel('F_score');
title('F_score under different thresholds elephant canny');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\F_score_under_different_thresholds_elephant_canny.jpg'];
% saveas(gcf,name);
fig_count=fig_count+1;
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\F_score_under_different_thresholds_elephant_canny.raw'];
% hw2writeraw(F,name2);

figure(fig_count);
plot(P);
xlabel('Threshold');
ylabel('Precision');
title('Precision under different thresholds elephant canny');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Precision_under_different_thresholds_elephant_canny.jpg'];
% saveas(gcf,name);
fig_count=fig_count+1;
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Precision_under_different_thresholds_elephant_canny.raw'];
% hw2writeraw(P,name2);

figure(fig_count);
plot(R);
xlabel('Threshold');
ylabel('Recall');
title('Recall under different thresholds elephant canny');
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\Recall_under_different_thresholds_elephant_canny.jpg'];
% saveas(gcf,name);
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\Recall_under_different_thresholds_elephant_canny.raw'];
% hw2writeraw(R,name2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Precision_canny_elephant_ground_truth=1=0.62397
% Recall_canny_elephant_ground_truth=1=0.61547
% F_score_canny_elephant_ground_truth=1=0.60757
% Precision_canny_elephant_ground_truth=2=0.58198
% Recall_canny_elephant_ground_truth=2=0.68913
% F_score_canny_elephant_ground_truth=2=0.61865
% Precision_canny_elephant_ground_truth=3=0.71337
% Recall_canny_elephant_ground_truth=3=0.54555
% F_score_canny_elephant_ground_truth=3=0.60637
% Precision_canny_elephant_ground_truth=4=0.50249
% Recall_canny_elephant_ground_truth=4=0.62557
% F_score_canny_elephant_ground_truth=4=0.54636
% Precision_canny_elephant_ground_truth=5=0.5762
% Recall_canny_elephant_ground_truth=5=0.61392
% F_score_canny_elephant_ground_truth=5=0.58262
% Precision_canny_elephant_overall 0.82679
% Recall_canny_elephant_overall 0.61045
% F_score_canny_elephant_overall 0.69416


end