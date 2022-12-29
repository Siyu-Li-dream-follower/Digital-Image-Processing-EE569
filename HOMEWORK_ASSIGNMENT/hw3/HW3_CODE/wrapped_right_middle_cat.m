%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [middle_ul_I,middle_ul_J,new_img_layer,location_matrix]=wrapped_right_middle_cat(ori_middle,wrapped_img_layer,H_side_to_middle,I_projected_max,J_projected_max,I_min_projected,J_min_projected,location_in_right_mid,location_in_mid_right,obj_location_projected)
[m_middle, n_middle,~] = size(ori_middle);
    point_fea = [location_in_right_mid, 1]';  
    transformed_fea_vector = H_side_to_middle * point_fea;
    center_left_J = transformed_fea_vector(1,1) / transformed_fea_vector(3,1);
    center_left_I = transformed_fea_vector(2,1) / transformed_fea_vector(3,1);

    center_left_I = center_left_I - I_min_projected;
    center_left_J = center_left_J - J_min_projected;


    
    loc_I = center_left_I - location_in_mid_right(1, 2);
    loc_J = n_middle - (center_left_J - location_in_mid_right(1, 1));
  
    new_img_layer = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , J_projected_max + fix(loc_J));
    new_left_layer = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , J_projected_max + fix(loc_J));
    new_right_layer = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , J_projected_max + fix(loc_J));
    
    new_left_layer(fix(loc_I): m_middle + fix(loc_I) - 1, 1: n_middle) = ori_middle(:,:,1);
    
    
    location_matrix = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , J_projected_max + fix(loc_J));

    new_right_layer(1: I_projected_max, fix(loc_J): J_projected_max + fix(loc_J) - 1) = wrapped_img_layer;
    
    new_left_res = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , J_projected_max + fix(loc_J));
    new_left_res(fix(loc_I): m_middle + fix(loc_I) - 1, 1: n_middle) = 1;
    new_mid_rep = zeros(max(I_projected_max, m_middle + fix(loc_I) - 1) , J_projected_max + fix(loc_J));
    new_mid_rep(1: I_projected_max, fix(loc_J): J_projected_max + fix(loc_J) - 1) = obj_location_projected;
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
    middle_ul_J = 1;
    
end