%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem2a2()
pic = modreadraw('bridge.raw',501,332,1);   % m*n have different meaning in hw2 from hw1 here, in hw1 m:column n:row and it is reversed in hw2, so readraw and write raw must be rewritten
imshow(uint8(pic)); % 501*332

picrandthresh=randomthreshold(pic);
figure(2);
imshow(uint8(picrandthresh));
titlecontent=['random threshold result'];
title(titlecontent);
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2\randomthreshold.jpg'];
% saveas(gcf,name1);
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2raw\randomthreshold.raw'];
% hw2writeraw(picrandthresh,name2);


end