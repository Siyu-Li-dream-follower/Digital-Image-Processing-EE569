%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function fea_map_average = FeatureAverage(feature_map_ori)
[m, n, d] = size(feature_map_ori);

fea_map_average = zeros(1,d);

for layer=1:d
    one_layer_sum = 0;
    for i=1:m
        for j=1:n
            one_layer_sum = one_layer_sum + feature_map_ori(i,j,layer)*feature_map_ori(i,j,layer);
        end
    end
    one_layer_average = one_layer_sum / (m * n);
    fea_map_average(1,layer) = one_layer_average;
end

end