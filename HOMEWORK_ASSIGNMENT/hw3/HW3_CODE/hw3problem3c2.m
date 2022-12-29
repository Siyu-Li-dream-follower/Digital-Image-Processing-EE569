%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw3problem3c2()
img_ori=hw3readraw('horse.raw',322,422,1);
img_bin=thresholdToBinary(img_ori,128);
[m,n]=size(img_ori);
imgnew=hw3matrixsubtract(ones(m,n),img_bin);
AlonePointVector = [];
count=0;
logicvalue=1;
while logicvalue
    AlonePointVector(1,(count+1)) = countIsolatePoint(imgnew);
    imgold=imgnew;
    bond = calculateBond(imgnew);
    
    stage1result_S = stage1Filter_S(bond, imgnew);
    existanceMap = stage2Filter_ST(stage1result_S);
    
    imgnew = pixelDelete(imgnew, existanceMap);
    %imgnew = bwmorph(imgnew, 'shrink', 1);
    logicvalue=LoopStopCriteria(imgnew,imgold);
    count=count+1;
end
defect_size=zeros(1,count-1);
len=length(AlonePointVector) - 1;
for i = 1:len
    defect_size(1,i) = AlonePointVector(i + 1) - AlonePointVector(i);
end
figure(1);
x_axis=1:len;
bar(x_axis,defect_size);
xlabel('defect size measured by number of shrink iterations');
ylabel('number of defect');
title(['Number of Iterations= ' num2str(count)]);
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_defect_hist.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\horse_defect_hist.raw'];
% hw3writeraw(defect_size,filename);

%%%%%%%%%%%%%%% Delete Outlier
count = 0;
imgnew=hw3matrixsubtract(ones(m,n),img_bin);
countmax=50;
AlonePointVector = zeros(1,countmax);
logicvalue=1;
while logicvalue
    if count==countmax
        break
    end
    AlonePointVector(1,(count+1)) = countIsolatePoint(imgnew);
    imgold=imgnew;
    bond = calculateBond(imgnew);
    
    stage1result_S = stage1Filter_S(bond, imgnew);
    existanceMap = stage2Filter_ST(stage1result_S);
    
    imgnew = pixelDelete(imgnew, existanceMap);
    %imgnew = bwmorph(imgnew, 'shrink', 1);
    logicvalue=LoopStopCriteria(imgnew,imgold);
    count = count + 1;
end
defect_size=zeros(1,count-1);
len=length(AlonePointVector) - 1;
for i = 1:len
    defect_size(1,i) = AlonePointVector(1,i + 1) - AlonePointVector(1,i);
end
figure(2);
x_axis=1:len;
bar(x_axis,defect_size);
xlabel('defect size measured by number of shrink iterations with outlier removal');
ylabel('number of defect');
title(['Number of Iterations= ' num2str(count)]);
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_defect_hist_outlier_removed.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\horse_defect_hist_outlier_removed.raw'];
% hw3writeraw(defect_size,filename);

end