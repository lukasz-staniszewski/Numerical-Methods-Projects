function[] = predcorvis(f, x0, range, h)
%PREDCORVIS Visualising the prediction and correction method.
    [steps, x, time, errors] = PredictorCorectorSolver(f, x0, range, h);
    
    figure;
    plot(steps, x(:,1));
    title(['Motion trajectory of a point for RK4 and step method ', num2str(h)])
    hold on
    plot(steps(:), x(:,2));
    hold off

    figure;
    plot(steps(:), errors(:,1));
    title(['Double step error']);
    hold on
    plot(steps(:), errors(:,2));
    hold off
    disp(["The solution took: ", num2str(time)," s"])
end


