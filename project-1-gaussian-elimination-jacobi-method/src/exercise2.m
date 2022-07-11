n_of_equations = [5, 10, 50, 100, 200];         % possible n
errors_1 = zeros(size(n_of_equations,2), 1);    % error vector

% error for each n
for n_idx = 1:size(n_of_equations,2)
    n = n_of_equations(n_idx);
    [A, b] = prepareMatricesB(n); % getting matrix A and vector b
    x = solveGaussPartial(A, b);
    errors_1(n_idx,1) = norm(A*x-b,2);
end

% displaying error vector
disp(errors_1);

% plotting
plot(n_of_equations, errors_1);
xlabel("Number of equations");
ylabel("Error ε₁=||Ax-b||");

