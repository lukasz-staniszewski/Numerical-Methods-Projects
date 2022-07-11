function [c] = bisectionSolver(a0, b0, function_f, delta, max_iter)
%BISECTIONSOLVER Solver finding zero in given range using bisection method
    n_iter = 1;
    a = a0;
    b = b0;
    c = (a + b)/2;
    f_c = function_f(c);
    next_args(n_iter) = c;
    next_vals(n_iter) = f_c;
    
    while abs(f_c)>delta && max_iter >= n_iter && (b-a)>delta
        f_a = function_f(a);
        if f_a * f_c < 0
           b = c;
        else
           a = c;
        end
        c = (a + b)/2;
        f_c = function_f(c);
        n_iter = n_iter + 1;
        next_args(n_iter) = c;
        next_vals(n_iter) = f_c;
    end
    
    disp(["Number of iterations: ", n_iter]);
    disp(["End point: ", c]);
    disp(["End point value: ", f_c]);
end

