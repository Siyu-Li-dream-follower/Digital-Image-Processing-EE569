%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
%%%% Change all the addresses or roots in ModifiedReadraw and
%%%% universalwriteraw before running the code!
%%%% If you want to save jpg result to get some of the image like barplot in my report, you can
%%%% use saveas(gcf,filename) and change the .raw in filename to .jpg
function []=problem14()             %Tansfer function based image intensity equalization
pic = ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\Toy.raw',400,560,1); % To show the picture correctly 580 here should be number of columns, 440 should be the number of rows.
pic_uint8 = uint8(pic);
figure(1);
imshow(pic_uint8);
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\hw1_result_image\problem14\Original_Toy_Image.jpg'];
%%saveas(gcf,name);

figure(2);
equalizedpic=rearrange(pic);
imshow(uint8(equalizedpic));
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\CulmuProbBasedEqualizedPic.raw'];
%%saveas(gcf,name);
% universalwriteraw(equalizedpic,name);

figure(3);
pmfEqualizedpic=CalHist(equalizedpic);
bar(pmfEqualizedpic);
xlabel('Pixel Intensity');
ylabel('Frequency');
title('Equalized Picture Histogram');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\hw1_result_image\problem14\EqualizedPicHist.jpg'];
%%saveas(gcf,name);

figure(4);
cdfEqualizedpic=cumulativeHistogram(pmfEqualizedpic);
bar(cdfEqualizedpic);
xlabel('Pixel Intensity');
ylabel('Cumulative Frequency');
title('Equalized Picture Cumulative Histogram');
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\hw1_result_image\problem14\EqualizedPicCumulHist.jpg'];
%%saveas(gcf,name);

end