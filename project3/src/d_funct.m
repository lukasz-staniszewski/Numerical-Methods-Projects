function [y] = d_funct(x)
%D_FUNCT Zwraca wartosc pochodnej f(x) w x
    y = 1.1 * sin(x) + 1.1*x*cos(x) - 2*1 / (x+2);
end

