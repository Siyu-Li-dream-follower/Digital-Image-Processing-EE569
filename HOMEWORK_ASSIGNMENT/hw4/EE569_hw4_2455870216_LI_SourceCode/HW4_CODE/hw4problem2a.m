%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw4problem2a()
img=imread('C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\HW4_material\composite_updated.png');
figcount=1;
figure(figcount);
imshow(uint8(img));
figcount=figcount+1;
[m,n]=size(img);

img = SubtractGlobalMean(img); %%%%% Yo can remove this step if you want
fea_map_25_layer = CalFeatureMap(img);
%%%%% Result of Average Filter with Different Radius
radius_vector=[3,6,11,17,25,40];
for radius=radius_vector
    energy_map_25_layer_mn=filterFeaMap_average(fea_map_25_layer,radius);
    energy_map_25_divided_mn=matrix_interlayer_divide(energy_map_25_layer_mn,energy_map_25_layer_mn(:,:,1));
    %%% 25 features to 24 features
    energy_map_24_mn = energy_map_25_divided_mn(:,:,2:end);
    energy_map_24_reshaped=matrixToRowReshape(energy_map_24_mn); % reshape matrix to row
    %%% K means
    label_24 = kmeans(energy_map_24_reshaped', 5, 'MaxIter', 2000);
    labelmap_24=rowToMatrixReshape(label_24',m,n);
    
    labelimg_24 = labelmapToImg(labelmap_24, 5);
    figure(figcount);
    imshow(uint8(labelimg_24));
    titlecontent=['average filter radius = ' num2str(radius)];
    title(titlecontent);
%     filename=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem2\p2a_avefilter_radius=' num2str(radius) '.jpg'];
%     saveas(gcf,filename);
    figcount=figcount+1;
end
%%%%% Result of Gaussian Fliter with Sigma=10 with Different Radius
sigma=10;
for radius=radius_vector
    energy_map_25_layer_mn=filterFeaMap_Gaussian(fea_map_25_layer,radius,sigma);
    energy_map_25_divided_mn=matrix_interlayer_divide(energy_map_25_layer_mn,energy_map_25_layer_mn(:,:,1));
     %%% 25 features to 24 features
    energy_map_24_mn = energy_map_25_divided_mn(:,:,2:end);
    energy_map_24_reshaped=matrixToRowReshape(energy_map_24_mn); % reshape matrix to row
     %%% K means
    label_24 = kmeans(energy_map_24_reshaped', 5, 'MaxIter', 2000);
    labelmap_24=rowToMatrixReshape(label_24',m,n);
    
    labelimg_24 = labelmapToImg(labelmap_24, 5);
    figure(figcount);
    imshow(uint8(labelimg_24));
    titlecontent=['gaussian filter radius = ' num2str(radius)];
    title(titlecontent);
%     filename=['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw4\hw4_result\problem2\p2a_GaussianFilter_radius=' num2str(radius) '.jpg'];
%     saveas(gcf,filename);
    figcount=figcount+1;
end


end