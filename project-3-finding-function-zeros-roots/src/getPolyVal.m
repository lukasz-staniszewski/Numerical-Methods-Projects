function [y] = getPolyVal(coefficients, x)
%GETPOLYVAL calculate the value of a polynomial with given coefficients in x
    current_exponent = size(coefficients,1) - 1;
    y = 0;
    curr_coef_ind = 1;
    
    while current_exponent > 0
        y = y + coefficients(curr_coef_ind) * x^current_exponent;
        curr_coef_ind = curr_coef_ind + 1;
        current_exponent = current_exponent - 1;
    end
    y = y + coefficients(curr_coef_ind);
end

