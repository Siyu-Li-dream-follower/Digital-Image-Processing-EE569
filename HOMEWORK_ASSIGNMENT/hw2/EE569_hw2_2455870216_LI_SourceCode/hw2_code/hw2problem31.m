%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23rd 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem31()
pic = modreadraw('fish.raw',426,640,3);   % m*n have different meaning in hw2 from hw1 here, in hw1 m:column n:row and it is reversed in hw2, so readraw and write raw must be rewritten
imshow(uint8(pic)); % 426*640*3
[m,n,dim]=size(pic);
R_pic=pic(:,:,1);
G_pic=pic(:,:,2);
B_pic=pic(:,:,3);

Cyan = CMYRGBconvert(R_pic);
Megenta = CMYRGBconvert(G_pic);
Yellow = CMYRGBconvert(B_pic);

FS_core = (1/16)*[0 0 0; 0 0 7; 3 5 1];

pic_Cyan_FS =  errorDiffusionMethod(Cyan, FS_core);
pic_Megenta_FS = errorDiffusionMethod(Megenta, FS_core);
pic_Yellow_FS = errorDiffusionMethod(Yellow, FS_core);

imgfinalresult=zeros(m,n,dim);
pic_red_FS=CMYRGBconvert(pic_Cyan_FS);
pic_green_FS=CMYRGBconvert(pic_Megenta_FS);
pic_blue_FS=CMYRGBconvert(pic_Yellow_FS);

imgfinalresult(:,:,1)=pic_red_FS;
imgfinalresult(:,:,2)=pic_green_FS;
imgfinalresult(:,:,3)=pic_blue_FS;

figure(2);
imshow(uint8(imgfinalresult));
titlecontent=['Color Image Error Diffusion Result FS '];
title(titlecontent);
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem3\ColorErrorDiffusionResultFS.jpg'];
% saveas(gcf,name1);
% 
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem3raw\ColorErrorDiffusionResultFS.raw'];
% hw2writeraw(imgfinalresult,name2);

end