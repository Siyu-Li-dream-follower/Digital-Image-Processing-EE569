%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw3problem3c1()
img_ori=hw3readraw('horse.raw',322,422,1);
[m,n]=size(img_ori);
figcount=1;
figure(figcount);
imshow(uint8(img_ori));
title(['original horse']);
figcount=figcount+1;
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\horse_ori.raw'];
% hw3writeraw(img_ori,filename);

threshold=128;
img_bin=thresholdToBinary(img_ori,threshold);
figure(figcount);
imshow(img_bin);
title(['Threshold= ' num2str(threshold)]); 
figcount=figcount+1;
%imgshrinked=bwmorph((1-img_bin),'shrink',Inf);
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_bin_thresh=' num2str(threshold) '.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\horse_bin_thresh=' num2str(threshold) '.raw'];
% hw3writeraw(img_bin,filename);
%%%%%%%%%%%%%%%%%%%%%%%%%%

imgnew=hw3matrixsubtract(ones(m,n),img_bin);

figure(figcount);
imshow(imgnew);
title(['Thresholded and Inversed Image with Threshold= ' num2str(threshold)]); 
figcount=figcount+1;
%imgshrinked=bwmorph((1-img_bin),'shrink',Inf);
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_bin_reversed.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\horse_bin_reversed.raw'];
% hw3writeraw(img_bin,filename);

count = 0;
logicvalue=1;
countmax=500;
while logicvalue ~= 0
    
    if count == countmax
        break
    end
    
    bond = calculateBond(imgnew);
    
    stage1result_S = stage1Filter_S(bond, imgnew);
    existanceMap = stage2Filter_ST(stage1result_S);
    
    imgold = imgnew;
    
    imgnew = pixelDelete(imgnew, existanceMap);
    
    logicvalue=LoopStopCriteria(imgnew,imgold);
    count = count + 1;
    
end
imgshrinked=imgnew;

figure(figcount);
imshow(imgshrinked);
title(['horse defect shrinked iteration= ' num2str(count)]);
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_defect_shrinked.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\horse_defect_shrinked.raw'];
% hw3writeraw(imgshrinked,filename);
defectnumber=countIsolatePoint(imgshrinked);

disp(['Number of Defect= ' num2str(defectnumber)]);


end