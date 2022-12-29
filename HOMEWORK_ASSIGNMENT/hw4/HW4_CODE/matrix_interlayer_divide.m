%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function energy_map_25_divided_mn=matrix_interlayer_divide(energy_map_25_layer_mn,energy_map_1st_layer_mn)
[m,n,d] = size(energy_map_25_layer_mn);
energy_map_25_divided_mn = zeros(m,n,d);
for layer=1:d
    for i=1:m
        for j=1:n
            energy_map_25_divided_mn(i,j,layer)=energy_map_25_layer_mn(i,j,layer) / (energy_map_1st_layer_mn(i,j)+0.0001);
        end
    end
end

end