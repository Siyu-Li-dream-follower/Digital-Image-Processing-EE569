%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw3problem2()
ori_left = imread('left.png');
ori_right = imread('right_updated.png');
ori_middle = imread('middle.png');

%%% detect feature
gray_left = rgb2gray(ori_left); 
gray_middle = rgb2gray(ori_middle);
gray_right = rgb2gray(ori_right);

original_fea_points_left = detectSURFFeatures(gray_left);
original_fea_points_middle = detectSURFFeatures(gray_middle);
original_fea_points_right = detectSURFFeatures(gray_right);

[select_feature_left,validpoints_left] = extractFeatures(gray_left,original_fea_points_left); % select_feature_left location information of all features validpoints_left all information of features
[select_feature_middle,validpoints_middle] = extractFeatures(gray_middle,original_fea_points_middle);
[select_feature_right,validpointpts_right] = extractFeatures(gray_right,original_fea_points_right);

indexPairs_rightWithMiddle = matchFeatures(select_feature_right,select_feature_middle);
matchedPoints_in_right = validpointpts_right(indexPairs_rightWithMiddle(:,1));
matchedPoints_in_middle_with_right = validpoints_middle(indexPairs_rightWithMiddle(:,2));

indexPairs_leftWithMiddle = matchFeatures(select_feature_left,select_feature_middle);
matchedPoints_in_left = validpoints_left(indexPairs_leftWithMiddle(:,1));
matchedPoints_in_middle_with_left = validpoints_middle(indexPairs_leftWithMiddle(:,2));


figure;
showMatchedFeatures(ori_left,ori_middle,matchedPoints_in_left,matchedPoints_in_middle_with_left,'montage');
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem2\matchedpoints_left_middle.tif'];
% saveas(gcf,filename);

figure;
showMatchedFeatures(ori_middle,ori_right,matchedPoints_in_middle_with_right,matchedPoints_in_right,'montage');
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem2\matchedpoints_right_middle.tif'];
% saveas(gcf,filename);

%%%
% selected key point by observing the matched feature points manually to
% get the correct point
% 1st layer [2,5,19,21] 2nd layer [4,8,11,18]
selected_fea_point_in_left =  matchedPoints_in_left([2,5,19,21],:);
selected_fea_point_in_middle_with_left = matchedPoints_in_middle_with_left([2,4,19,21],:);

selected_fea_point_in_right = matchedPoints_in_right([4,8,11,18],:);
selected_fea_point_in_middle_with_right = matchedPoints_in_middle_with_right([4,8,11,18],:);
figure;
showMatchedFeatures(ori_left, ori_middle, selected_fea_point_in_left, selected_fea_point_in_middle_with_left, 'montage'); 
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\selectedPoints_left_middle.tif'];
% saveas(gcf,filename);

figure;
showMatchedFeatures(ori_middle, ori_right, selected_fea_point_in_middle_with_right, selected_fea_point_in_right, 'montage'); 
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\selectedPoints_right_middle.tif'];
% saveas(gcf,filename);

%%%%%% Transform and concatinate middle and right
%%%%%% cell to matrix
%%%%%% coordinate transform
[~, n_middle] = size(gray_middle);
%%% Right Middle
select_fea_location_matrix_in_right = selected_fea_point_in_right.Location; % column1 x ; column2 y
select_fea_location_matrix_in_middle_with_right= selected_fea_point_in_middle_with_right.Location;
select_fea_location_matrix_in_middle_with_right(:, 1)= select_fea_location_matrix_in_middle_with_right(:, 1) - n_middle; % calculate x position in the combined image
%%%% calculate transform matrix
H_right_warp_toMiddle = cal_transform_Hmatrix(select_fea_location_matrix_in_right, select_fea_location_matrix_in_middle_with_right);

locator_in_right_mid = [select_fea_location_matrix_in_right(1,1),select_fea_location_matrix_in_right(1,2)];
locator_in_mid_right = [select_fea_location_matrix_in_middle_with_right(1,1),select_fea_location_matrix_in_middle_with_right(1,2)];

[wrapped_right, cat_wrapped_rm, mid_right_locator_I, ~, location_rightmid] = right_matrix_warp_concatination(ori_right, H_right_warp_toMiddle, ori_middle, locator_in_right_mid, locator_in_mid_right);

%%% Left Middle
select_fea_location_matrix_in_left = selected_fea_point_in_left.Location;
select_fea_location_matrix_in_middle_with_left= selected_fea_point_in_middle_with_left.Location;
select_fea_location_matrix_in_middle_with_left(:, 1)= select_fea_location_matrix_in_middle_with_left(:, 1) + n_middle;
%%%% calculate transform matrix
H_left_wrap_toMiddle = cal_transform_Hmatrix(select_fea_location_matrix_in_left, select_fea_location_matrix_in_middle_with_left);

locator_in_left_mid =[select_fea_location_matrix_in_left(1,1),select_fea_location_matrix_in_left(1,2)];
locator_in_mid_left = [select_fea_location_matrix_in_middle_with_left(1,1),select_fea_location_matrix_in_middle_with_left(1,2)];

[wrapped_left, cat_wrapped_lm, mid_left_locator_I, ~, location_leftmid] = left_matrix_warp_concatination(ori_left, H_left_wrap_toMiddle, ori_middle, locator_in_left_mid, locator_in_mid_left);

figure;
imshow(uint8(wrapped_right));
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem2\wrapped_right.tif'];
% saveas(gcf,filename);

figure;
imshow(uint8(wrapped_left)); 
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem2\wrapped_left.tif'];
% saveas(gcf,filename);

figure;
imshow(uint8(cat_wrapped_lm)); 
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem2\combined_left_middle.tif'];
% saveas(gcf,filename);

figure;
imshow(uint8(cat_wrapped_rm));
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem2\combined_right_middle.tif'];
% saveas(gcf,filename);

%%% concatinate the final image
[m_left, n_left] = size(cat_wrapped_lm(:, :, 1));
[m_right, n_right] = size(cat_wrapped_rm(:, :, 1));

loc_I = mid_right_locator_I - mid_left_locator_I;

temp_left_R = zeros(max(m_left, m_right), n_left + n_right - n_middle);
temp_left_G = zeros(max(m_left, m_right), n_left + n_right - n_middle);
temp_left_B = zeros(max(m_left, m_right), n_left + n_right - n_middle);
temp_left_R(loc_I + 1: loc_I + m_left, 1: n_left) = cat_wrapped_lm(:, :, 1);
temp_left_G(loc_I + 1: loc_I + m_left, 1: n_left) = cat_wrapped_lm(:, :, 2);
temp_left_B(loc_I + 1: loc_I + m_left, 1: n_left) = cat_wrapped_lm(:, :, 3);

temp_right_R = zeros(max(m_left, m_right), n_left + n_right - n_middle);
temp_right_G = zeros(max(m_left, m_right), n_left + n_right - n_middle);
temp_right_B = zeros(max(m_left, m_right), n_left + n_right - n_middle);
temp_right_R(1: m_right, n_left - n_middle + 1: n_left - n_middle + n_right) = cat_wrapped_rm(:, :, 1);
temp_right_G(1: m_right, n_left - n_middle + 1: n_left - n_middle + n_right) = cat_wrapped_rm(:, :, 2);
temp_right_B(1: m_right, n_left - n_middle + 1: n_left - n_middle + n_right) = cat_wrapped_rm(:, :, 3);

loc_left = zeros(max(m_left, m_right), n_left + n_right - n_middle);
loc_right = zeros(max(m_left, m_right), n_left + n_right - n_middle);
loc_left(loc_I + 1: loc_I + m_left, 1: n_left) = location_leftmid;
loc_right(1: m_right, n_left - n_middle + 1: n_left - n_middle + n_right) = location_rightmid;

ressult_R = zeros(max(m_left, m_right), n_left + n_right - n_middle);
result_G = zeros(max(m_left, m_right), n_left + n_right - n_middle);
result_B = zeros(max(m_left, m_right), n_left + n_right - n_middle);

for i = 1:max(m_left, m_right)
    for j = 1: n_left + n_right - n_middle
        if loc_left(i,j) == 1 && loc_right(i,j) == 1
            ressult_R(i,j) = (1/2)*(temp_left_R(i, j) + temp_right_R(i, j));
            result_G(i,j) = (1/2)*(temp_left_G(i, j) + temp_right_G(i, j));
            result_B(i,j) = (1/2)*(temp_left_B(i, j) + temp_right_B(i, j));
        else
            if loc_left(i,j) == 1
                ressult_R(i,j) = temp_left_R(i, j, 1);
                result_G(i,j) = temp_left_G(i, j, 1);
                result_B(i,j) = temp_left_B(i, j, 1);
            end
            if loc_right(i,j) == 1
                ressult_R(i,j) = temp_right_R(i, j, 1);
                result_G(i,j) = temp_right_G(i, j, 1);
                result_B(i,j) = temp_right_B(i, j, 1);
            end
        end
        
    end
end

result(:, :, 1) = ressult_R;
result(:, :, 2) = result_G;
result(:, :, 3) = result_B;
figure;
imshow(uint8(result));
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem2\final_result.tif'];
% saveas(gcf,filename);

end