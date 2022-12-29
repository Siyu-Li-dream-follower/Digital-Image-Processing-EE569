%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw3problem3a()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Shrinking
%%%%%%%%%%% shrinking spring.raw
img_ori=hw3readraw('spring.raw',252,252,1);
[m,n]=size(img_ori);
figcount=1;
figure(figcount);
imshow(uint8(img_ori));
title(['original spring']);

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\spring_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\spring_ori.raw'];
% hw3writeraw(img_ori,filename);

figcount=figcount+1;
img_bin=thresholdToBinary(img_ori,60);

%%%%% shrinking
for countmax=[7,15,30,1000]
    count = 0;
    imgold = zeros(m,n);
    imgnew=img_bin;
    logicvalue=1;
    
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
    
    figure(figcount);
    imshow(imgnew);
    titlecontent=['Shringking Result spring.raw iteration= ' num2str(count)];
    title(titlecontent);
%     filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\spring_shrinking_iter=' num2str(count) '.jpg'];
%     saveas(gcf,filename);
%     
%     filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\spring_shrinking_iter=' num2str(count) '.raw'];
%     hw3writeraw(imgnew,filename);
    
    figcount=figcount+1;
    
end

%%%%%%%%%%% shrinking flower.raw
img_ori=hw3readraw('flower.raw',247,247,1);
[m,n]=size(img_ori);

figure(figcount);
imshow(uint8(img_ori));
title(['original flower']);

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\flower_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\flower_ori.raw'];
% hw3writeraw(img_ori,filename);

figcount=figcount+1;
img_bin=thresholdToBinary(img_ori,60);

%%%%% shrinking
for countmax=[7,15,30,200]
    count = 0;
    imgold = zeros(m,n);
    imgnew=img_bin;
    logicvalue=1;
    
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
    
    figure(figcount);
    imshow(imgnew);
    titlecontent=['Shringking Result flower.raw iteration= ' num2str(count)];
    title(titlecontent);
%     filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\flower_shrinking_iter=' num2str(count) '.jpg'];
%     saveas(gcf,filename);
%     
%     filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\flower_shrinking_iter=' num2str(count) '.raw'];
%     hw3writeraw(imgnew,filename);
    
    figcount=figcount+1;
    
end

%%%%%%%%%%% shrinking jar.raw
img_ori=hw3readraw('jar.raw',252,252,1);
[m,n]=size(img_ori);

figure(figcount);
imshow(uint8(img_ori));
title(['original jar']);

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\jar_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\jar_ori.raw'];
% hw3writeraw(img_ori,filename);

figcount=figcount+1;
img_bin=thresholdToBinary(img_ori,60);

%%%%% shrinking
for countmax=[7,15,30,200]
    count = 0;
    imgold = zeros(m,n);
    imgnew=img_bin;
    logicvalue=1;
    
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
    
    figure(figcount);
    imshow(imgnew);
    titlecontent=['Shringking Result jar.raw iteration= ' num2str(count)];
    title(titlecontent);
%     filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\jar_shrinking_iter=' num2str(count) '.jpg'];
%     saveas(gcf,filename);
%     
%     filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\jar_shrinking_iter=' num2str(count) '.raw'];
%     hw3writeraw(imgnew,filename);
    
    figcount=figcount+1;
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Thining
%%%%%%%%%%% thining spring.raw
img_ori=hw3readraw('spring.raw',252,252,1);
[m,n]=size(img_ori);

figure(figcount);
imshow(uint8(img_ori));
title(['original spring']);

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\spring_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\spring_ori.raw'];
% hw3writeraw(img_ori,filename);

figcount=figcount+1;
img_bin=thresholdToBinary(img_ori,60);

%%%%% thining
for countmax=[7,15,30,200]
    count = 0;
    imgold = zeros(m,n);
    imgnew=img_bin;
    logicvalue=1;
    
    while logicvalue ~= 0
        
        if count == countmax
            break
        end
        
        bond = calculateBond(imgnew);
        
        stage1result_T = stage1Filter_T(bond, imgnew);
        existanceMap = stage2Filter_ST(stage1result_T);
        
        imgold = imgnew;
        
        imgnew = pixelDelete(imgnew, existanceMap);
        
        logicvalue=LoopStopCriteria(imgnew,imgold);
        count = count + 1;
        
    end
    
    figure(figcount);
    imshow(imgnew);
    titlecontent=['Thining Result spring.raw iteration= ' num2str(count)];
    title(titlecontent);
%     filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\spring_thining_iter=' num2str(count) '.jpg'];
%     saveas(gcf,filename);
%     
%     filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\spring_thining_iter=' num2str(count) '.raw'];
%     hw3writeraw(imgnew,filename);
    
    figcount=figcount+1;
    
end

%%%%%%%%%%% thining flower.raw
img_ori=hw3readraw('flower.raw',247,247,1);
[m,n]=size(img_ori);

figure(figcount);
imshow(uint8(img_ori));
title(['original flower']);

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\flower_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\flower_ori.raw'];
% hw3writeraw(img_ori,filename);

figcount=figcount+1;
img_bin=thresholdToBinary(img_ori,60);

%%%%% thining
for countmax=[7,15,30,200]
    count = 0;
    imgold = zeros(m,n);
    imgnew=img_bin;
    logicvalue=1;
    
    while logicvalue ~= 0
        
        if count == countmax
            break
        end
        
        bond = calculateBond(imgnew);
        
        stage1result_T = stage1Filter_T(bond, imgnew);
        existanceMap = stage2Filter_ST(stage1result_T);
        
        imgold = imgnew;
        
        imgnew = pixelDelete(imgnew, existanceMap);
        
        logicvalue=LoopStopCriteria(imgnew,imgold);
        count = count + 1;
        
    end
    
    figure(figcount);
    imshow(imgnew);
    titlecontent=['Thining Result flower.raw iteration= ' num2str(count)];
    title(titlecontent);
%     filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\flower_thining_iter=' num2str(count) '.jpg'];
%     saveas(gcf,filename);
%     
%     filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\flower_thining_iter=' num2str(count) '.raw'];
%     hw3writeraw(imgnew,filename);
    
    figcount=figcount+1;
    
end

%%%%%%%%%%% thining jar.raw
img_ori=hw3readraw('jar.raw',252,252,1);
[m,n]=size(img_ori);

figure(figcount);
imshow(uint8(img_ori));
title(['original jar']);

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\jar_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\jar_ori.raw'];
% hw3writeraw(img_ori,filename);

figcount=figcount+1;
img_bin=thresholdToBinary(img_ori,60);

%%%%% thining
for countmax=[7,15,30,200]
    count = 0;
    imgold = zeros(m,n);
    imgnew=img_bin;
    logicvalue=1;
    
    while logicvalue ~= 0
        
        if count == countmax
            break
        end
        
        bond = calculateBond(imgnew);
        
        stage1result_T = stage1Filter_T(bond, imgnew);
        existanceMap = stage2Filter_ST(stage1result_T);
        
        imgold = imgnew;
        
        imgnew = pixelDelete(imgnew, existanceMap);
        
        logicvalue=LoopStopCriteria(imgnew,imgold);
        count = count + 1;
        
    end
    
    figure(figcount);
    imshow(imgnew);
    titlecontent=['Thining Result jar.raw iteration= ' num2str(count)];
    title(titlecontent);
%     filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\jar_thining_iter=' num2str(count) '.jpg'];
%     saveas(gcf,filename);
%     
%     filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\jar_thining_iter=' num2str(count) '.raw'];
%     hw3writeraw(imgnew,filename);
    
    figcount=figcount+1;
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Skeletonizing
%%%%%%%%%%% Skeletonizing spring.raw
img_ori=hw3readraw('spring.raw',252,252,1);
[m,n]=size(img_ori);

figure(figcount);
imshow(uint8(img_ori));
title(['original spring']);

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\spring_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\spring_ori.raw'];
% hw3writeraw(img_ori,filename);

figcount=figcount+1;
img_bin=thresholdToBinary(img_ori,60);

%%%%% Skeletonizing
for countmax=[7,15,30,200]
    count = 0;
    imgold = zeros(m,n);
    imgnew=img_bin;
    logicvalue=1;
    
    while logicvalue ~= 0
        
        if count == countmax
            break
        end
        
        bond = calculateBond(imgnew);
        
        stage1result_K = stage1Filter_K(bond, imgnew);
        existanceMap = stage2Filter_K(stage1result_K);
        
        imgold = imgnew;
        
        imgnew = pixelDelete(imgnew, existanceMap);
        
        logicvalue=LoopStopCriteria(imgnew,imgold);
        count = count + 1;
        
    end
    
    figure(figcount);
    imshow(imgnew);
    titlecontent=['Skeletonizing Result spring.raw iteration= ' num2str(count)];
    title(titlecontent);
%     filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\spring_Skeletonizing_iter=' num2str(count) '.jpg'];
%     saveas(gcf,filename);
%     
%     filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\spring_Skeletonizing_iter=' num2str(count) '.raw'];
%     hw3writeraw(imgnew,filename);
    
    figcount=figcount+1;
    
end

%%%%%%%%%%% Skeletonizing flower.raw
img_ori=hw3readraw('flower.raw',247,247,1);
[m,n]=size(img_ori);

figure(figcount);
imshow(uint8(img_ori));
title(['original flower']);

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\flower_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\flower_ori.raw'];
% hw3writeraw(img_ori,filename);

figcount=figcount+1;
img_bin=thresholdToBinary(img_ori,60);

%%%%% Skeletonizing
for countmax=[7,15,30,200]
    count = 0;
    imgold = zeros(m,n);
    imgnew=img_bin;
    logicvalue=1;
    
    while logicvalue ~= 0
        
        if count == countmax
            break
        end
        
        bond = calculateBond(imgnew);
        
        stage1result_K = stage1Filter_K(bond, imgnew);
        existanceMap = stage2Filter_K(stage1result_K);
        
        imgold = imgnew;
        
        imgnew = pixelDelete(imgnew, existanceMap);
        
        logicvalue=LoopStopCriteria(imgnew,imgold);
        count = count + 1;
        
    end
    
    figure(figcount);
    imshow(imgnew);
    titlecontent=['Skeletonizing Result flower.raw iteration= ' num2str(count)];
    title(titlecontent);
%     filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\flower_Skeletonizing_iter=' num2str(count) '.jpg'];
%     saveas(gcf,filename);
%     
%     filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\flower_Skeletonizing_iter=' num2str(count) '.raw'];
%     hw3writeraw(imgnew,filename);
    
    figcount=figcount+1;
    
end

%%%%%%%%%%% Skeletonizing jar.raw
img_ori=hw3readraw('jar.raw',252,252,1);
[m,n]=size(img_ori);

figure(figcount);
imshow(uint8(img_ori));
title(['original jar']);

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\jar_ori.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\jar_ori.raw'];
% hw3writeraw(img_ori,filename);

figcount=figcount+1;
img_bin=thresholdToBinary(img_ori,60);

%%%%% Skeletonizing
for countmax=[7,15,30,200]
    count = 0;
    imgold = zeros(m,n);
    imgnew=img_bin;
    logicvalue=1;
    
    while logicvalue ~= 0
        
        if count == countmax
            break
        end
        
        bond = calculateBond(imgnew);
        
        stage1result_K = stage1Filter_K(bond, imgnew);
        existanceMap = stage2Filter_K(stage1result_K);
        
        imgold = imgnew;
        
        imgnew = pixelDelete(imgnew, existanceMap);
        
        logicvalue=LoopStopCriteria(imgnew,imgold);
        count = count + 1;
        
    end
    
    figure(figcount);
    imshow(imgnew);
    titlecontent=['Skeletonizing Result jar.raw iteration= ' num2str(count)];
    title(titlecontent);
%     filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\jar_Skeletonizing_iter=' num2str(count) '.jpg'];
%     saveas(gcf,filename);
%     
%     filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\jar_Skeletonizing_iter=' num2str(count) '.raw'];
%     hw3writeraw(imgnew,filename);
    
    figcount=figcount+1;
    
end

end
