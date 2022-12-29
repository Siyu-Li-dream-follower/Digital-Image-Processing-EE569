%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem2b()
pic = modreadraw('bridge.raw',501,332,1);   % m*n have different meaning in hw2 from hw1 here, in hw1 m:column n:row and it is reversed in hw2, so readraw and write raw must be rewritten
imshow(uint8(pic)); % 501*332

FS_core = (1/16)*[0 0 0; 0 0 7; 3 5 1];
JJN_core =(1/48)*[0 0 0 0 0; 0 0 0 0 0; 0 0 0 7 5; 3 5 7 5 3; 1 3 5 3 1];
SK_core = (1/42)*[0 0 0 0 0; 0 0 0 0 0; 0 0 0 8 4; 2 4 8 4 2; 1 2 4 2 1];


pic_FS =  errorDiffusionMethod(pic, FS_core);
figure(2);
imshow(pic_FS);
titlecontent=['Error Diffusion Result FS core'];
title(titlecontent);
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2\ErrorDiffusionResultFS.jpg'];
% saveas(gcf,name1);
% 
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2raw\ErrorDiffusionResultFS.raw'];
% hw2writeraw(pic_FS,name2);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pictest = modreadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2raw\ErrorDiffusionResultFS.raw',501,332,1);%test if new readraw and writeraw work well
% figure(3);
% imshow(uint8(pictest));


pic_JJN =  errorDiffusionMethod(pic, JJN_core);
figure(3);
imshow(pic_JJN);
titlecontent=['Error Diffusion Result JJN core'];
title(titlecontent);
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2\ErrorDiffusionResultJJN.jpg'];
% saveas(gcf,name1);
% 
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2raw\ErrorDiffusionResultJJN.raw'];
% hw2writeraw(pic_JJN,name2);

pic_SK =  errorDiffusionMethod(pic, SK_core);
figure(4);
imshow(pic_SK);
titlecontent=['Error Diffusion Result SK core'];
title(titlecontent);
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2\ErrorDiffusionResultSK.jpg'];
% saveas(gcf,name1);
% 
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2raw\ErrorDiffusionResultSK.raw'];
% hw2writeraw(pic_SK,name2);



end