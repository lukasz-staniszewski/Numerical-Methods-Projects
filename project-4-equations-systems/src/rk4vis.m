function[] = rk4vis(f, x0, range, h)
%RK4VIS Visualising rk4 solution.
    [steps, x, time, errors] = RK4ConstantSolver(f, x0, range, h);
    
    figure;
    plot(x(:,1), x(:,2));
    title(['Motion trajectory of a point for RK4 and step method ', num2str(h)])
    hold off

    figure;
    plot(steps(:), errors(:,1));
    title(['Double step error'])
    hold on
    plot(steps(:), errors(:,2));
    hold off
    disp(["The solution took: ", num2str(time)," s"])
end