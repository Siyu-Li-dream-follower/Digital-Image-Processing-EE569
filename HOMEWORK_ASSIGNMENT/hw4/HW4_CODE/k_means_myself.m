%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function label_vector=k_means_myself(ave_fea_map,k)
[m,n] = size(ave_fea_map);
rand_index = randperm(n);
cluster_centroid = ave_fea_map(:, rand_index(end-k+1: end));

label_vector = zeros(n, 1);
max_iteration = 100;
for iteration=1: max_iteration
    for i=1:n
        min_distance = Inf;
        for j=1:k
            current_distance = norm(ave_fea_map(:, i) - cluster_centroid(:, j));
            if current_distance < min_distance               
                label_vector(i, 1) = j;
                min_distance = current_distance;
            end
        end
    end
    
    new_center = zeros(m,k);
    new_center_denominator = zeros(1,k);
    
    for i=1:n
        new_center_denominator(1, label_vector(i,1)) = new_center_denominator(1, label_vector(i,1)) + 1;
    end
    for i=1:n
        new_center(:, label_vector(i,1)) = new_center(:, label_vector(i,1)) + ave_fea_map(:, i)/new_center_denominator(1, label_vector(i,1));
    end
    
    cluster_centroid = new_center;
end

end