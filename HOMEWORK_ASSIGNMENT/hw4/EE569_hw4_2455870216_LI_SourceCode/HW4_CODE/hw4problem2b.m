%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw4problem2b()
img=imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\composite_updated.png');
figcount=1;
figure(figcount);
imshow(uint8(img));
% filename=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem2\ori_composite_img.jpg'];
% saveas(gcf,filename);
figcount=figcount+1;
[m,n]=size(img);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%img = SubtractGlobalMean(img);
fea_map_25_layer = CalFeatureMap(img);

%%%%% Result of Gaussian Fliter with Sigma=10 with Different Radius
radius_vector=[3];
sigma=10;
for radius=radius_vector
    energy_map_25_layer_mn=filterFeaMap_Gaussian(fea_map_25_layer,radius,sigma);
    energy_map_25_divided_mn=matrix_interlayer_divide(energy_map_25_layer_mn,energy_map_25_layer_mn(:,:,1));
    %%% 25 features to 24 features
    energy_map_24_mn = energy_map_25_divided_mn(:,:,2:end);
    energy_map_24_reshaped=matrixToRowReshape(energy_map_24_mn); % reshape matrix to row
    %%% PCA
    energy_map_24_reshaped_pca = PrincipleComponentAnalysis(energy_map_24_reshaped', 3);
    %%% Kmeans
    label_24 = kmeans(energy_map_24_reshaped_pca', 5, 'MaxIter', 2000);% my pca
    labelmap_24=rowToMatrixReshape(label_24',m,n);
    %%%label map to img
    labelimg_24 = labelmapToImg(labelmap_24, 5);
    figure(figcount);
    imshow(uint8(labelimg_24));
    titlecontent=['filter radius = ' num2str(radius)];
    title(titlecontent);
    
%     filename=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem2\label_img_GaussianFilter_PCA_radius=' num2str(radius) '.jpg'];
%     saveas(gcf,filename);
    figcount=figcount+1;
end

radiustable=[5,9,10];
oldlabelmapfiltered=labelimg_24;

for radius=radiustable
    
    labelmapfiltered=imgMajorPulling(oldlabelmapfiltered,radius);
    oldlabelmapfiltered=labelmapfiltered;
    
    figure(figcount);
    imshow(uint8(labelmapfiltered));
    titlecontent=['mode filter radius = ' num2str(radius)];
    title(titlecontent);
    
%     filename=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem2\label_img_GaussianFilter_PCA_moderadius=' num2str(radius) '.jpg'];
%     saveas(gcf,filename);
    
    figcount=figcount+1;
    
end


end