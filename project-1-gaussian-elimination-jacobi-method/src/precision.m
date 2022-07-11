function [eps] = precision() 
% PRECISION Calculates the machine accuracy (eps) of the computer.

    % declaration + initialisation of variables
    eps = 1; % eps reprezentuje g przed podzieleniem 
    g = 1;
    fl = 1.0 + g;
    
    while fl > 1.0
        eps = g;
        g = g / 2.0;
        fl = 1.0 + g;
    end
end

