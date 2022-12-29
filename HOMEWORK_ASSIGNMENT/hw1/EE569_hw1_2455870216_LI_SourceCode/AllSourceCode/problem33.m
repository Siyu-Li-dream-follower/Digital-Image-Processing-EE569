%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=problem33()
pic_noisy=ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\Fruits_noisy.raw',500,400,3);
pic_noisy_uint8=uint8(pic_noisy);
count=1;
figure(count);
imshow(pic_noisy_uint8);
[m,n,d]=size(pic_noisy);
R_pic=pic_noisy(:,:,1);
G_pic=pic_noisy(:,:,2);
B_pic=pic_noisy(:,:,3);
count=2;
for r=[4,8]
    R_pic_reduct=universalColorsetReduction(R_pic,r);
    G_pic_reduct=universalColorsetReduction(G_pic,r);
    B_pic_reduct=universalColorsetReduction(B_pic,r);
    pic_reduced=zeros(m,n,d);
    pic_reduced(:,:,1)=R_pic_reduct;
    pic_reduced(:,:,2)=G_pic_reduct;
    pic_reduced(:,:,3)=B_pic_reduct;
    pic_reduced_uint8=uint8(pic_reduced);
    figure(count);
    imshow(pic_reduced_uint8);
    color=r*r*r;
    titlecontent=sprintf('%s %s %2.0f','Noisy Picture ','Color Reduced Picture Color=',color);
    title(titlecontent);
    
    
%     name = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\pic_reduced_color=' num2str(color) '.raw'];
%     universalwriteraw(pic_reduced,name);
    %saveas(gcf,name);
    count=count+1;
    pic_reduced_oil=zeros(m,n,d);
    
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
        titlecontent=sprintf('%s %s %2.0f %s %2.0f','Noisy Picture ','Color=',color,'N=',N);
        title(titlecontent);
        counts=mod(count,10);
%         name1  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\pic_reduced_oil_color=' num2str(color) '_N=' num2str(counts) '.raw'];
%         universalwriteraw(pic_reduced_oil,name1);
        %saveas(gcf,name1);
        count=count+1;
        
    end
    
end

end