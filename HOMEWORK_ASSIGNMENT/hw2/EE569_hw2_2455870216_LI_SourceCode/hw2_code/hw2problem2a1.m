%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem2a1()
pic = modreadraw('bridge.raw',501,332,1);   % m*n have different meaning in hw2 from hw1 here, in hw1 m:column n:row and it is reversed in hw2, so readraw and write raw must be rewritten 
imshow(uint8(pic)); % 501*332
figcount=2;
for i=[32,64,90,110,128,180,210]
    picthresh=fixthreshold(pic,i);
    figure(figcount);
    imshow(uint8(picthresh));
    titlecontent=sprintf('%s %2.0f','threshold= ',i);
    title(titlecontent);
%     name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2\fixthreshould=' num2str(i) '.jpg'];
%     saveas(gcf,name1);
%     name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2raw\fixthreshould=' num2str(i) '.raw'];
%     hw2writeraw(picthresh,name2);
    figcount=figcount+1;
end
% pictest = modreadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem2raw\fixthreshould=210.raw',501,332,1);%test if new readraw and writeraw work well
% figure(figcount);
% imshow(uint8(pictest));

end