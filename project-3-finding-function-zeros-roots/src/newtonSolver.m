function [x_n] = newtonSolver(x0, func, d_func, delta, max_iter)
%NEWTONSOLVER Solver finding zero in given range using Newton method
    x_n = x0;
    n_iter = 1;
    x_next = x_n;
    
    while abs(func(x_n)) >= delta && n_iter <= max_iter
        x_n = x_next;
        x_next = x_n - func(x_n) / d_func(x_n);
        n_iter = n_iter + 1;
    end
    
    disp(["Number of iterations: ", n_iter]);
    disp(["End point: ", x_n]);
    disp(["End point value", func(x_n)]);
end

