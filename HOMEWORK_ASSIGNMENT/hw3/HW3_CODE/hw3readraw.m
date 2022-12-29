%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function img=hw3readraw(filename,row,col,dimension)
  
  disp(['Retrieving Image' filename '...']);
  
  fid=fopen(filename,'rb');
  
  if (fid==-1)
      error('can not open input image file press CTRL-C to exit \n');
   pause
  end
  % Get all the pixels from the image
	pixel = fread(fid, inf, 'uchar');

	% Close file
	fclose(fid);

  img=zeros(row,col,dimension);
  
  for layer=1:dimension
     temp=layer;
      for i=1:row
          for j=1:col
              
              img(i,j,layer)=pixel(temp);
              temp=temp+dimension;
          end
      end
  end
  
  
end
