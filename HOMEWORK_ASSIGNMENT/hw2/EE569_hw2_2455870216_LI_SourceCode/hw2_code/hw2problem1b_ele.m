%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw2problem1b_ele()
pic_ele = modreadraw('elephant.raw',321,481,3);   % m*n have different meaning in hw2 from hw1 here, in hw1 m:column n:row and it is reversed in hw2, so readraw and write raw must be rewritten
figure(1);
imshow(uint8(pic_ele)); % 321*481*3

R_pic=pic_ele(:,:,1);
G_pic=pic_ele(:,:,2);
B_pic=pic_ele(:,:,3);

pic_gray = RGB2GRAY(R_pic,G_pic,B_pic);
low_thresh = [0.1, 0.15, 0.2, 0.25, 0.3, 0.35];
high_thresh = [0.2, 0.3, 0.4, 0.5, 0.6];
fig_count = 1;
for i=low_thresh
    for j=high_thresh
        if i<j
            pic_canny = edge(pic_gray, 'Canny', [i, j]); %%1:2, 1:3
            figure(fig_count);
            
            imshow(pic_canny); % img are double itself, no need for uint8
            titlecontent=['elephant.raw canny low_thresh= ' num2str(i) ' high_thresh= ' num2str(j)];
            title(titlecontent);
            fig_count = fig_count + 1;
%             name1 = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\EleCannyLOW' num2str(i) 'High' num2str(j) '.jpg'];
%             saveas(gcf,name1);
%             
%             name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\EleCannyLOW' num2str(i) 'High' num2str(j) '.raw'];
%             hw2writeraw(pic_canny,name2);
            
            
        end
    end
end


end