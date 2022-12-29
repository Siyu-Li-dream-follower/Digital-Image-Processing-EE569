%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function raw = hw3writeraw(img, filename)

disp([' Write raw image to'  filename ' ...']);

% Get file ID
fid = fopen(filename,'wb');
[m,n,dimen]=size(img);

imgsize = m*n;
% To check if the file exists
if (fid == -1)
    error('can not open output image filem press CTRL-C to exit \n');
    pause
end

pixels = zeros(1,imgsize*dimen);

for layer=1:dimen
    temp=layer;
    for i=1:m % n=501
        for j=1:n %m=332
            
            pixels(temp)=img(i,j,layer); % 500*400*3 to
            temp=temp+dimen;
        end
    end
end

% Write and close file
raw = fwrite(fid,pixels, 'uchar');
fclose(fid);


end %function