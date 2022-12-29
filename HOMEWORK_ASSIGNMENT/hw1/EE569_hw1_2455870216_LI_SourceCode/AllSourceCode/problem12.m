%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
%%%% Change all the addresses or roots in ModifiedReadraw and
%%%% universalwriteraw before running the code!
%%%% If you want to save jpg result to get some of the image like barplot in my report, you can
%%%% use saveas(gcf,filename) and change the .raw in filename to .jpg
function []=problem12()
pic = ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\House.raw',580,440,1); % To show the picture correctly 580 here should be number of columns, 440 should be the number of rows.
pic_uint8 = uint8(pic);
figure(1);
imshow(pic_uint8);

red=1;
green=2;
blue=3;

rebuild(:,:,1)=MHCDemo(pic,red);  %red
rebuild(:,:,2)=MHCDemo(pic,green);  %green
rebuild(:,:,3)=MHCDemo(pic,blue);  %blue

rebuild = uint8(rebuild);
figure(2);
imshow(rebuild)
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\MHC_Demosaicing.raw'];
% %%%saveas(gcf,name);
% universalwriteraw(rebuild,name);

pic_ori = ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\House_ori.raw',580,440,3);

pic_ori_Red = pic_ori(:,:,1);
pic_ori_Green = pic_ori(:,:,2);
pic_ori_Blue = pic_ori(:,:,3);

PSNR_R = PSNRCalculate(rebuild(:,:,1), pic_ori_Red);
disp(['PSNR of red channel ',num2str(PSNR_R)]);
PSNR_G = PSNRCalculate(rebuild(:,:,2), pic_ori_Green);
disp(['PSNR of green channel ',num2str(PSNR_G)]);
PSNR_B = PSNRCalculate(rebuild(:,:,3), pic_ori_Blue);
disp(['PSNR of blue channel ',num2str(PSNR_B)]);
PSNR_average = (PSNR_R + PSNR_G + PSNR_B) / 3;
disp(['PSNR average of the reconstructed image ',num2str(PSNR_average)]);


end