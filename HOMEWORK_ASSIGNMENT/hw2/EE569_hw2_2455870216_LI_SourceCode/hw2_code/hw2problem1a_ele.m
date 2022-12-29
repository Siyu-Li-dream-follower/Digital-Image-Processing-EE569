%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem1a_ele()
pic_ele = modreadraw('elephant.raw',321,481,3);   % m*n have different meaning in hw2 from hw1 here, in hw1 m:column n:row and it is reversed in hw2, so readraw and write raw must be rewritten
figure(1);
imshow(uint8(pic_ele)); % 321*481*3
R_ele=pic_ele(:,:,1);
G_ele=pic_ele(:,:,2);
B_ele=pic_ele(:,:,3);
pic_ele_gray=RGB2GRAY(R_ele,G_ele,B_ele);
[x_ele_sobel,y_ele_sobel]=sobel_operation(pic_ele_gray);
ele_magnitude=finalGradientMap(x_ele_sobel,y_ele_sobel);

ele_sobel_x_norm = gradientNorm(x_ele_sobel);
ele_sobel_y_norm = gradientNorm(y_ele_sobel);
ele_magnitude_norm = gradientNorm(ele_magnitude);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sobel_x ele
fig_count = 2;
figure(fig_count);
imshow(uint8(ele_sobel_x_norm), 'border','tight','initialmagnification','fit');
title('elephant.raw X Gradient');
fig_count = fig_count + 1;
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\EleGradientX.jpg'];
% saveas(gcf,name1);
% 
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\EleGradientX.raw'];
% hw2writeraw(ele_sobel_x_norm,name2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% sobel_y ele
figure(fig_count);
imshow(uint8(ele_sobel_y_norm), 'border','tight','initialmagnification','fit');
title('elephant.raw Y Gradient');
fig_count = fig_count + 1;
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\EleGradientY.jpg'];
% saveas(gcf,name1);
% 
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\EleGradientY.raw'];
% hw2writeraw(ele_sobel_y_norm,name2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% magnitude ele
figure(fig_count);
imshow(uint8(ele_magnitude_norm), 'border','tight','initialmagnification','fit');
title('elephant.raw final gradient magnitude');
fig_count = fig_count + 1;
% name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\EleMagnitude.jpg'];
% saveas(gcf,name1);
% 
% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\EleMagnitude.raw'];
% hw2writeraw(ele_magnitude_norm,name2);
imwrite(uint8(ele_magnitude_norm), 'ele_sobel_edge.tif'); %%% This will be used in problem 1(d) !!!!!

thresholds = [0.98, 0.97, 0.96, 0.95, 0.94, 0.93, 0.92, 0.91, 0.9, 0.89,0.88];

for i=thresholds
    figure(fig_count);
    ele_sobel_binarized = threshBinarize(ele_magnitude_norm,i);
    
    imshow(uint8(ele_sobel_binarized));
    titlecontent=['elephant.raw final gradient magnitude binarized map threshold= ' num2str(i)];
    title(titlecontent);
    fig_count = fig_count + 1;
%     name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\EleSobelBin' num2str(i) '.jpg'];
%     saveas(gcf,name1);
%     
%     name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\EleSobelBin' num2str(i) '.raw'];
%     hw2writeraw(ele_sobel_binarized,name2);
    
end

end