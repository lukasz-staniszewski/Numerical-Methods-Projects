function [x] = solveJacobi(A, b, e2)
    %SOLVEJACOBI Oblicza układ równań metodą Jacobiego
    % sprawdzenie dominacji diagonalnej
    if(checkDominance(A) == false)
       disp("Macierz bez silnej dominacji diagonalnej!");
       return
    end
    %   Stworzenie macierzy L, D i U
    n = size(A, 1);   % n - liczba równań
    L = zeros(n);
    D = zeros(n);
    U = zeros(n);
    x = zeros(n, 1);   % x to wektor wynikowy
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
        disp("Macierz D nieosobliwa!");
        return;
    end
    lim_error = e2;
    % dopoki nie jest przekroczony błąd graniczny
    while lim_error >= e2
        x_before = x;
        % tworzymy wektor x dla kolejnego kroku przyblizenia
        for j=1:n
            sum_k = 0;
            for k=1:n
                sum_k = sum_k + (L(j,k) + U(j,k))*x_before(k);
            end
            x(j) = -1 / D(j,j) * (sum_k - b(j));
        end
        % na koncu roznica w postaci normy z różnicy kolejnych przyblizen
        lim_error = norm(x - x_before, 2);
    end

end

