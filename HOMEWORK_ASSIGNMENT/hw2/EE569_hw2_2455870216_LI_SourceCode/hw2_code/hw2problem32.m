%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem32()
pic = modreadraw('fish.raw',426,640,3);   % m*n have different meaning in hw2 from hw1 here, in hw1 m:column n:row and it is reversed in hw2, so readraw and write raw must be rewritten
imshow(uint8(pic)); % 426*640*3

R_pic=pic(:,:,1);
G_pic=pic(:,:,2);
B_pic=pic(:,:,3);

FS_core = (1/16)*[0 0 0; 0 0 7; 3 5 1];

pic_MVBQ=MVBQmethod(R_pic,G_pic,B_pic,FS_core);

figure(2);
imshow(uint8(pic_MVBQ));
titlecontent=['MVBQ Result FS '];
title(titlecontent);
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem3\MVBQ_FS.jpg'];
% saveas(gcf,name1);
% 
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem3raw\MVBQ_FS.raw'];
% hw2writeraw(pic_MVBQ,name2);

% figure(3);
% pictest=modreadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem3raw\MVBQ_FS.raw',426,640,3);
% imshow(uint8(pictest));
end