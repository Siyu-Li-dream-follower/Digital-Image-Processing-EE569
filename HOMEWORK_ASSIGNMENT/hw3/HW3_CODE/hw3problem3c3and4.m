%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw3problem3c3and4()
img_ori=hw3readraw('horse.raw',322,422,1);
[m,n]=size(img_ori);
%%%%%%%% To have a better effect of clear horse we should set threshold very approximate to 255
%%%%%%%% Here threshold=250
threshold=250;
img_bin=thresholdToBinary(img_ori,threshold);
imgnew=hw3matrixsubtract(ones(m,n),img_bin);
%%%%%% CCL detection
labelmapfinal=CCL_LabelMap(imgnew);
%%%%%% See the defect detected ( already delete no label part 0 and background 1)
labelmapreduced=zeros(m,n);
for i=1:m
    for j=1:n
        if labelmapfinal(i,j)>1
            labelmapreduced(i,j)=255;
        end
    end
end
figcount=1;
figure(figcount);
imshow(uint8(labelmapreduced));
title(['Horse Defect Detected']);
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_defect_detected_t=' num2str(threshold) '.jpg'];
% saveas(gcf,filename);

figcount=figcount+1;
%%%% process clear horse with img_ori
imgfinal=zeros(m,n);
for i=1:m
    for j=1:n
        if labelmapfinal(i,j)>1
            imgfinal(i,j)=255+img_ori(i,j);
        else
            imgfinal(i,j)=img_ori(i,j);
        end
        if imgfinal(i,j)>255
            imgfinal(i,j)=255;
        else
            imgfinal(i,j)=imgfinal(i,j);
        end
    end
end

%figcount=1;
figure(figcount);
imshow(uint8(imgfinal));
titlecontent=['Clear Horse With Original Image Threshold= ' num2str(threshold)];
title(titlecontent);
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\clear_horse_threshold=' num2str(threshold) '.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\clear_horse_threshold' num2str(threshold) '.raw'];
% hw3writeraw(imgfinal,filename);
figcount=figcount+1;
%%%% process clear horse with img_bin
imgfinal=zeros(m,n);
for i=1:m
    for j=1:n
        if labelmapfinal(i,j)>1
            imgfinal(i,j)=255+255*img_bin(i,j);
        else
            imgfinal(i,j)=255*img_bin(i,j);
        end
        if imgfinal(i,j)>255
            imgfinal(i,j)=255;
        else
            imgfinal(i,j)=imgfinal(i,j);
        end
    end
end

%figcount=1;
figure(figcount);
imshow(uint8(imgfinal));
titlecontent=['Clear Horse With Image Binary'];
title(titlecontent);
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\clear_horse_with_image_bin.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\clear_horse_with_image_bin.raw'];
% hw3writeraw(imgfinal,filename);
figcount=figcount+1;
%%%%%%%%%%%%%%%%%%%%%%% process original Label vs number of pixels plot (144 labels)
%%%%%%%%%%% Threshold=128
img_bin=thresholdToBinary(img_ori,128);
imgnew=hw3matrixsubtract(ones(m,n),img_bin);
%%%%%% CCL detection
labelmapfinal=CCL_LabelMap(imgnew);
labelmapHistOri=zeros(1,(max(max(labelmapfinal))+1));
labelmapfinalpro=hw3matrixadd(labelmapfinal,ones(m,n));

for i=1:m
    for j=1:n
        labelmapHistOri(1,labelmapfinalpro(i,j))=labelmapHistOri(1,labelmapfinalpro(i,j))+1;
    end
end
figure(figcount);
x_axis=0:max(max(labelmapfinal));
bar(x_axis,labelmapHistOri);
xlabel('Original Label of Defects');
ylabel('Number of Pixels');
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_defect_hist_ori_ccl_label_pixelnumber.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\horse_defect_hist_ori_ccl_label_pixelnumber.raw'];
% hw3writeraw(labelmapHistOri,filename);
figcount=figcount+1;

labelmapHistOriDelBackground=labelmapHistOri(1,3:(max(max(labelmapfinal))+1));
figure(figcount);
x_axis=2:max(max(labelmapfinal));
bar(x_axis,labelmapHistOriDelBackground);
xlabel('Original Label of Defects Delete Background With Label 0,1');
ylabel('Number of Pixels');
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_defect_hist_ori_ccl_label_pixelnumber_del_background.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\horse_defect_hist_ori_ccl_label_pixelnumber_del_background.raw'];
% hw3writeraw(labelmapHistOriDelBackground,filename);
figcount=figcount+1;


%%%%%%%%%%%%%%%%%%%%%% process reduced Label vs number of pixels plot (72 labels including background)

len=length(labelmapHistOriDelBackground);
numnonzero=0;
for i=1:len
    if labelmapHistOriDelBackground(1,i)~=0
        numnonzero=numnonzero+1;
    end
end
% Dispaly Total Number of Defects: reduced label number-1
disp(['Number of Defects= ' num2str(numnonzero)]);
%
labelmapHistFinal=zeros(1,numnonzero);
cnt=1;
for i=1:len
    if labelmapHistOriDelBackground(1,i)~=0
    labelmapHistFinal(1,cnt)=labelmapHistOriDelBackground(1,i);
    cnt=cnt+1;
    end
end
figure(figcount);
x_axis=2:(numnonzero+1);
bar(x_axis,labelmapHistFinal);
xlabel('Reduced Label of Defects Delete Background With Label 0,1');
ylabel('Number of Pixels');
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_defect_hist_reduced_ccl_label_pixelnumber.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\horse_defect_hist_reduced_ccl_label_pixelnumber.raw'];
% hw3writeraw(labelmapHistFinal,filename);
figcount=figcount+1;
%%%%%%%%%%%%%%%%%%%%%% Dispaly Defect Size vs Number of This defect size 
lenth=max(labelmapHistFinal);
SizeNumberHist=zeros(1,lenth);
for i=1:numnonzero
    SizeNumberHist(1,labelmapHistFinal(1,i))=SizeNumberHist(1,labelmapHistFinal(1,i))+1;
end
figure(figcount);
x_axis=1:lenth;
bar(x_axis,SizeNumberHist);
xlabel('Defect Size (Number of Pixels in Each Defect)');
ylabel('Number of Defects in This Defect Size');
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3\horse_defect_hist_reduced_ccl_size_Defectnumber.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem3raw\horse_defect_hist_reduced_ccl_size_Defectnumber.raw'];
% hw3writeraw(SizeNumberHist,filename);
%figcount=figcount+1;

end