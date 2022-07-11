function [a] = solveNormal(A, y_data)
%SOLVENORMAL makes approximation by using system of normal equations
    G = A'*A;
    rho = A'*y_data;
    a = solveGaussPartial(G, rho);
end


