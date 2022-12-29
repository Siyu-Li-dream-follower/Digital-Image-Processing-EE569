%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [wrapped_img,obj_location_projected]=probelm2imgWarpingBackwardMapping(ori_side_img,I_projected_max,J_projected_max,H_side_to_middle,I_min_projected,J_min_projected,m_ori_side,n_ori_side)

wrapped_img=zeros(I_projected_max,J_projected_max);
[J_wrapped, I_wrapped] = oriPixelLocation(J_projected_max, I_projected_max);

% cal the corresponding (x,y) in ori_left for the new img.
I_wrapped_to_ori = zeros(I_projected_max, J_projected_max);
J_wrapped_to_ori = zeros(I_projected_max, J_projected_max);
obj_location_projected = zeros(I_projected_max, J_projected_max);
%%% transfer back from objective to original to do calculate value by interpolation
H_side_to_middle_inv = inv(H_side_to_middle);

for i=1:I_projected_max
    for j=1:J_projected_max
        vector = [J_wrapped(i,j) + J_min_projected, I_wrapped(i,j) + I_min_projected, 1]'; 
        weight = 1 / (H_side_to_middle_inv(3, 1) * vector(1, 1) + H_side_to_middle_inv(3, 2) * vector(2, 1) + H_side_to_middle_inv(3, 3) * vector(3, 1));
        backprojected_result = weight * vector;
        backprojected_ori = H_side_to_middle \ backprojected_result;
        J_wrapped_to_ori(i,j) = backprojected_ori(1,1);
        I_wrapped_to_ori(i,j) = backprojected_ori(2,1);
    end
end
% put ori back to(1,1)
I_wrapped_to_ori = hw3matrixadd(I_wrapped_to_ori,ones(I_projected_max, J_projected_max));
J_wrapped_to_ori = hw3matrixadd(J_wrapped_to_ori,ones(I_projected_max, J_projected_max));

for i=1:I_projected_max
    for j=1:J_projected_max
        
        if (I_wrapped_to_ori(i,j) <= 1 || J_wrapped_to_ori(i,j) <= 1) &&...
                (I_wrapped_to_ori(i,j) > 0 && J_wrapped_to_ori(i,j) > 0 &&...
                (floor(I_wrapped_to_ori(i,j))+1) <= m_ori_side && (floor(J_wrapped_to_ori(i,j))+1) <= n_ori_side)
            wrapped_img(i,j) = ori_side_img(ceil(I_wrapped_to_ori(i,j)), ceil(J_wrapped_to_ori(i,j)));
            

            obj_location_projected(i,j) = 1;
%             
        elseif ((floor(I_wrapped_to_ori(i,j))+1) <= m_ori_side &&...
                (floor(J_wrapped_to_ori(i,j))+1) <= n_ori_side) &&...
                (I_wrapped_to_ori(i,j) > 0 && J_wrapped_to_ori(i,j) > 0 &&...
                I_wrapped_to_ori(i,j) <= m_ori_side && J_wrapped_to_ori(i,j) <= n_ori_side)
            
            diff_I = I_wrapped_to_ori(i,j) - fix(I_wrapped_to_ori(i,j));
            diff_J = J_wrapped_to_ori(i,j) - fix(J_wrapped_to_ori(i,j));
            
            wrapped_img(i,j) = (1 - diff_I) * (1 - diff_J) * ori_side_img(fix(I_wrapped_to_ori(i,j)), fix(J_wrapped_to_ori(i,j))) + ...
                           diff_I * (1 - diff_J) * ori_side_img(fix(I_wrapped_to_ori(i,j)) + 1, fix(J_wrapped_to_ori(i,j))) + ...
                           (1 - diff_I) * diff_J * ori_side_img(fix(I_wrapped_to_ori(i,j)), fix(J_wrapped_to_ori(i,j)) + 1) + ...
                           diff_I * diff_J * ori_side_img(fix(I_wrapped_to_ori(i,j)) + 1, fix(J_wrapped_to_ori(i,j)) + 1);
         
            obj_location_projected(i,j) = 1;

                       
        elseif (round(I_wrapped_to_ori(i,j)) <= m_ori_side && round(J_wrapped_to_ori(i,j)) <= n_ori_side) &&...
                (round(I_wrapped_to_ori(i,j)) > 0 && round(J_wrapped_to_ori(i,j)) > 0) &&...
                (I_wrapped_to_ori(i,j) > 0 && J_wrapped_to_ori(i,j) > 0)
            wrapped_img(i,j) = ori_side_img(round(I_wrapped_to_ori(i,j)), round(J_wrapped_to_ori(i,j)));
            
            obj_location_projected(i,j) = 1;
            
        else
            wrapped_img(i,j) = 0;
            
        end
        
        
    end
end


end