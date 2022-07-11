function [valDeriv1,valDeriv2] = getPolyValDeriv(coeff,x)
%GETPOLYVALDERIV calculate the value of the first and second derivatives of a polynomial
% of given coefficients in x
    deg = size(coeff,1)-1;
    coeffDeriv1 = coeff(1:size(coeff, 1)-1);
    ind_deriv1 = 1;
    
    while(deg>0)
        coeffDeriv1(ind_deriv1) = coeffDeriv1(ind_deriv1)*deg;
        deg = deg - 1;
        ind_deriv1 = ind_deriv1 + 1;
    end
    
    if ind_deriv1==1
        coeffDeriv1 = [0];
    end
    valDeriv1 = getPolyVal(coeffDeriv1, x);
    deg = size(coeffDeriv1,1)-1;
    coeffDeriv2 = coeffDeriv1(1:size(coeffDeriv1, 1)-1);
    ind_deriv2 = 1;
    
    while(deg>0)
        coeffDeriv2(ind_deriv2) = coeffDeriv2(ind_deriv2)*deg;
        deg = deg - 1;
        ind_deriv2 = ind_deriv2 + 1;
    end
    
    if ind_deriv2==1
        coeffDeriv2 = [0];
    end
    valDeriv2 = getPolyVal(coeffDeriv2, x);
end

