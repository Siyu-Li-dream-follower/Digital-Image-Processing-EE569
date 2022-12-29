%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [P_mean, R_mean, F_mean] = calPRFmean(cntR, sumR, cntP, sumP,thrs)
P_mean = 0;
R_mean = 0;
F_mean = 0;
len=length(thrs);
for i =1:len
    P = cntP(i,1)/(sumP(i,1)+0.001); %avoid being divided by 0
    R = cntR(i,1)/(sumR(i,1)+0.001);
    P_mean = P_mean+P;
    R_mean = R_mean+R;
    F_mean = F_mean+ ((2*P*R)/(P+R+0.0001));
end

P_mean = P_mean/len;
R_mean = R_mean/len;
F_mean = F_mean/len;

end