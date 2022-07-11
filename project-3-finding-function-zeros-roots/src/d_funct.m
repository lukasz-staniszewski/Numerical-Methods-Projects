function [y] = d_funct(x)
%D_FUNCT Returns the value of the derivative of f(x) in x.
    y = 1.1 * sin(x) + 1.1*x*cos(x) - 2*1 / (x+2);
end

