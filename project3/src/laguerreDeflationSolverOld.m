function [ret_zeros] = laguerreDeflationSolver(coeff, start_x, n_iters)
    curr_degree = size(coeff, 1) - 1;
    ret_zeros = zeros(curr_degree, 1);
    curr_zeros_found = 0;
    curr_xk = start_x;
    while curr_degree>=1
        iter = 1;
        while iter <= n_iters
            [val_deriv1, val_deriv2] = getPolyValDeriv(coeff, curr_xk);
            val_poly = getPolyVal(coeff, curr_xk);
            denominator_sqrt = sqrt( (curr_degree-1) * ( (curr_degree-1) * (val_deriv1^2) - curr_degree*val_poly*val_deriv2) );
            if abs (val_deriv1+denominator_sqrt) > abs(val_deriv1-denominator_sqrt)
                denominator_sqrt = val_deriv1+denominator_sqrt;
            else
                denominator_sqrt = val_deriv1-denominator_sqrt;
            end
            curr_xk = curr_xk - curr_degree * val_poly / denominator_sqrt;
            iter = iter + 1;
        end
        ret_zeros(curr_zeros_found+1) = curr_xk;
        curr_zeros_found = curr_zeros_found + 1;
        curr_degree = curr_degree - 1;
        coeff = getDeflation(coeff, curr_xk);
    end

end

