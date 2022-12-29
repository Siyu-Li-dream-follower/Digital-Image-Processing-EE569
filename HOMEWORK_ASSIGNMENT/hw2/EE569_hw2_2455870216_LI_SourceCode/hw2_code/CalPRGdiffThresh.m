%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [P,R,F]=CalPRGdiffThresh(cntR, sumR, cntP, sumP,thrs)
lenthrsR=length(thrs);
P=zeros(1,lenthrsR);
R=zeros(1,lenthrsR);
F=zeros(1,lenthrsR);

for i =1:lenthrsR
    
    P(1,i) = cntP(i,1)/sumP(i,1);
    R(1,i) = cntR(i,1)/sumR(i,1);
    F(1,i) = ((2*P(1,i)*R(1,i))/(P(1,i)+R(1,i)));
    
end

end