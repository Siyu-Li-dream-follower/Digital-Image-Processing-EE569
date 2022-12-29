%EE569 HOMEWORK ASSIGNMENT 3
%DATE: Mar 11th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function imgcircle=projectToCircle(img,ISource,JSource)
[m,n] = size(img);
imgcircle = zeros(m,n);

for i=1:m
    for j=1:n
        
        if floor(ISource(i,j)) + 1 <= m && floor(JSource(i,j)) + 1 <= n && floor(ISource(i,j)) >= 1 && floor(JSource(i,j)) >= 1
            delta_I = ISource(i,j) - floor(ISource(i,j));
            delta_J = JSource(i,j) - floor(JSource(i,j));
            imgcircle(i,j) = (1 - delta_I) * (1 - delta_J) * img(floor(ISource(i,j)), floor(JSource(i,j))) + ...
                           delta_I * (1 - delta_J) * img(floor(ISource(i,j)) + 1, floor(JSource(i,j))) + ...
                           (1 - delta_I) * delta_J * img(floor(ISource(i,j)), floor(JSource(i,j)) + 1) + ...
                           delta_I * delta_J * img(floor(ISource(i,j)) + 1, floor(JSource(i,j)) + 1);
                       
        elseif round(ISource(i,j)) <= m && round(JSource(i,j)) <= n && round(ISource(i,j)) >= 1 && round(JSource(i,j)) >= 1
            imgcircle(i,j) = img(round(ISource(i,j)), round(JSource(i,j)));
        else
            imgcircle(i,j) = 0;
        end
    end
end

end







