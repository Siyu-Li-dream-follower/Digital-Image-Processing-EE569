%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function energy_map_25_layer_mn=filterFeaMap_Gaussian(fea_map_25_layer,radius,sigma)

[m, n, d] = size(fea_map_25_layer);
energy_map_25_layer_mn = zeros(m,n,d);
%%%%%% Build Gaussian Filter Mask
gaussian_mask=zeros(2*radius+1,2*radius+1);
for p=1:2*radius+1
    for q=1:2*radius+1
        gaussian_mask(p,q)=(1/sqrt(2*pi*sigma^2))*exp(-((p-radius-1)^2+(q-radius-1)^2)/(2*sigma^2));
    end
end
%%%%%% Perform Filtering
for layer=1:d
    
    padded_current_layer = hw4ReflecPadding(fea_map_25_layer(:, :, layer),radius);
    for i=1:m
        for j=1:n
            filtered_value = 0;
                        
            for p = 1: 2*radius+1
                for q = 1: 2*radius+1
                    filtered_value = filtered_value + gaussian_mask(p,q)*padded_current_layer(i+p-1, j+q-1);
                end
            end
            
            energy_map_25_layer_mn(i, j , layer) = abs(filtered_value)/((2*radius+1)^2);
        end
    end
end


end