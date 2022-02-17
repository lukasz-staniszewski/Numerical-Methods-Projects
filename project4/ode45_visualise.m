function [] = ode45_visualise(f, start, range)
%ODE45_VISUALISE Summary of this function goes here
    [t, y] = ode45(f, range, start);
    plot(t,y, '-');
    title("Rozwiązanie przy użyciu metody ode45")
end
