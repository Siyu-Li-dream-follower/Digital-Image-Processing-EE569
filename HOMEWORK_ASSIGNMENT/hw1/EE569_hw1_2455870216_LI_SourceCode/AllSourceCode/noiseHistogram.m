%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [noisehist,maxnoise,minnoise]=noiseHistogram(noise)
[m,n]=size(noise);
noiseabs=absolutevalue(noise);
maxnoise=max(max(noiseabs));
minnoise=min(min(noise));

noisehist=zeros(1,maxnoise-minnoise+1);

  for i=1:m
      for j=1:n
          noisehist(1,noise(i,j)-minnoise+1)=noisehist(1,noiseabs(i,j)-minnoise+1)+1;
      end
  end
  
end