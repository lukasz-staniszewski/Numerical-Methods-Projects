function [] = plot_f(a, b, step, funct)
%PLOT_F Plotting given function
    x=a:step:b;
    y = zeros(1, size(x,2));
    n_iter = 1;
    for i = a:step:b
        y(1, n_iter) = funct(i);
        n_iter = n_iter + 1;
    end
    
    figure()
    plot(x,y);
    xlim = get(gca,'xlim');
    hold on
    plot([xlim(1) xlim(2)],[0 0],'k')
    rectangle('Position',[2, -20, 6, 25], 'FaceColor',[219/255, 197/255, 162/255, 0.3], 'EdgeColor', [219/255, 197/255, 162/255, 0.1])
    rectangle('Position',[8, -20, 4, 25], 'FaceColor',[155/255, 222/255, 187/255, 0.3], 'EdgeColor', [155/255, 222/255, 187/255, 0.1])
    plot(6.8972,0,'.', 'Color',[0,0,0], 'LineWidth',1)
    plot(8.9156,0,'.', 'Color',[0,0,0], 'LineWidth',1)
    title('Function f(x) visualisation at range <2,12>');
    xlabel('x');
    ylabel('f(x)');
end