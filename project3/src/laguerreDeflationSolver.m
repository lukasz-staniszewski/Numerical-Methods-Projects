function [ret_zeros] = laguerreDeflationSolver(coeff, start_x, max_iters, delta)
%LAGUERREDEFLATIONSOLVER finds all zeros of a polynomial using the Laguerre method
%by applying deflation with the zero factor (optimal form)
    
    curr_degree = size(coeff, 1) - 1;
    ret_zeros = zeros(curr_degree, 1);
    curr_zeros_found = 0;
    xk = start_x;
    
    while curr_degree>=1
        % finding a single zero
        xk = laguerreSolver(coeff, xk, max_iters, delta);
        ret_zeros(curr_zeros_found+1) = xk;
        curr_zeros_found = curr_zeros_found + 1;
        curr_degree = curr_degree - 1;
        
        % application of deflation
        coeff = getDeflation(coeff, xk);
    end
end

