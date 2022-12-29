%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgunwrap=imageunwrapingCircleToSquare(imgwrap)
[m,n,d]=size(imgwrap);
R=imgwrap(:,:,1);
G=imgwrap(:,:,2);
B=imgwrap(:,:,3);
%%% Red PART
[IDestR,JDestR]=imgToCordinate(R);

[ISourceR,JSourceR]=EGMPointReverseMapping_Unwrap(IDestR,JDestR);
newR=projectToSquare(R,ISourceR,JSourceR);

%%% Green PART
[IDestG,JDestG]=imgToCordinate(G);

[ISourceG,JSourceG]=EGMPointReverseMapping_Unwrap(IDestG,JDestG);
newG=projectToSquare(G,ISourceG,JSourceG);


%%% Blue PART
[IDestB,JDestB]=imgToCordinate(B);

[ISourceB,JSourceB]=EGMPointReverseMapping_Unwrap(IDestB,JDestB);
newB=projectToSquare(B,ISourceB,JSourceB);

imgunwrap = zeros(m,n,d);
imgunwrap(:, :, 1) = newR;
imgunwrap(:, :, 2) = newG;
imgunwrap(:, :, 3) = newB;









end