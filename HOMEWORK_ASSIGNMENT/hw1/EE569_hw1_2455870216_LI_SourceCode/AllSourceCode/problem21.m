%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
%%%% Change all the addresses or roots in ModifiedReadraw and
%%%% universalwriteraw before running the code!
%%%% If you want to save jpg result to get some of the image like barplot in my report, you can
%%%% use saveas(gcf,filename) and change the .raw in filename to .jpg

function []=problem21()             %Tansfer function based image intensity equalization
pic = ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\Fruits_gray.raw',500,400,1);
pic_noisy = ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\Fruits_gray_noisy.raw',500,400,1);% To show the picture correctly 580 here should be number of columns, 440 should be the number of rows.
pic_uint8 = uint8(pic);
pic_uint8_noisy = uint8(pic_noisy);
figure(1);
imshow(pic_uint8);
figure(2);
imshow(pic_uint8_noisy);

noisegraph=matrixsubtract(pic,pic_noisy);
[noisehist,maxnoise,minnoise]=noiseHistogram(noisegraph);
% figure(3);
% imshow(noisegraph);
figure(3);
x_axis = minnoise:maxnoise;
bar(x_axis, noisehist);
name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\hw1_result_image\problem21\noiseDistribution.jpg'];
%%saveas(gcf,name); 

noiseavg=noiseaverage(noisegraph);
noise_var=noisevariance(noisegraph);
noise_std = sqrt(noise_var); % As calculated,noise standard deviation is 9.9474.
disp(['noise mean ',num2str(noiseavg)]);
disp(['standard deviation of the noise  ',num2str(noise_std)]);
count=4;

for i=[1,2,3,4]     % filter radius
    
    filterimg=filterUnifWeight(pic_noisy,i);
    psnr=PSNRCalculate(filterimg, pic);
    
    figure(i);
    filterimg_uint8 = uint8(filterimg);
    imshow(filterimg_uint8);
    title(['r: ',num2str(i),'  PSNR: ',num2str(psnr)]);
    
%     name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\UnifWeight_R=' num2str(i) '.raw'];
%     universalwriteraw(filterimg,name);
    %%saveas(gcf,name); 
    count=count+1;
end

 
for i=[1,2,3,4]      % filter radius
    for j=[0.1, 0.2 , 0.5, 1, 5, 9.9];  % filter standard deviation
        filterimgG = filterGaussian(pic_noisy,i,j);
        psnr=PSNRCalculate(filterimgG, pic);
        
        figure(count);
        filterimgG_uint8 = uint8(filterimgG);
        imshow(filterimgG_uint8);
        title(['sigma: ',num2str(j),'  r: ',num2str(i),'  PSNR: ',num2str(psnr)]);
%         name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\GaussianWeight_R=' num2str(i) 'sigma=' num2str(j) '.raw'];
%         universalwriteraw(filterimgG,name);
        %%saveas(gcf,name);
        count=count+1;
        
    end
end 
    
end