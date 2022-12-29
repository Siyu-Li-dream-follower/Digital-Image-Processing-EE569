%EE569 HOMEWORK ASSIGNMENT 2
%DATE: Feb 23th 2021
%NAME: Siyu Li
%ID:2455870216
%E-mail:lisiyu@usc.edu
function [r,g,b] = getNearestVertex(tetrahedron, R, G, B)
% getNearestVertex: find nearst vertex in the given MBVQ for a target pixel
% 
% INPUT:
% mbvq (char array): the mbvq the target pixel is related to
% R, G, B (range:0~1): the R, G, B channel value of the target pixel
% 
% OUPUT:
% vertex (char array): the name of the closest vertex
% 
% Ref: "Color Diffusion: Error-Diffusion for Color Halftones
% by Shaked, Arad, Fitzhugh, and Sobel -- HP Labs
% Hewlett-Packard Laboratories TR 96-128
% and Electronic Imaging, Proc. SPIE 3648, 1999
% Adapted from Halftoning Toolbox Version 1.2 released July 2005 (Univ. of Texas)


% No.1 for CMYW
    if (tetrahedron == 'CMYW')
        r=255;%white r1 g1 b1
        g=255;
        b=255;
        if (B < 0.5)
            if (B <= R)
                if (B <= G)
                    r=255;%yellow r;1 g:1 b:0
                    g=255;
                    b=0;
                end
            end
        end
        if (G < 0.5)
            if (G <= B)
                if (G <= R)
                    r=255; %magenta r:1 g:0 b:1
                    g=0;
                    b=255;
                end
            end
        end
        if (R < 0.5)
            if (R <= B)
                if (R <= G)
                    r=0; %cyan r:0 g:1 b:1
                    g=255;
                    b=255;
                end
            end
        end
    end


% No.2 for MYGC
    if (tetrahedron == 'MYGC')
        r=255;
        g=0;%magenta r:1 g:0 b:1
        b=255;
        if (G >= B)
            if (R >= B)
                if (R >= 0.5)
                    r=255; %yellow r;1 g:1 b:0
                    g=255;
                    b=0;
                else
                    r=0; %green r:0 g:1 b:0
                    g=255;
                    b=0;
                end
            end
        end
        if (G >= R)
            if (B >= R)
                if (B >= 0.5)
                    r=0; %cyan r:0 g:1 b:1
                    g=255;
                    b=255;
                else
                    r=0;%green r:0 g:1 b:0
                    g=255;
                    b=0;
                end
            end
        end
    end


% No.3 for RGMY
    if (tetrahedron == 'RGMY')
        if (B > 0.5)
            if (R > 0.5)
                if (B >= G)
                    r=255;%magenta r:1 g:0 b:1
                    g=0;
                    b=255;
                else
                    r=255;%yellow r;1 g:1 b:0
                    g=255;
                    b=0;
                end
            else
                if (G > B + R)
                    r=0;%green r:0 g:1 b:0
                    g=255;
                    b=0;
                else 
                    r=255;%magenta r:1 g:0 b:1
                    g=0;
                    b=255;
                end
            end
        else
            if (R >= 0.5)
                if (G >= 0.5)
                    r=255;%yellow r;1 g:1 b:0
                    g=255;
                    b=0;
                else
                    r=255;%red r:1 g:0 b:0
                    g=0;
                    b=0;
                end
            else
                if (R >= G)
                    r=255;%red r:1 g:0 b:0
                    g=0;
                    b=0;
                else
                    r=0;%green r:0 g:1 b:0
                    g=255;
                    b=0;
                end
            end
        end
    end


% No.4 for KRGB
    if (tetrahedron == 'KRGB')
        r=0; %black r0 g0 b0
        g=0;
        b=0;
        if (B > 0.5)
            if (B >= R)
                if (B >= G)
                    r=0;%blue r:0 g:0 b:1
                    g=0;
                    b=255;
                end
            end
        end
        if (G > 0.5)
            if (G >= B)
                if (G >= R)
                    r=0;%green r:0 g:1 b:0
                    g=255;
                    b=0;
                end
            end
        end
        if (R > 0.5)
            if (R >= B)
                if (R >= G)
                    r=255;%red r:1 g:0 b:0
                    g=0;
                    b=0;
                end
            end
        end
    end


% No.5 for RGBM
    if (tetrahedron == 'RGBM')
        r=0;%green r:0 g:1 b:0
        g=255;
        b=0;
        if (R > G)
            if (R >= B)
                if (B < 0.5)
                    r=255;%red r:1 g:0 b:0
                    g=0;
                    b=0;
                else
                    r=255;%magenta r:1 g:0 b:1
                    g=0;
                    b=255;
                end
            end
        end
        if (B > G)
            if (B >= R)
                if (R < 0.5)
                    r=0;%blue r:0 g:0 b:1
                    g=0;
                    b=255;
                else
                    r=255;;%magenta r:1 g:0 b:1
                    g=0;
                    b=255;
                end
            end
        end
    end


% No.6 for CMGB
    if (tetrahedron == 'CMGB')
        if (B > 0.5)
            if ( R > 0.5)
                if (G >= R)
                    r=0;%cyan r:0 g:1 b:1
                    g=255;
                    b=255;
                else
                    r=255;%magenta r:1 g:0 b:1
                    g=0;
                    b=255;
                end
            else
                if (G > 0.5)
                    r=0;%cyan r:0 g:1 b:1
                    g=255;
                    b=255;
                else
                    r=0;%blue r:0 g:0 b:1
                    g=0;
                    b=255;
                end
            end
        else
            if ( R > 0.5)
                if (R - G + B >= 0.5)
                    r=255;%magenta r:1 g:0 b:1
                    g=0;
                    b=255;
                else
                    r=0;%green r:0 g:1 b:0
                    g=255;
                    b=0;
                end
            else
                if (G >= B)
                    r=0;%green r:0 g:1 b:0
                    g=255;
                    b=0;
                else
                    r=0;%blue r:0 g:0 b:1
                    g=0;
                    b=255;
                end
            end
        end
    end

end %function