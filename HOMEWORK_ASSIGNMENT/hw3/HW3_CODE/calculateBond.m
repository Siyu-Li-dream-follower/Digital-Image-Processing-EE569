%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function bond = calculateBond(img)
[m, n] = size(img);
imgpad = ReflecPadding(img, 1);
bond = zeros(m,n);

for i=1:m
    for j=1:n
        
        if imgpad(i + 1, j + 1) == 1
            
            for p=1:3
                for q=1:3
                    if imgpad(i+p-1,j+q-1)==1
                        if mod(p+q,2)==1
                            bond(i,j)=bond(i,j)+2;
                        else
                            bond(i,j)=bond(i,j)+1;
                        end
                    end
                    
                    
                end
            end
            bond(i,j)=bond(i,j)-1; %remove the mistakenly added central value
        end
      
    end
end

end
            
            
            
          