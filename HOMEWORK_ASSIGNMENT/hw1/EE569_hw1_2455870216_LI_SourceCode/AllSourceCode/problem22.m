%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
%%%% Change all the addresses or roots in ModifiedReadraw and
%%%% universalwriteraw before running the code!
%%%% If you want to save jpg result to get some of the image like barplot in my report, you can
%%%% use saveas(gcf,filename) and change the .raw in filename to .jpg
function []=problem22()
pic = ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\Fruits_gray.raw',500,400,1);
pic_noisy = ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\Fruits_gray_noisy.raw',500,400,1);% To show the picture correctly 580 here should be number of columns, 440 should be the number of rows.
pic_uint8 = uint8(pic);
pic_uint8_noisy = uint8(pic_noisy);
figure(1);
imshow(pic_uint8);
figure(2);
imshow(pic_uint8_noisy);

noisegraph=matrixsubtract(pic_noisy,pic);
noise_var=noisevariance(noisegraph);
noise_std = sqrt(noise_var); % As calculated,noise standard deviation is 9.9474.
disp(['standard deviation of the noise  ',num2str(noise_std)]);
count=3;

for r=[1,2,3]% filter radius
    for sigmaC=[0.5,1,2]
        for sigmaS=[10,50,200]
            
            filterimg=bilateralfilter(pic_noisy,r,sigmaC,sigmaS);
            figure(count);
            psnr=PSNRCalculate(filterimg, pic);
            
            filterimg_uint8 = uint8(filterimg);
            imshow(filterimg_uint8);
            titlecontent=sprintf('%s %2.0f %s %2.1f %s %2.1f %s %2.3f','R: ',r,'sigmaC: ',sigmaC,'sigmaS: ',sigmaS,'PSNR: ',psnr);
            title(titlecontent);
%             name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\Bilateral_R=' num2str(r) 'sigmaC' num2str(sigmaC) 'sigmaS' num2str(sigmaS) '.raw'];
%             universalwriteraw(filterimg,name);
            %saveas(gcf,name);
            count=count+1;
        end
    end
     
end


end