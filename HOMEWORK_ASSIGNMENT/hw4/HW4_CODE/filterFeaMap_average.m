%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function energy_map_25layer_mn = filterFeaMap_average(feature_map, radius)

[m, n, d] = size(feature_map);
energy_map_25layer_mn = zeros(m,n,d);

for layer=1:d
    
    padded_current_layer = hw4ReflecPadding(feature_map(:, :, layer),radius);
    for i=1:m
        for j=1:n
            filtered_value = 0;
                        
            for p = 1: 2*radius+1
                for q = 1: 2*radius+1
                    filtered_value = filtered_value + padded_current_layer(i+p-1, j+q-1);%^2;
                end
            end
            
            energy_map_25layer_mn(i, j , layer) = abs(filtered_value)/((2*radius+1)^2);
        end
    end
end

end