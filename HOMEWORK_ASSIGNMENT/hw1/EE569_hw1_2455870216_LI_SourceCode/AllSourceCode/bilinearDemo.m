%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function  demosaicedLayer=bilinearDemo(img,color)
% color notation Red 1,Green 2,Blue 3
 [col,row]=size(img); %col:440  row:580
 demosaicedLayer=zeros(col,row);
 
 imgPadded=universalPadding(img,1);
 switch color
     case 1  %for red
       for i = 1:col
         for j = 1:row
             if  mod(i,2) == 0 && mod(j,2) == 0
              demosaicedLayer(i,j) = 0.5*(imgPadded(i+1,j)+imgPadded(i+1,j+2));   %blue column green
             
             elseif mod(i,2)==1 && mod(j,2)==0
              demosaicedLayer(i,j) = imgPadded(i+1,j+1);                           %red
             
             elseif mod(i,2) == 1 && mod(j,2) == 1
             demosaicedLayer(i,j) = 0.5*(imgPadded(i,j+1)+imgPadded(i+2,j+1)); %red column green
             
             else 
             demosaicedLayer(i,j) = 0.25*(imgPadded(i,j)+imgPadded(i,j+2)+imgPadded(i+2,j+2)+imgPadded(i+2,j));% blue
             end
          end
       end
        
     case 2  %for green
         for i =1:col
             for j =1:row
                 if mod(i,2) == 1 && mod(j,2) == 1
                     demosaicedLayer(i,j) = imgPadded(i+1,j+1); %green
                 elseif mod(i,2) == 0 && mod(j,2) == 0
                     demosaicedLayer(i,j) = imgPadded(i+1,j+1); %green
                 elseif mod(i,2)==0 && mod(j,2)==1
                     demosaicedLayer(i,j) = 0.25*(imgPadded(i+2,j+1)+imgPadded(i+1,j)+imgPadded(i+1,j+2)+imgPadded(i,j));%red
                 else
                     demosaicedLayer(i,j) = 0.25*(imgPadded(i+1,j+2)+imgPadded(i,j+1)+imgPadded(i+2,j+1)+imgPadded(i+1,j));
                 end
             end
         end
      
     otherwise          %for blue
         for i =1:col
            for j = 1:row
                if mod(i,2)==1 && mod(j,2)==1
                 demosaicedLayer(i,j) = 0.5*(imgPadded(i,j+1)+imgPadded(i+2,j+1)); %green 1,1
                elseif mod(i,2)==0 && mod(j,2)==1
                 demosaicedLayer(i,j) = imgPadded(i+1,j+1);  %blue 2,1
                elseif mod(i,2)==1 && mod(j,2)==0
               demosaicedLayer(i,j) = 0.25*(imgPadded(i,j)+imgPadded(i+2,j)+imgPadded(i,j+2)+imgPadded(i+2,j+2));%red 1,2
                else
               demosaicedLayer(i,j) = 0.5*(imgPadded(i+1,j)+imgPadded(i+1,j+2));%green 2,2
                end
            end
         end
 end


end