%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function []=hw3problem1()
%%%%%%% dog
imgDog=hw3readraw('Dog.raw',329,329,3);
figcount=1;
figure(figcount);
imshow(uint8(imgDog));
figcount=figcount+1;
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1\imgdogOri.jpg'];
% saveas(gcf,filename);
%%%%%%% dog wrap
imgDogwrapped=imagewarpingSquareToCircle(imgDog);

figure(figcount);
imshow(uint8(imgDogwrapped));
figcount=figcount+1;

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1\imgdogwrapped.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1raw\imgdogwrapped.raw'];
% hw3writeraw(imgDogwrapped,filename);
%%%%%%% dog unwrap
imgDogunwrapped=imageunwrapingCircleToSquare(imgDogwrapped);

figure(figcount);
imshow(uint8(imgDogunwrapped));
figcount=figcount+1;

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1\imgdogunwrapped.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1raw\imgdogunwrapped.raw'];
% hw3writeraw(imgDogunwrapped,filename);
%%%%%%% 22 wrap
img22=hw3readraw('22.raw',329,329,3);

figure(figcount);
imshow(uint8(img22));
figcount=figcount+1;
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1\img22ori.jpg'];
% saveas(gcf,filename);
%%%%%%% 22 wrap
img22wrapped=imagewarpingSquareToCircle(img22);

figure(figcount);
imshow(uint8(img22wrapped));
figcount=figcount+1;

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1\img22wrapped.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1raw\img22wrapped.raw'];
% hw3writeraw(img22wrapped,filename);
%%%%%%% 22 unwrap
img22unwrapped=imageunwrapingCircleToSquare(img22wrapped);

figure(figcount);
imshow(uint8(img22unwrapped));
figcount=figcount+1;

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1\img22unwrapped.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1raw\img22unwrapped.raw'];
% hw3writeraw(img22unwrapped,filename);

%%%%%%% Forky wrap
imgForky=hw3readraw('Forky.raw',329,329,3);

figure(figcount);
imshow(uint8(imgForky));
figcount=figcount+1;
% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1\imgForkyOri.jpg'];
% saveas(gcf,filename);
%%%%%%% Forky wrap
imgForkywrapped=imagewarpingSquareToCircle(imgForky);

figure(figcount);
imshow(uint8(imgForkywrapped));
figcount=figcount+1;

% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1\imgForkywrapped.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1raw\imgForkywrapped.raw'];
% hw3writeraw(imgForkywrapped,filename);
%%%%%%% Forky unwrap
imgForkyunwrapped=imageunwrapingCircleToSquare(imgForkywrapped);

figure(figcount);
imshow(uint8(imgForkyunwrapped));


% filename = ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1\imgForkyunwrapped.jpg'];
% saveas(gcf,filename);
% 
% filename  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw3\HW3RESULT\problem1raw\imgForkyunwrapped.raw'];
% hw3writeraw(imgForkyunwrapped,filename);

end
