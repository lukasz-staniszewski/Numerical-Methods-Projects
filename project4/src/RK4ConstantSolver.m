function [steps, x, time, errors] = RK4ConstantSolver(f, x_start, range, h)
% RK4ConstantSolver calculates the trajectory of the movement using the RK4 method with constant step
    % f - function describing the movement
    % range - range in which the movement is executed
    % h - step of the method
    % x0 - initial condition
    tic;
    h_error = 0.5*h;
    yn = x_start;
    steps_vec = range(1):h:range(2);
    steps = zeros(size(steps_vec,2),1);
    x = zeros(size(steps_vec, 2),2);
    errors = zeros(size(steps_vec, 2),2);
    iter = 1;
    x(1, :) = yn';
    
    for step=range(1):h:range(2)
        k1 = f(yn);
        k2 = f(yn + 0.5*h*k1);
        k3 = f(yn + 0.5*h*k2);
        k4 = f(yn + h*k3);
        yn_1 = yn + 1/6 * h * (k1 + 2*k2 + 2*k3 + k4);
        
        % fragment responsible for error counting
        yn_error = yn;
        for iter_error=1:2
            k1 = f(yn_error);
            k2 = f(yn_error+0.5*h_error*k1);
            k3 = f(yn_error+0.5*h_error*k2);
            k4 = f(yn_error+h_error*k3);
            yn_error = yn_error + 1/6*h_error*(k1+2*k2+2*k3+k4);
        end
        iter = iter + 1;
        errors(iter, :) = (16/15) * abs(yn_error - yn_1);
        yn = yn_1;
        steps(iter,1) = step + h;
        x(iter, :) = yn;
    end
    time = toc;
end

