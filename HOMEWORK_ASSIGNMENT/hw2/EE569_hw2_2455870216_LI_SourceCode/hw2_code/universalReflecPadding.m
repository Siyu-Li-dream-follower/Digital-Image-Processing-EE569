%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23rd 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgPadded=universalReflecPadding(img,n)  %n is what you want to padd

[row,col]=size(img); 
imgPadded=zeros(row+2*n,col+2*n);
imgPadded(n+1:row+n,n+1:col+n)=img;

for i=1:n
imgPadded(n+1-i,n+1:col+n)=imgPadded(n+1+i,n+1:col+n);        % pad above
imgPadded(row+n+i,n+1:col+n)=imgPadded(row+n-i,n+1:col+n);    % pad below
end

for i=1:n
imgPadded(1:row+2*n,n+1-i)=imgPadded(1:row+2*n,n+1+i);        % pad left
imgPadded(1:row+2*n,col+n+i)=imgPadded(1:row+2*n,col+n-i);    % pad right bug here!!!!!
end

end