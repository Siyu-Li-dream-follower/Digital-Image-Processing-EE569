%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgt=rearrange(img)
[m,n]=size(img);
for i=1:m
    for j=1:n
        img(i,j)=img(i,j)+1;
    end
end
pixelindex=zeros(1,m*n);

time=1;
for pixel=1:256
    index=1;
   
    for i=1:m
        for j=1:n
            if img(i,j)==pixel
                pixelindex(1,time)=index;   % collect label by number
                time=time+1;
            end
            index=index+1;
        end
    end
    
end
pmf=CalHist(img);

temp=1;
interval=zeros(1,m*n);
for i=1:256
    interval(1,temp:(temp+pmf(1,i)-1))=pixelindex(1,temp:(temp+pmf(1,i)-1));
    
    tpp=interval(1,temp:(temp+pmf(1,i)-1));
    interval(1,temp:(temp+pmf(1,i)-1))=tpp(randperm(length(tpp))); %finish randomize
    temp=temp+pmf(1,i);                                            % interval restores m*n=224000 position, we use one number rather than i,j to memorize 
                                                                   %the position of image element, we can transform it into i,j by calculate with num of row m and col n
end
imgt=zeros(m,n);
for i=1:256
    next(:,i)=interval(1,((i-1)*m*n/256+1):(i*m*n/256));              % redistribute intensity
    for j=1:875
        rol=floor(next(j,i)/n)+1;
        if mod(next(j,i),n)==0
            col=n;
        else
            col=mod(next(j,i),n);
        end
            
        imgt(rol,col)=i;
    end
end
end