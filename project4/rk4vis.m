function[] = rk4vis(f, x0, range, h)
%RK4VIS Summary of this function goes here
%   Detailed explanation goes here
    [steps, x, time, errors] = RK4ConstantSolver(f, x0, range, h);
    figure;
    plot(x(:,1), x(:,2));
    title(['Trajektoria ruchu punktu dla metody RK4 i kroku ', num2str(h)])
    hold off

    figure;
    plot(steps(:), errors(:,1));
    title(['Błąd metodą podwójnego kroku'])
    hold on
    plot(steps(:), errors(:,2));
    hold off
    disp(["Rozwiązanie zajęło: ", num2str(time)," s"])
end


