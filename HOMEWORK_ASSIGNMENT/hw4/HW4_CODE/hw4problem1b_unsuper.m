%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw4problem1b_unsuper()
test_path = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\dataset_updated\test\'];       
test_dir  = dir([test_path '*.raw']);

all_feature_map_ave_25 = zeros(25, length(test_dir));
figcount=1;
for i = 1:length(test_dir)
    test_img = hw4readraw([test_path test_dir(i).name],128,128,1);
    figure(figcount);
    imshow(uint8(test_img));
    titlecontent=['test image ' num2str(figcount)];
    title(titlecontent);
%     filename=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem1\testimg' num2str(figcount) '.jpg'];
%     saveas(gcf,filename);
    figcount=figcount+1;
    
    test_img = SubtractGlobalMean(test_img);
    feature_map_25_layer = CalFeatureMap(test_img);
    feature_map_ave_25 = FeatureAverage(feature_map_25_layer);
    
    all_feature_map_ave_25(:, i) = feature_map_ave_25;
   
end
all_feature_map_ave_3 = PrincipleComponentAnalysis(all_feature_map_ave_25', 3);
%%%%%% calculate 25D
label_myself_25 = k_means_myself(all_feature_map_ave_25, 4);
disp(['25D label calculated by kmeans by myself ' num2str(label_myself_25')]);

label_matlab_25 = kmeans(all_feature_map_ave_25',4);
disp(['25D label calculated by kmeans of matlab ' num2str(label_matlab_25')]);
%%%%%% calculate 3D
label_myself_3 = k_means_myself(all_feature_map_ave_3, 4);
disp(['3D label calculated by kmeans of myself ' num2str(label_myself_3')]);

label_matlab_3 = kmeans(all_feature_map_ave_3',4);
disp(['3D label calculated by kmeans of matlab ' num2str(label_matlab_3')]);


end