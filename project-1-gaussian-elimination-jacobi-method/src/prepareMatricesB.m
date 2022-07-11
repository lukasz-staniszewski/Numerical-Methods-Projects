function [A,b] = prepareMatricesB(n)
%PREPAREMATRICESB Prepares matrix A and vector b for task 2b.
    A = zeros(n);
    b = zeros(n, 1);
    for i = 1:n
        b(i) = 1.5 + 0.6*i;
        for j = 1:n
            if i == j
                A(i, i) = 1/5;
            else
                A(i, j) = 3*(i-j) + 3;
            end
        end
    end
end

