%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw3problem3b()
img_ori=hw3readraw('maze.raw',343,343,1);
figcount=1;
figure(figcount);
imshow(uint8(img_ori));
title(['original maze']);
figcount=figcount+1;
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\maze_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\maze_ori.raw'];
% hw3writeraw(img_ori,filename);
img_bin=thresholdToBinary(img_ori,50);

count = 0;
imgnew=img_bin;
logicvalue=1;
countmax=1000;
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
imgfinal=hw3matrixmulconstant(hw3matrixadd(img_bin,imgshrinked),0.5);
imshow(imgfinal);

figure(figcount);
imshow(imgfinal);
titlecontent=['Shringking Result maze.raw with Iteration= ' num2str(count)];
title(titlecontent);
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\maze_shrinking_result.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\maze_shrinking_result.raw'];
% hw3writeraw(imgfinal,filename);



end