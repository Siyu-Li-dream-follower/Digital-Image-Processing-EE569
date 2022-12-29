%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=problem31()
pic=ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\Fruits.raw',500,400,3);
pic_uint8=uint8(pic);
imshow(pic_uint8);
[m,n,d]=size(pic);
R_pic=pic(:,:,1);
G_pic=pic(:,:,2);
B_pic=pic(:,:,3);
R_pic_reduct=universalColorsetReduction(R_pic,4);
G_pic_reduct=universalColorsetReduction(G_pic,4);
B_pic_reduct=universalColorsetReduction(B_pic,4);
pic_reduced=zeros(m,n,d);
pic_reduced(:,:,1)=R_pic_reduct;
pic_reduced(:,:,2)=G_pic_reduct;
pic_reduced(:,:,3)=B_pic_reduct;
pic_reduced_uint8=uint8(pic_reduced);
figure(1);
imshow(pic_reduced_uint8);
titlecontent=sprintf('%s','Original Picture Color Reduced Picture Color=64 ');
title(titlecontent);
% name = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\pic_reduced_color=64.raw'];
% universalwriteraw(pic_reduced,name);
%saveas(gcf,name);

count=2;
pic_reduced_oil=zeros(m,n,d);
counts=3;
for N=3:11
R_pic_reduct_oil=oliPaintingFilter(R_pic_reduct,N);
G_pic_reduct_oil=oliPaintingFilter(G_pic_reduct,N);
B_pic_reduct_oil=oliPaintingFilter(B_pic_reduct,N);
pic_reduced_oil(:,:,1)=R_pic_reduct_oil;
pic_reduced_oil(:,:,2)=G_pic_reduct_oil;
pic_reduced_oil(:,:,3)=B_pic_reduct_oil;
pic_reduced_oil_uint8=uint8(pic_reduced_oil);
figure(count);
imshow(pic_reduced_oil_uint8);
titlecontent=sprintf('%s %s %2.0f','Original Picture Color=64 ','N=',N);
title(titlecontent);
% name1  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\pic_reduced_oil_N=' num2str(counts) '.raw'];
% universalwriteraw(pic_reduced_oil,name1);
%saveas(gcf,name1);
count=count+1;
counts=counts+1;
end


end