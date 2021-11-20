function [val] = getPolynVal(x, a)
% Returns value of function being polynomial.
    val = 0;
    for i = 0:size(a) - 1
       val = val + a(i+1,1) * x^i; 
    end
end