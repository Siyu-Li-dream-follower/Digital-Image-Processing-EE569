%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem1a_ski()
pic_ski = modreadraw('ski_person.raw',481,321,3);   % m*n have different meaning in hw2 from hw1 here, in hw1 m:column n:row and it is reversed in hw2, so readraw and write raw must be rewritten
figure(1);
imshow(uint8(pic_ski)); % 481*321*3
R_ski=pic_ski(:,:,1);
G_ski=pic_ski(:,:,2);
B_ski=pic_ski(:,:,3);
pic_ski_gray=RGB2GRAY(R_ski,G_ski,B_ski);
[x_ski_sobel,y_ski_sobel]=sobel_operation(pic_ski_gray);
ski_magnitude=finalGradientMap(x_ski_sobel,y_ski_sobel);

ski_sobel_x_norm = gradientNorm(x_ski_sobel);
ski_sobel_y_norm = gradientNorm(y_ski_sobel);
ski_magnitude_norm = gradientNorm(ski_magnitude);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sobel_x ski
fig_count = 2;
figure(fig_count);
imshow(uint8(ski_sobel_x_norm), 'border','tight','initialmagnification','fit');
title('ski_person.raw X gradient');
fig_count = fig_count + 1;
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\SkiGradientX.jpg'];
% saveas(gcf,name1);

% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\SkiGradientX.raw'];
% hw2writeraw(ski_sobel_x_norm,name2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sobel_y ski
figure(fig_count);
imshow(uint8(ski_sobel_y_norm), 'border','tight','initialmagnification','fit');
title('ski_person.raw Y gradient');
fig_count = fig_count + 1;
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\SkiGradientY.jpg'];
% saveas(gcf,name1);
% 
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\SkiGradientY.raw'];
% hw2writeraw(ski_sobel_y_norm,name2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% magnitude ski
figure(fig_count);
imshow(uint8(ski_magnitude_norm), 'border','tight','initialmagnification','fit');
title('ski_person.raw gradient magnitude');
fig_count = fig_count + 1;
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\SkiMagnitude.jpg'];
% saveas(gcf,name1);
% 
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\SkiMagnitude.raw'];
% hw2writeraw(ski_magnitude_norm,name2);
imwrite(uint8(ski_magnitude_norm), 'ski_sobel_edge.tif');

thresholds = [0.99, 0.98, 0.97, 0.96, 0.95, 0.94, 0.93, 0.92, 0.91, 0.9];

for i=thresholds
    figure(fig_count);
    ski_sobel_binarized = threshBinarize(ski_magnitude_norm,i);
    
    imshow(uint8(ski_sobel_binarized));
    titlecontent=['ski_person.raw final gradient magnitude binarized map threshold= ' num2str(i)];
    title(titlecontent);
    fig_count = fig_count + 1;
%     name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\SkiSobelBin' num2str(i) '.jpg'];
%     saveas(gcf,name1);
%     
%     name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\SkiSobelBin' num2str(i) '.raw'];
%     hw2writeraw(ski_sobel_binarized,name2);
    
end



end