%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function label_image=labelmapToImg(label_map, label_num)
[m,n] = size(label_map);
label_image = zeros(m,n);
label_table=zeros(1,label_num);
interval = floor(255 / (label_num - 1));
for i=1:label_num
    if i==label_num
        label_table(1,i)=255;
        continue;
    end
    label_table(1,i)=(i-1)*interval+1;
    
end

for i=1:m
    for j=1:n
        label_image(i,j) = label_table(1,label_map(i,j));
    end
end

end