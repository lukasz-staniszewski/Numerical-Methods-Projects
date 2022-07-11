function [A,b] = prepareMatricesA(n)
%PREPAREMATRICESA Prepares matrix A and vector b for task 2a.
    A = zeros(n);
    b = zeros(n, 1);
    for i = 1:n
        b(i) = -3.5 + 0.5*i;
        A(i, i) = 11;
        for j = 1:n
            if i == j-1 || i == j+1
                A(i, j) = 4.5;
            end
        end
    end
end

