function [x] = solveJacobi(A, b, e2)
    %SOLVEJACOBI Calculates a system of equations using the Jacobi method
    % verification of diagonal dominance
    if(checkDominance(A) == false)
       disp("A matrix without strong diagonal dominance!");
       return
    end
    
    % creation of L, D and U matrices
    n = size(A, 1);   % n - number of equations
    L = zeros(n);
    D = zeros(n);
    U = zeros(n);
    x = zeros(n, 1);   % x is the resultant vector
    
    for i=1:n
        D(i,i) = A(i, i);
        for j=1:n
            if i>j
                L(i,j) = A(i,j);
            elseif i<j
                U(i, j) = A(i, j);
            end
        end
    end
    
    if(det(D)==0)
        disp("D matrix is impersonal!");
        return;
    end

    lim_error = e2;
    % as long as the limiting error is not exceeded
    while lim_error >= e2
        x_before = x;
        % vector x for the next approximation step
        for j=1:n
            sum_k = 0;
            for k=1:n
                sum_k = sum_k + (L(j,k) + U(j,k))*x_before(k);
            end
            x(j) = -1 / D(j,j) * (sum_k - b(j));
        end
        % difference in the form of a standard from the difference of successive approximations
        lim_error = norm(x - x_before, 2);
    end

end

