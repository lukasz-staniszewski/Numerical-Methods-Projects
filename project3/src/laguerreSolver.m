function [xk] = laguerreSolver(coeff, start_x, max_iters, delta)
%LAGUERRESOLVER finds the single zero of a polynomial using the Laguerre method
    curr_degree = size(coeff, 1) - 1;
    xk = start_x;
    iter = 1;
    
    while iter <= max_iters && abs(getPolyVal(coeff, xk)) >= delta
        % collection of derivatives
        [val_deriv1, val_deriv2] = getPolyValDeriv(coeff, xk);
        val_poly = getPolyVal(coeff, xk);
        
        % selecting the sign in the denominator so as to ensure the smallest modulus 
        denominator_sqrt = sqrt( (curr_degree-1) * ( (curr_degree-1) * (val_deriv1^2) - curr_degree*val_poly*val_deriv2) );
        if abs (val_deriv1+denominator_sqrt) > abs(val_deriv1-denominator_sqrt)
            denominator_sqrt = val_deriv1+denominator_sqrt;
        else
            denominator_sqrt = val_deriv1-denominator_sqrt;
        end

        % xk update
        xk = xk - curr_degree * val_poly / denominator_sqrt;
        iter = iter + 1;
    end
    
    disp(['Found zero for x=',num2str(xk),' in ', num2str(iter),' iterations!']);
end

