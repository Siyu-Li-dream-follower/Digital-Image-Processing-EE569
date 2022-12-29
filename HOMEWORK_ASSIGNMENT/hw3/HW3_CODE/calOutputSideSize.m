%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [I_projected_max,J_projected_max,I_min_projected,J_min_projected,m_ori_side,n_ori_side]=calOutputSideSize(ori_side_gray,H_side_to_middle)

[m_ori_side,n_ori_side] = size(ori_side_gray);
[J_ori_side, I_ori_side] = oriPixelLocation(n_ori_side,m_ori_side); 
I_ori_side_projected_middle = zeros(size(I_ori_side));
J_ori_side_projected_middle = zeros(size(J_ori_side));
% make ori point to (0,0)
I_ori_side = hw3matrixadd(I_ori_side,-ones(m_ori_side,n_ori_side));
J_ori_side = hw3matrixadd(J_ori_side,-ones(m_ori_side,n_ori_side));

for i=1:m_ori_side
    for j=1:n_ori_side
        vector = [J_ori_side(i,j), I_ori_side(i,j), 1]';  
        projected_result_matrix = H_side_to_middle * vector;
        J_ori_side_projected_middle(i,j) = projected_result_matrix(1,1) / projected_result_matrix(3,1);
        I_ori_side_projected_middle(i,j) = projected_result_matrix(2,1) / projected_result_matrix(3,1);
    end
end

I_min_projected = min(min(I_ori_side_projected_middle)); 
J_min_projected = min(min(J_ori_side_projected_middle)); 

I_ori_side_projected_middle = I_ori_side_projected_middle - I_min_projected;
J_ori_side_projected_middle = J_ori_side_projected_middle - J_min_projected;

I_projected_max = floor(max(max(I_ori_side_projected_middle)))+1;
J_projected_max = floor(max(max(J_ori_side_projected_middle)))+1;

end