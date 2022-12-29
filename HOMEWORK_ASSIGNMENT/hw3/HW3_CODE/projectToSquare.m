%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgsquare=projectToSquare(img,ISource,JSource)
[m,n] = size(img);
imgsquare = zeros(m,n);
radius=floor(m/2);
for i=1:m
    for j=1:n
        
        if (ISource(i,j)-radius)^2 + (JSource(i,j)-radius)^2 <= radius^2
            
            delta_I = ISource(i,j) - floor(ISource(i,j));
            delta_J = JSource(i,j) - floor(JSource(i,j));
            imgsquare(i,j) = (1 - delta_I) * (1 - delta_J) * img(floor(ISource(i,j)), floor(JSource(i,j))) + ...
                delta_I * (1 - delta_J) * img(floor(ISource(i,j)) + 1, floor(JSource(i,j))) + ...
                (1 - delta_I) * delta_J * img(floor(ISource(i,j)), floor(JSource(i,j)) + 1) + ...
                delta_I * delta_J * img(floor(ISource(i,j)) + 1, floor(JSource(i,j)) + 1);
        else
            if ISource(i,j)> floor(m/2) && JSource(i,j)> floor(n/2)
                imgsquare(i,j) = img(floor(ISource(i,j)), floor(JSource(i,j)));
                
            elseif ISource(i,j)> floor(m/2) && JSource(i,j)< floor(n/2)
                imgsquare(i,j) = img(floor(ISource(i,j)), ceil(JSource(i,j)));
                
            elseif ISource(i,j)< floor(m/2) && JSource(i,j)> floor(n/2)
                imgsquare(i,j) = img(ceil(ISource(i,j)), floor(JSource(i,j)));
              
            else
                imgsquare(i,j) = img(ceil(ISource(i,j)), ceil(JSource(i,j)));
            end
            
        end
        
        
        
    end
end


end




