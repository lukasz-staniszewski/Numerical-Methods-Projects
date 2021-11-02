n_of_equations = [5, 10, 50, 100, 200];         % mozliwe n
errors_1 = zeros(size(n_of_equations,2), 1);    % wektor bledow
% wyznaczanie bledu dla kazdego n
for n_idx = 1:size(n_of_equations,2)
    n = n_of_equations(n_idx);
    [A, b] = prepareMatricesB(n); % zdobycie macierzy A i wektora b
    x = solveJacobi(A, b, 0.000001);
    errors_1(n_idx,1) = norm(A*x-b,2);
end
% wyswietlenie wektora bledow
disp(errors_1);
% zobrazowanie zaleznosci w postaci wykresu
plot(n_of_equations, errors_1);
xlabel("Liczba równań");
ylabel("Błąd ε₁=||Ax-b||");

