%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
%%%% Change all the addresses or roots in ModifiedReadraw and
%%%% universalwriteraw before running the code!
%%%% If you want to save jpg result to get some of the image like barplot in my report, you can
%%%% use saveas(gcf,filename) and change the .raw in filename to .jpg
function []=problem13()             %Tansfer function based image intensity equalization
pic = ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\Toy.raw',400,560,1); % To show the picture correctly 580 here should be number of columns, 440 should be the number of rows.
pic_uint8 = uint8(pic);
figure(1);
imshow(pic_uint8);
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\OriginalToy.jpg'];
%%saveas(gcf,name);


picpmf=CalHist(pic);

figure(2);
bar(picpmf);
xlabel('Pixel Intensity');
ylabel('Frequency');
title('Toy Picture Histogram');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\Toy_Picture_Histogram.jpg'];
%%saveas(gcf,name);

[m,n]=size(pic);
normalizeTerm=256/(m*n);
transferfunc=normalizeTerm*cumulativeHistogram(picpmf);
figure(3);
plot(transferfunc);
xlabel('Original Pixels');
ylabel('Transformed Pixels');
title('Transfer Function');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\hw1_result_image\problem13\Transfer_Function.jpg'];
%%% saveas(gcf,name);

equalizedImg=intensityTransfer(pic,transferfunc);
figure(4);
equalizedImg_uint8=uint8(equalizedImg);
imshow(equalizedImg_uint8);
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\Equalized_Toy_Image.raw'];
% %%saveas(gcf,name);
% universalwriteraw(equalizedImg,name);

equalizedImgpmf=CalHist(round(equalizedImg)); % transfer function introduce fractional number,here we use round() to make it integral
figure(5);
bar(equalizedImgpmf);
xlabel('Pixel Intensity');
ylabel('Frequency');
title('Equalized Picture Histogram');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\hw1_result_image\problem13\Equalized_Toy_Image_Histogram.jpg'];
%%saveas(gcf,name);

figure(6);
cdfEqualizedpic=cumulativeHistogram(equalizedImgpmf);
bar(cdfEqualizedpic);
xlabel('Pixel Intensity');
ylabel('Cumulative Frequency');
title('Equalized Picture Cumulative Histogram');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\hw1_result_image\problem13\EqualizedPicCumulHist1.jpg'];
%%saveas(gcf,name);

end