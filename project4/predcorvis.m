function[] = predcorvis(f, x0, range, h)
%RK4VIS Summary of this function goes here
%   Detailed explanation goes here
    [steps, x, time, errors] = PredictorCorectorSolver(f, x0, range, h);
    figure;
    plot(steps, x(:,1));
    title(['Trajektoria ruchu punktu dla metody RK4 i kroku ', num2str(h)])
    hold on
    plot(steps(:), x(:,2));
    hold off

    figure;
    plot(steps(:), errors(:,1));
    title(['Błąd metodą podwójnego kroku']);
    hold on
    plot(steps(:), errors(:,2));
    hold off
    disp(["Rozwiązanie zajęło: ", num2str(time)," s"])
end


