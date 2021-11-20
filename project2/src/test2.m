[x, y] = getData();
max_degrees = 10;

normes_2=zeros(max_degrees+1,1);
normes_max=zeros(max_degrees+1, 1);

for degree=0:max_degrees
    A = getA(degree, x);
    % a=solveQR(degree, A,y);
    a=solveNormal(A,y);
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
end

% disp('Second norm of errors of approximations with next polynomials using QR');
disp('Second norm of errors of approximations with next polynomials using System of Normal Equations');

for i=0:max_degrees
    disp(normes_2(i+1));
end
% disp('Max norm of errors of approximations with next polynomials using QR');
disp('Max norm of errors of approximations with next polynomials using System of Normal Equations');
for i=0:max_degrees
    disp(normes_max(i+1));
end

normes_2_2=zeros(max_degrees+1,1);
normes_max_2=zeros(max_degrees+1, 1);

for degree=0:max_degrees
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
    normes_2_2(degree+1) = norm_2;
    normes_max_2(degree+1) = norm_max;
end

disp('Second norm of errors of approximations with next polynomials using QR');
% disp('Second norm of errors of approximations with next polynomials using System of Normal Equations');

for i=0:max_degrees
    disp(normes_2_2(i+1));
end
disp('Max norm of errors of approximations with next polynomials using QR');
% disp('Max norm of errors of approximations with next polynomials using System of Normal Equations');
for i=0:max_degrees
    disp(normes_max_2(i+1));
end

disp("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

disp('differences in norm 2: qr - normal');
for i=0:max_degrees
    disp(normes_2_2(i+1) - normes_2(i+1));
end

disp('differences in norm max: qr - normal');
for i=0:max_degrees
    disp(normes_max_2(i+1) - normes_max(i+1));
end

