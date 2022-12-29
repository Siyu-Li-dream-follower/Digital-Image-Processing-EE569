%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [max_argument,min_argument]=calDiscriminantPower(all_feature_map_ave_25)
[m,n]=size(all_feature_map_ave_25);
%%%%%% Calculate Intra
mean_4img_class=zeros(m,4);
offset=0;
for class=1:4
    
    for i=1:m
        mean=0;
        for j=9*offset+1:9*(offset+1)
            mean=mean+all_feature_map_ave_25(i,j);
        end
        mean_4img_class(i,offset+1)=mean/9;
    end
    offset=offset+1;
   
end

intra=zeros(m,4);
offset=0;
for class=1:4
    
    for i=1:m
        deviation=0;
        for j=(9*offset+1):(9*(offset+1))
            deviation=deviation+(all_feature_map_ave_25(i,j)-mean_4img_class(i,offset+1))^2;
        end
        intra(i,offset+1)=deviation;
    end
    offset=offset+1;
end

intra_total=zeros(m,1);
for i=1:m
    for j=1:4
        intra_total(i,1)=intra_total(i,1)+intra(i,j);
    end
end
%%%%%% Calculate Inter
%%%% cal meantotal
mean_total=zeros(m,1);
for i=1:m
    mean=0;
    for j=1:n
        mean=mean+all_feature_map_ave_25(i,j);
    end
    mean_total(i,1)=mean/36;
end
   
inter_total=zeros(m,1);
for i=1:m
    for j=1:4
        inter_total(i,1)=inter_total(i,1)+9*((mean_4img_class(i,j)-mean_total(i,1))^2);
    end
end
      
feature_ratio=inter_total./intra_total;
[~, max_argument] = max(feature_ratio);
[~, min_argument] = min(feature_ratio);

end