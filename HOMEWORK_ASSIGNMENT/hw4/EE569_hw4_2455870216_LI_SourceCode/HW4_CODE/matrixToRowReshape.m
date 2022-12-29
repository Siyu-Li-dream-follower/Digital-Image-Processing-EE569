%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function energy_map_24_reshaped=matrixToRowReshape(energy_map_24_mn)
[m,n,d]=size(energy_map_24_mn);
energy_map_24_reshaped=zeros(d,m*n);
for layer=1:d
    count=1;
    for i=1:m
        for j=1:n
            energy_map_24_reshaped(layer,count)=energy_map_24_mn(i,j,layer);
            count=count+1;
        end
    end
    
end

end