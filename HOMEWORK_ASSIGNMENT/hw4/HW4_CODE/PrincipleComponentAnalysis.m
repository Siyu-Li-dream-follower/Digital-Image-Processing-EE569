%EE569 HOMEWORK ASSIGNMENT 4
%DATE: Mar 25th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function  reducedFeature = PrincipleComponentAnalysis(X, dimension)

XsubtrMean = (X - mean(X))./(std(X)+0.0001);
covar = XsubtrMean'*XsubtrMean;

[V,~] = eig(covar);
[~,n]=size(V);
V = V(:, n-dimension+1: n);
V = V(:, dimension:-1:1);
reducedFeature = XsubtrMean*V;
reducedFeature = reducedFeature';

end