%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function label_out=nearest_neighbor_clf(all_feature_map_ave_3_train,all_feature_map_ave_3_test,label_training_set)
[mtrain,ntrain]=size(all_feature_map_ave_3_train);
[~,ntest]=size(all_feature_map_ave_3_test);

traintest=zeros(mtrain,ntrain+ntest);
traintest(:,1:ntrain)=all_feature_map_ave_3_train;
traintest(:,ntrain+1:end)=all_feature_map_ave_3_test;

covar=traintest*(traintest');
invcovar=inv(covar);
label_out=zeros(1,ntest);
for i=1:ntest
    min_distance=Inf;
    xtest=all_feature_map_ave_3_test(:,i)-mean(all_feature_map_ave_3_test(:,i));
    
    for j=1:ntrain
        
        xtrain=all_feature_map_ave_3_train(:,j)-mean(all_feature_map_ave_3_train(:,j));
        xtrain_minus_xtest=abs(xtrain-xtest);        
        
        mahala_distance=sqrt((xtrain_minus_xtest')*invcovar*xtrain_minus_xtest);
        if mahala_distance < min_distance
            label_out(1,i)=label_training_set(1,j);
            min_distance=mahala_distance;
        end
        
    end
    
end

end