% Demo for Structured Edge Detector (please see readme.txt first).

%% set opts for training (see edgesTrain.m)
opts=edgesTrain();                % default options (good settings)
opts.modelDir='models/';          % model will be in models/forest
opts.modelFnm='modelBsds';        % model name
opts.nPos=5e5; opts.nNeg=5e5;     % decrease to speedup training
opts.useParfor=0;                 % parallelize if sufficient memory

%% train edge detector (~20m/8Gb per tree, proportional to nPos/nNeg)
tic, model=edgesTrain(opts); toc; % will load model if already trained

%% set detection parameters (can set after training)
model.opts.multiscale=1;          % for top accuracy set multiscale=1
model.opts.sharpen=2;             % for top speed set sharpen=0
model.opts.nTreesEval=4;          % for top speed set nTreesEval=1
model.opts.nThreads=4;            % max number threads for evaluation
model.opts.nms=1;                 % set to true to enable nms

%% evaluate edge detector on BSDS500 (see edgesEval.m)
if(0), edgesEval( model, 'show',1, 'name','' ); end

%% detect edge and visualize results
I1 = imread('ski_person.jpg');
tic, E1=edgesDetect(I1,model); toc
figure(1); im(I1); figure(2); im(E1);
imwrite(double(E1), 'ski_person_se_edge.tif');

% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\ski_person_se_edge.raw'];
% hw2writeraw(double(E1),name2);

maxi=0.15*max(max(E1));
[m,n]=size(E1);
E1W=zeros(m,n);
for i=1:m
    for j=1:n
        if E1(i,j) > maxi
            E1W(i,j)=255;
        else
            E1W(i,j)=0;
        end
    end
end
% imwrite(double(E1W), 'C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\ski_person_se_edge_binary.tif');

I2 = imread('elephant.jpg');
tic, E2=edgesDetect(I2,model); toc
figure(3); im(I2); figure(4); im(E2);
imwrite(double(E2), 'elephant_se_edge.tif');

% name2  =  ['C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1raw\elephant_se_edge.raw'];
% hw2writeraw(double(E2),name2);

maxi=0.15*max(max(E2));
[m,n]=size(E2);
E2W=zeros(m,n);
for i=1:m
    for j=1:n
        if E2(i,j) > maxi
            E2W(i,j)=255;
        else
            E2W(i,j)=0;
        end
    end
end
% imwrite(double(E2W), 'C:\Users\Appli\Desktop\EE569\HOMEWORK_ASSIGNMENT\hw2\hw2result\problem1\elephant_se_edge_binary.tif');


