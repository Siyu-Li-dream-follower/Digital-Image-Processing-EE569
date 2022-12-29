%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgt=ModifiedReadraw(filename,row,col,dimension)
  
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
      for j=1:col
          for i=1:row
              
              img(i,j,layer)=pixel(temp);
              temp=temp+dimension;
          end
      end
  end
  
  imgt=zeros(col,row,dimension);
  
  for layer=1:dimension
      imgt(:,:,layer)=MatrixTranspose(img(:,:,layer)); 
  end
  
end