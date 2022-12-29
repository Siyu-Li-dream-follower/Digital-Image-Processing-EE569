%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [wrapped_img, concat, middle_right_locator, middle_left_locator, location_matrix] = right_matrix_warp_concatination(ori_side, H_side_to_middle, ori_middle, locator_in_right_mid, locator_in_mid_right) % positive; negative

%%% left
% left 2 gray
ori_side_gray = rgb2gray(ori_side);
ori_side_R = ori_side(:,:,1);
ori_side_G = ori_side(:,:,2);
ori_side_B = ori_side(:,:,3);

[I_projected_max,J_projected_max,I_min_projected,J_min_projected,m_ori_side,n_ori_side]=calOutputSideSize(ori_side_gray,H_side_to_middle);

[wrapped_img_R,~]=probelm2imgWarpingBackwardMapping(ori_side_R,I_projected_max,J_projected_max,H_side_to_middle,I_min_projected,J_min_projected,m_ori_side,n_ori_side);
[wrapped_img_G,~]=probelm2imgWarpingBackwardMapping(ori_side_G,I_projected_max,J_projected_max,H_side_to_middle,I_min_projected,J_min_projected,m_ori_side,n_ori_side);
[wrapped_img_B,obj_location_projected]=probelm2imgWarpingBackwardMapping(ori_side_B,I_projected_max,J_projected_max,H_side_to_middle,I_min_projected,J_min_projected,m_ori_side,n_ori_side);

wrapped_img(:, :, 1) = wrapped_img_R;
wrapped_img(:, :, 2) = wrapped_img_G;
wrapped_img(:, :, 3) = wrapped_img_B;

% left mid
[~,~,concat_R,~]=wrapped_right_middle_cat...
    (ori_middle,wrapped_img_R,H_side_to_middle,I_projected_max,J_projected_max,I_min_projected,J_min_projected,locator_in_right_mid,locator_in_mid_right,obj_location_projected);

[~,~,concat_G,~]=wrapped_right_middle_cat...
    (ori_middle,wrapped_img_G,H_side_to_middle,I_projected_max,J_projected_max,I_min_projected,J_min_projected,locator_in_right_mid,locator_in_mid_right,obj_location_projected);

[middle_right_locator,middle_left_locator,concat_B,location_matrix]=wrapped_right_middle_cat...
    (ori_middle,wrapped_img_B,H_side_to_middle,I_projected_max,J_projected_max,I_min_projected,J_min_projected,locator_in_right_mid,locator_in_mid_right,obj_location_projected);

    concat(:, :, 1) = concat_R;
    concat(:, :, 2) = concat_G;
    concat(:, :, 3) = concat_B;
end