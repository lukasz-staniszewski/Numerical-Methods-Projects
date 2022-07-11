function [] = ode45_visualise(f, start, range)
%ODE45_VISUALISE Visualising the ode45 solution.
    [t, y] = ode45(f, range, start);
    plot(t,y, '-');
    title("Solution by ode45")
end
