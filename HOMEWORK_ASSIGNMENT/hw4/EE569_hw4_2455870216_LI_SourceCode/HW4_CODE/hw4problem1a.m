%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw4problem1a()
train_path = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\dataset_updated\train\'];       
train_dir  = dir([train_path '*.raw']);

all_feature_map_ave_25 = zeros(25, length(train_dir));

for i = 1:length(train_dir)
    train_img = hw4readraw([train_path train_dir(i).name],128,128,1);
   
    train_img = SubtractGlobalMean(train_img);
    feature_map_25_layer = CalFeatureMap(train_img);
    feature_map_ave_25 = FeatureAverage(feature_map_25_layer);
    
    all_feature_map_ave_25(:, i) = feature_map_ave_25;
   
end

[max_argument,min_argument]=calDiscriminantPower(all_feature_map_ave_25);

disp(['maximum discriminant power feature number= ' num2str(max_argument)]); % L5E5 and E5L5

disp(['minimum discriminant power feature number= ' num2str(min_argument)]); % L5W5 and W5L5

all_feature_map_ave_3 = PrincipleComponentAnalysis(all_feature_map_ave_25', 3);
label_position = [ones(1,9), 2 * ones(1,9), 3 * ones(1,9), 4 * ones(1, 9)];

scatter3(all_feature_map_ave_3(1, label_position == 1), all_feature_map_ave_3(2, label_position == 1), all_feature_map_ave_3(3, label_position == 1), 'r');
hold on
scatter3(all_feature_map_ave_3(1, label_position == 2), all_feature_map_ave_3(2, label_position == 2), all_feature_map_ave_3(3, label_position == 2), 'g');
scatter3(all_feature_map_ave_3(1, label_position == 3), all_feature_map_ave_3(2, label_position == 3), all_feature_map_ave_3(3, label_position == 3), 'b');
scatter3(all_feature_map_ave_3(1, label_position == 4), all_feature_map_ave_3(2, label_position == 4), all_feature_map_ave_3(3, label_position == 4), 'k');
legend('blanket', 'brick', 'grass', 'rice');


end