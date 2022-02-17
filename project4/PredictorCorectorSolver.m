function [steps, x, time, errors] = PredictorCorectorSolver(f, x_start, range, h)
%Solver oblicza przebieg trajektorii ruchu metodą RK4 ze stałym krokiem
    % f - funkcja opisująca ruch
    % range - zakres, w jakim jest wykonywany ruch
    % h - krok metody
    % x0 - warunek początkowy
    number_steps = 4;
    tic;
    h_error = 0.5*h;
    yn = x_start;
    steps_vec = range(1):h:range(2);
    steps = zeros(size(steps_vec,2),1);
    x = zeros(size(steps_vec, 2),2);
    errors = zeros(size(steps_vec, 2),2);
    iter = 1;
    x(1, :) = yn';
    for step=2:number_steps    % pierwsze 4 sa obliczane jak poprzednio
        k1 = f(yn);
        k2 = f(yn + 0.5*h*k1);
        k3 = f(yn + 0.5*h*k2);
        k4 = f(yn + h*k3);
        yn_1 = yn + 1/6 * h * (k1 + 2*k2 + 2*k3 + k4);
        yn_error = yn;      % fragment odpowiedzialny za naliczanie błędów
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
    beta = [55/24, -59/24, 37/24, -9/24];
    beta_star = [251/720, 646/720, -264/720, 106/720, -19/720];
    iter = iter + 1;
    for step=number_steps+1:size(steps_vec,2)
        sum_beta = [0, 0]; % P
        for j=1:number_steps
            sum_beta = sum_beta + beta(j)*f(x(iter-j, :));
        end
        yn0 = x(iter-1,:) + h*sum_beta;
        fn0 = f(yn0);   %E
        sum_beta_star = [0, 0]; % K
        for j=1:number_steps
            sum_beta_star = sum_beta_star + beta_star(j+1)*f(x(iter-j, :));
        end
        yn = x(iter-1,:) + h*sum_beta_star + h*beta_star(1)*fn0;
        x(iter,:) = yn'; %E
        errors(iter,:)= -19/232 * (yn0-yn);
        steps(iter,1) = step + h;
        iter = iter + 1;
    end
    time = toc;
end

