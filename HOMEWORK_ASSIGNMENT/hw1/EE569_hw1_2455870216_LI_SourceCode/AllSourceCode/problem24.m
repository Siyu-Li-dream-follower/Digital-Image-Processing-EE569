%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
%%%% Change all the addresses or roots in ModifiedReadraw and
%%%% universalwriteraw before running the code!
%%%% If you want to save jpg result to get some of the image like barplot in my report, you can
%%%% use saveas(gcf,filename) and change the .raw in filename to .jpg
function []=problem24()
pic = ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\Fruits.raw',500,400,3);
pic_noisy = ModifiedReadraw('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\HW1_images\Fruits_noisy.raw',500,400,3);% To show the picture correctly 580 here should be number of columns, 440 should be the number of rows.
pic_uint8 = uint8(pic);
pic_uint8_noisy = uint8(pic_noisy);
figure(1);
imshow(pic_uint8);
figure(2);
imshow(pic_uint8_noisy);
% name1  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\hw1_result_image\problem23\untitled' num2str(count) '.jpg'];
% saveas(gcf,name1);
[m,n,d]=size(pic_noisy);
R_pic_noisy=zeros(m,n);
G_pic_noisy=zeros(m,n);
B_pic_noisy=zeros(m,n);
R_pic_noisy=pic_noisy(:,:,1);
G_pic_noisy=pic_noisy(:,:,2);
B_pic_noisy=pic_noisy(:,:,3);

R_pic=zeros(m,n);
G_pic=zeros(m,n);
B_pic=zeros(m,n);
R_pic=pic(:,:,1);
G_pic=pic(:,:,2);
B_pic=pic_noisy(:,:,3);

Rnoisegraph=matrixsubtract(R_pic_noisy,R_pic);
[Rnoisehist,Rmaxnoise,Rminnoise]=noiseHistogram(Rnoisegraph);
figure(3);
x_axis = Rminnoise:Rmaxnoise;
bar(x_axis, Rnoisehist);
title('Noise histogram of Red channel');

Gnoisegraph=matrixsubtract(G_pic_noisy,G_pic);
[Gnoisehist,Gmaxnoise,Gminnoise]=noiseHistogram(Gnoisegraph);
figure(4);
x_axis = Gminnoise:Gmaxnoise;
bar(x_axis, Gnoisehist);
title('Noise histogram of Green channel');

Bnoisegraph=matrixsubtract(B_pic_noisy,B_pic);
[Bnoisehist,Bmaxnoise,Bminnoise]=noiseHistogram(Bnoisegraph);
figure(5);
x_axis = Bminnoise:Bmaxnoise;
bar(x_axis, Bnoisehist);
title('Noise histogram of blue channel');

Rnoise_var=noisevariance(Rnoisegraph);
Gnoise_var=noisevariance(Gnoisegraph);
%Bnoise_var=noisevariance(Bnoisegraph);
noise_var_total=(1/3)*(Rnoise_var+Gnoise_var); % blue channel has no noise so it var is regarded as 0 here
noise_std = sqrt(noise_var_total); % As calculated,noise standard deviation is 25.2215.
disp(['standard deviation of the noise  ',num2str(noise_std)]);

Rfilterimg=outlierRemove(R_pic_noisy,60);
Gfilterimg=outlierRemove(G_pic_noisy,60);
Bfilterimg=outlierRemove(B_pic_noisy,60);

RfilterimgNoise=matrixsubtract(Rfilterimg,B_pic);
GfilterimgNoise=matrixsubtract(Gfilterimg,G_pic);
Rnoise_var=noisevariance(RfilterimgNoise);
Gnoise_var=noisevariance(GfilterimgNoise);
%Bnoise_var=noisevariance(Rfilterimg);
noise_var_total=(1/3)*(Rnoise_var+Gnoise_var); % blue channel has no noise so it var is regarded as 0 here
noise_std = sqrt(noise_var_total); % As calculated,noise standard deviation is 47.2661.
disp(['standard deviation of the noise after outlier removal  ',num2str(noise_std)]);

picOutRemov=zeros(m,n,d);
picOutRemov(:,:,1)=Rfilterimg;
picOutRemov(:,:,2)=Gfilterimg;
picOutRemov(:,:,3)=Bfilterimg;
figure(6);
picOutRemov_uint8=uint8(picOutRemov);
imshow(picOutRemov_uint8);

titlecontent=['Outlier Removed Picture'];
title(titlecontent);
% name  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\outlierRemovedPic.raw'];
% %saveas(gcf,name);
% universalwriteraw(picOutRemov,name);

count=7;
% other used values are in the notation
for R_small=[1]% filter radius small window %2,3,4
    for R_large=[5] % filter radius large window %5,6,7
        %for h=[30,40,50]
            
                RfilterimgNL=NLmeansfilter(Rfilterimg,R_small,R_large,30,25);
                GfilterimgNL=NLmeansfilter(Gfilterimg,R_small,R_large,30,25);
                BfilterimgNL=NLmeansfilter(Bfilterimg,R_small,R_large,30,25);
                
                picOutRemovNL=zeros(m,n,d);
                picOutRemovNL(:,:,1)=RfilterimgNL;
                picOutRemovNL(:,:,2)=GfilterimgNL;
                picOutRemovNL(:,:,3)=BfilterimgNL;
                figure(count);
                picOutRemovNL_uint8=uint8(picOutRemovNL);
                
                psnrR=PSNRCalculate(RfilterimgNL, R_pic);
                psnrG=PSNRCalculate(GfilterimgNL, G_pic);
                psnrB=PSNRCalculate(BfilterimgNL, B_pic);
                psnr=(1/3)*(psnrR+psnrG+psnrB);
                
                imshow(picOutRemovNL_uint8);
                titlecontent=sprintf('%s %2.0f %s %2.0f %s %2.3f','Rsmall: ',R_small,'Rlarge: ',R_large,'PSNR: ',psnr);
                title(titlecontent);
%                 name1  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\outlierNLmeans' num2str(count) '.raw']; %%% OutlierNL\
%                 universalwriteraw(picOutRemovNL,name1);
                %saveas(gcf,name1);
                count=count+1;
        %end
    end
end
%%%%%Bilateral filter
for r=[1,2,3]% filter radius
    for sigmaC=[0.5,1,2]
        for sigmaS=[10,50,200]
            
            RfilterimgBI=bilateralfilter(Rfilterimg,r,sigmaC,sigmaS);
            GfilterimgBI=bilateralfilter(Gfilterimg,r,sigmaC,sigmaS);
            BfilterimgBI=bilateralfilter(Bfilterimg,r,sigmaC,sigmaS);
            
            picOutRemovBI=zeros(m,n,d);
            picOutRemovBI(:,:,1)=RfilterimgBI;
            picOutRemovBI(:,:,2)=GfilterimgBI;
            picOutRemovBI(:,:,3)=BfilterimgBI;
            
            picOutRemovBI_uint8=uint8(picOutRemovBI);
            
            psnrR=PSNRCalculate(RfilterimgBI, R_pic);
            psnrG=PSNRCalculate(GfilterimgBI, G_pic);
            psnrB=PSNRCalculate(BfilterimgBI, B_pic);
            psnr=(1/3)*(psnrR+psnrG+psnrB);
            figure(count);
            imshow(picOutRemovBI_uint8);
            titlecontent=sprintf('%s %2.0f %s %2.0f %s %2.1f %s %2.3f','r: ',r,' sigmaC: ',sigmaC,' sigmaS: ',sigmaS,' Filtered Image PSNR: ',psnr);
            %titlecontent=sprintf('%s %2.3f','Filtered Image PSNR: ',psnr);
            title(titlecontent);
%             name2  = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw1\submissiontest\outlierBilateral' num2str(count) '.raw'];
%             universalwriteraw(picOutRemovBI,name2);
            %saveas(gcf,name2);
            count=count+1;
        end
    end
     
end


end