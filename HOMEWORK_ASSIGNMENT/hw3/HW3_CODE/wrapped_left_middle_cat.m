%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [middle_ul_I,mid_ul_J,new_img_layer,location_matrix]=wrapped_left_middle_cat(ori_middle,wrapped_img_layer,H_side_to_middle,I_projected_max,J_projected_max,I_min_projected,J_min_projected,locator_in_left_mid,locator_in_mid_left,obj_location_projected,n_ori_side)

[m_middle, n_middle,~] = size(ori_middle);
fea_vector = [locator_in_left_mid, 1]';  
transformed_fea_vector = H_side_to_middle * fea_vector;
center_left_J = transformed_fea_vector(1,1) / transformed_fea_vector(3,1);
center_left_I = transformed_fea_vector(2,1) / transformed_fea_vector(3,1);

center_left_I = center_left_I - I_min_projected;
center_left_J = center_left_J - J_min_projected;


loc_I = center_left_I - locator_in_mid_left(1, 2); 
loc_J = center_left_J - locator_in_mid_left(1, 1) + n_ori_side;


new_img_layer = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , max(J_projected_max, n_middle + fix(loc_J) - 1));
new_left_layer = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , max(J_projected_max, n_middle + fix(loc_J) - 1));
new_right_layer = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , max(J_projected_max, n_middle + fix(loc_J) - 1));

new_left_layer(1:I_projected_max, 1:J_projected_max) = wrapped_img_layer;

location_matrix = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , max(J_projected_max, n_middle + fix(loc_J) - 1));

new_right_layer(fix(loc_I): m_middle + fix(loc_I) - 1,...
    fix(loc_J): n_middle + fix(loc_J) - 1) = ori_middle(:,:,1);

new_left_res = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , max(J_projected_max, n_middle + fix(loc_J) - 1));
new_left_res(1:I_projected_max, 1:J_projected_max) = obj_location_projected;
new_mid_rep = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , max(J_projected_max, n_middle + fix(loc_J) - 1));
new_mid_rep(fix(loc_I): m_middle + fix(loc_I) - 1,...
    fix(loc_J): n_middle + fix(loc_J) - 1) = 1;

[m_new, n_new] = size(new_img_layer);


for i=1:m_new
    for j=1:n_new
        if new_left_res(i,j) == 1 && new_mid_rep(i,j) == 1
            new_img_layer(i,j) = (1/2) * (new_left_layer(i,j) + new_right_layer(i,j,1));
            
            location_matrix(i,j) = 1;
        else
            if new_left_res(i,j) == 1
                new_img_layer(i,j) = new_left_layer(i,j);
                
                location_matrix(i,j) = 1;
                
            end
            if new_mid_rep(i,j) == 1
                new_img_layer(i,j) = new_right_layer(i,j,1);
                
                location_matrix(i,j) = 1;
            end
            
        end
        
    end
end


middle_ul_I = fix(loc_I);
mid_ul_J = fix(loc_J);




end