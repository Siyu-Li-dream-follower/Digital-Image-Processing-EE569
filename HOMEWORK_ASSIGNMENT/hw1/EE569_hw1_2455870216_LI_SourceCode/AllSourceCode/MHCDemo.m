%EE569 HOMEWORK ASSIGNMENT 1
%DATE: Feb 7th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function  demosaicedLayer=MHCDemo(img,color)
% color notation Red 1,Green 2,Blue 3
 [col,row]=size(img); %col:440  row:580
 demosaicedLayer=zeros(col,row);
 
 imgPadded=universalPadding(img,2);
 switch color
     case 1  %for red
       for i = 1:col
         for j = 1:row
             if mod(i,2) == 1 && mod(j,2) == 0      % Red itself, just transfer the value
                demosaicedLayer(i,j) = imgPadded(i+2,j+2);
            elseif mod(i,2) == 1 && mod(j,2) == 1  % Green on the blue column, need to calculate red here
                demosaicedLayer(i,j) = round(0.125*(0.5*imgPadded(i,j+2)-imgPadded(i+1,j+1)-imgPadded(i+1,j+3)-imgPadded(i+2,j) ...
                    +4*imgPadded(i+2,j+1)+5*imgPadded(i+2,j+2)+4*imgPadded(i+2,j+3)-imgPadded(i+2,j+4)-imgPadded(i+3,j+1)-imgPadded(i+3,j+3)+0.5*imgPadded(i+4,j+2)));
            elseif mod(i,2) == 0 && mod(j,2) == 0  % green on the red column, need to calculate red value here
                demosaicedLayer(i,j) = round(0.125*(0.5*imgPadded(i,j+2)-imgPadded(i+1,j+1)-imgPadded(i+1,j+3)-imgPadded(i+2,j) ...
                    +4*imgPadded(i+1,j+2)+5*imgPadded(i+2,j+2)+4*imgPadded(i+3,j+2)-imgPadded(i+2,j+4)-imgPadded(i+3,j+1)-imgPadded(i+3,j+3)+0.5*imgPadded(i+4,j+2)));
            else                                   % blue value, need to cal red value here
                demosaicedLayer(i,j) = round(0.125*(-1.5*imgPadded(i,j+2)+2*imgPadded(i+1,j+1)+2*imgPadded(i+1,j+3)-1.5*imgPadded(i+2,j) ...
                    +6*imgPadded(i+2,j+2)-1.5*imgPadded(i+2,j+4)+2*imgPadded(i+3,j+1)+2*imgPadded(i+3,j+3)-1.5*imgPadded(i+4,j+2)));
             
            end
        end
    end


        
     case 2  %for green
         for i =1:col
            for j =1:row
               if mod(i,2) == 1 && mod(j,2) == 1      % green itself, just transfer the value
                demosaicedLayer(i,j) = imgPadded(i+2,j+2);
               elseif mod(i,2) == 0 && mod(j,2) == 0  % also green itself
                demosaicedLayer(i,j) = imgPadded(i+2,j+2);
               elseif mod(i,2)==1 && mod(i,2)==0      % we need to cal green value in this red position                                    %
                demosaicedLayer(i,j) = round(0.125*(-imgPadded(i,j+2)+2*imgPadded(i+1,j+2)-imgPadded(i+2,j)+2*imgPadded(i+2,j+1) ...
                    +4*imgPadded(i+2,j+2)+2*imgPadded(i+2,j+3)-imgPadded(i+2,j+4)+2*imgPadded(i+3,j+2)-imgPadded(i+4,j+2)));
               else                                    % we need to cal green value in this blue position
                demosaicedLayer(i,j) = round(0.125*(-imgPadded(i,j+2)+2*imgPadded(i+1,j+2)-imgPadded(i+2,j)+2*imgPadded(i+2,j+1) ...
                    +4*imgPadded(i+2,j+2)+2*imgPadded(i+2,j+3)-imgPadded(i+2,j+4)+2*imgPadded(i+3,j+2)-imgPadded(i+4,j+2)));
            end
        end
    end

      
     otherwise          %for blue
         for i =1:col
            for j = 1:row
                if mod(i,2) == 0 && mod(j,2) == 1      % Blue here, just transfer the function
                demosaicedLayer(i,j) = imgPadded(i+2,j+2);
            elseif mod(i,2) == 1 && mod(j,2) == 1  % Green value on blue column, need to calculate blue value here
                demosaicedLayer(i,j) = round(0.125*(0.5*imgPadded(i,j+2)-imgPadded(i+1,j+1)-imgPadded(i+1,j+3)-imgPadded(i+2,j) ...
                    +4*imgPadded(i+1,j+2)+5*imgPadded(i+2,j+2)+4*imgPadded(i+3,j+2)-imgPadded(i+2,j+4)-imgPadded(i+3,j+1)-imgPadded(i+3,j+3)+0.5*imgPadded(i+4,j+2)));
            elseif mod(i,2) == 0 && mod(j,2) == 0  % Green value on red column, need to cal blue value here
                demosaicedLayer(i,j) = round(0.125*(0.5*imgPadded(i,j+2)-imgPadded(i+1,j+1)-imgPadded(i+1,j+3)-imgPadded(i+2,j) ...
                    +4*imgPadded(i+2,j+1)+5*imgPadded(i+2,j+2)+4*imgPadded(i+2,j+3)-imgPadded(i+2,j+4)-imgPadded(i+3,j+1)-imgPadded(i+3,j+3)+0.5*imgPadded(i+4,j+2)));
            else                                   % Red here, need to cal blue here
                demosaicedLayer(i,j) = round(0.125*(-1.5*imgPadded(i,j+2)+2*imgPadded(i+1,j+1)+2*imgPadded(i+1,j+3)-1.5*imgPadded(i+2,j) ...
                    +6*imgPadded(i+2,j+2)-1.5*imgPadded(i+2,j+4)+2*imgPadded(i+3,j+1)+2*imgPadded(i+3,j+3)-1.5*imgPadded(i+4,j+2)));
                end
            end
         end
 end


end