%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw4problem1a_nearest_neighbor()
%%%%%% Training Set
train_path = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\dataset_updated\train\'];       
train_dir  = dir([train_path '*.raw']);

all_feature_map_ave_25_train = zeros(25, length(train_dir));

for i = 1:length(train_dir)
    train_img = hw4readraw([train_path train_dir(i).name],128,128,1);
   
    train_img = SubtractGlobalMean(train_img);
    feature_map_25_layer = CalFeatureMap(train_img);
    feature_map_ave_25 = FeatureAverage(feature_map_25_layer);
    
    all_feature_map_ave_25_train(:, i) = feature_map_ave_25;
   
end
all_feature_map_ave_3_train = PrincipleComponentAnalysis(all_feature_map_ave_25_train', 3);
%%%%%% Test Set
test_path = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\dataset_updated\test\'];       
test_dir  = dir([test_path '*.raw']);

all_feature_map_ave_25_test = zeros(25, length(test_dir));

for i = 1:length(test_dir)
    test_img = hw4readraw([test_path test_dir(i).name],128,128,1);
    
    test_img = SubtractGlobalMean(test_img);
    feature_map_25_layer = CalFeatureMap(test_img);
    feature_map_ave_25 = FeatureAverage(feature_map_25_layer);
    
    all_feature_map_ave_25_test(:, i) = feature_map_ave_25;
   
end
all_feature_map_ave_3_test = PrincipleComponentAnalysis(all_feature_map_ave_25_test', 3);
%%%%%% Implement Nearest Neighbor
label_training_set=[ones(1,9), 2*ones(1,9), 3*ones(1,9), 4*ones(1,9)];
label_nearest_neighbor=nearest_neighbor_clf(all_feature_map_ave_3_train,all_feature_map_ave_3_test,label_training_set);

disp(['label by nearest neighbor ' num2str(label_nearest_neighbor)]);


end