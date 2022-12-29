%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem2a3()
pic = modreadraw('bridge.raw',501,332,1);   % m*n have different meaning in hw2 from hw1 here, in hw1 m:column n:row and it is reversed in hw2, so readraw and write raw must be rewritten
imshow(uint8(pic)); % 501*332
index_2=[1,2;3,0];
index_8=indexPadding(index_2,2);
index_32=indexPadding(index_2,4);

indexthresh_2=indextothresh(index_2);
indexthresh_8=indextothresh(index_8);
indexthresh_32=indextothresh(index_32);

imgdither_2=ditheringOperation(pic,indexthresh_2);
figure(2);
imshow(uint8(imgdither_2));
titlecontent=['Dithered Image I=2'];
title(titlecontent);
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2\DitheredImageI=2.jpg'];
% saveas(gcf,name1);
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2raw\DitheredImageI=2.raw'];
% hw2writeraw(imgdither_2,name2);

imgdither_8=ditheringOperation(pic,indexthresh_8);
figure(3);
imshow(uint8(imgdither_8));
titlecontent=['Dithered Image I=8'];
title(titlecontent);
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2\DitheredImageI=8.jpg'];
% saveas(gcf,name1);
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2raw\DitheredImageI=8.raw'];
% hw2writeraw(imgdither_8,name2);

imgdither_32=ditheringOperation(pic,indexthresh_32);
figure(4);
imshow(uint8(imgdither_32));
titlecontent=['Dithered Image I=32'];
title(titlecontent);
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2\DitheredImageI=32.jpg'];
% saveas(gcf,name1);
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2raw\DitheredImageI=32.raw'];
% hw2writeraw(imgdither_32,name2);



end