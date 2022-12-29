%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function defectcount=countIsolatePoint(img)
[m,n] = size(img);
imgpad = hw3zeroPadding(img, 1);
defectcount = 0;
for i=1:m
    for j=1:n
        if imgpad(i + 1, j + 1) == 1
            logicvalue=~imgpad(i, j) && ~imgpad(i, j + 1) && ~imgpad(i, j + 2) && ...
                ~imgpad(i + 1, j) && ~imgpad(i + 1, j + 2) && ...
                ~imgpad(i + 2, j) && ~imgpad(i + 2, j + 1) && ~imgpad(i + 2, j + 2);
            if logicvalue
                defectcount = defectcount + 1;
            end
            
        end
    end
    
end


end