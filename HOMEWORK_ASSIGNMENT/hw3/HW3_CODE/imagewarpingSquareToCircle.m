%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgwrapped=imagewarpingSquareToCircle(imgori)
[m,n,d]=size(imgori);
R=imgori(:,:,1);
G=imgori(:,:,2);
B=imgori(:,:,3);
%%% Red PART
[IDestR,JDestR]=imgToCordinate(R);

[ISourceR,JSourceR]=EGMwrapPointReverseMapping(IDestR,JDestR);
newR=projectToCircle(R,ISourceR,JSourceR);

%%% Green PART
[IDestG,JDestG]=imgToCordinate(G);

[ISourceG,JSourceG]=EGMwrapPointReverseMapping(IDestG,JDestG);
newG=projectToCircle(G,ISourceG,JSourceG);


%%% Blue PART
[IDestB,JDestB]=imgToCordinate(B);

[ISourceB,JSourceB]=EGMwrapPointReverseMapping(IDestB,JDestB);
newB=projectToCircle(B,ISourceB,JSourceB);

imgwrapped = zeros(m,n,d);
imgwrapped(:, :, 1) = newR;
imgwrapped(:, :, 2) = newG;
imgwrapped(:, :, 3) = newB;



end