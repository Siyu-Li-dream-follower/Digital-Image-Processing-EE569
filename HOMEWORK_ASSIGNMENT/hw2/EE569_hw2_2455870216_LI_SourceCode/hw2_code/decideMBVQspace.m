%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function tetrahedron = decideMBVQspace(r,g,b)

if (r+g)>255
    if (g+b)>255
        if (r+g+b)>510
            tetrahedron = 'CMYW';
        else
            tetrahedron = 'MYGC';
        end
    else
        tetrahedron = 'RGMY';
    end
else
    if (g+b)<=255
        if (r+g+b)<=255
            tetrahedron = 'KRGB';
        else
            tetrahedron = 'RGBM';
        end
    else
        tetrahedron = 'CMGB';
    end
end

end