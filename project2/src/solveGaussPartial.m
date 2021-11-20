function [x] = solveGaussPartial(A, b)
%SOLVEGAUSSPARTIAL Wyznacza rozwiazanie ukladu rownan liniowych Ax=b.
    n = size(A, 1);        % liczba rownan
    Ab = [A b];            % dla ulatwienia laczymy poziomo A z b (macierz rozszerzona)
    for k=1:n              % k to krok eliminacji gaussa
        % wybor elementu glownego
        main_el = abs(Ab(k,k));
        main_el_ind = k;
        for j = k+1:n
            if abs(Ab(j, k)) > main_el
                main_el = abs(Ab(j, k));
                main_el_ind = j;
            end
        end
        % zamiana wierszy
        temp_row = Ab(main_el_ind,:);
        Ab(main_el_ind,:) = Ab(k, :);
        Ab(k, :) = temp_row;
        
        % eliminacja Gaussa - liczymy l_ik i odejmujemy pomnozone przez
        % wiersz k od wiersza i
        for i=k+1:n
            l = Ab(i,k) / Ab(k,k);
            Ab(i,:)=Ab(i,:) - l * Ab(k, :);
        end
    end
    % teraz posiadamy już macierz trojkatna oraz przeksztalcony wektor 
    % prawych stron b i rozwiazujemy rownanie od dolu
    x = zeros(n,1);
    for k = n:-1:1
        sum_x = 0;
        for j = k+1:n
            sum_x = sum_x + x(j)*Ab(k,j);
        end
        x(k) = (Ab(k,n+1) - sum_x)/Ab(k,k);
    end
 end

