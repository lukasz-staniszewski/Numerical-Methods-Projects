[x, y] = getData();
max_degrees = 10;

degs=[2, 5, 8];
max_degrees=size(degs,1);

normes_2=zeros(max_degrees,1);
normes_max=zeros(max_degrees, 1);

for degree=degs
    A = getA(degree, x);
    
    a=solveQR(degree, A,y);
    % a=solveNormal(A,y);
    
    x_f=(-5:0.1:5.0)';
    y_f=zeros(size(x_f,1), 1);
    for ind = 1:101
       y_f(ind, 1) = getPolynVal(x_f(ind,1),a); 
    end
    
    % approximated y for given x
    aproxY=zeros(size(x,1),1);
    for ind = 1:size(aproxY,1)
        aproxY(ind, 1) = getPolynVal(x(ind, 1), a);
    end
    
    % counting norms
    norm_2 = norm(aproxY-y,2);
    norm_max = norm(aproxY-y, "inf");
    normes_2(degree+1) = norm_2;
    normes_max(degree+1) = norm_max;
    
    % drawing plot and saving to file
    scatter(x,y);
    hold on
    plot(x, y, 'o');
    plot(x_f, y_f, '-');
    
    % title(['Approximation with QR for polynomial of degree=' int2str(degree)]);
    title(['Approximation with System of Normal Equations for polynomial of degree=' int2str(degree)]);
    
    xlabel('x');
    ylabel('y');
    hold off
    
    % savefig(['fig/QR_w' int2str(degree) '.fig']);
    savefig(['fig/Normal_w' int2str(degree) '.fig']);
end

% disp('Second norm of errors of approximations with next polynomials using QR');
disp('Second norm of errors of approximations with next polynomials using System of Normal Equations');

for i=degs
    disp(normes_2(i+1));
end

% disp('Max norm of errors of approximations with next polynomials using QR');
disp('Max norm of errors of approximations with next polynomials using System of Normal Equations');

for i=degs
    disp(normes_max(i+1));
end
