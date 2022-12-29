%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=canny_proba_map(filepathread,filepathwrite)
img = imread(filepathread);
img = rgb2gray(img);


low_thresh = [0.1:0.01:0.3];
high_thresh = [0.4:0.01:0.6];

img_count = 0;
canny = zeros(size(img));
for i=low_thresh
    for j=high_thresh
        if i < (j - 0.2)
            canny = canny + edge(img, 'Canny', [i, j]);
            img_count = img_count + 1;
        end
    end
end
canny = canny / img_count;

imwrite(canny, filepathwrite);


end