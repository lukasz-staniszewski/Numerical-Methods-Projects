function [new_coeff] = getDeflation(coeff, alfa)
%GETDEFLATION przeprowadza deflację w sposób optymalny dla wielomianow 
% wyzszego rzedu
    hornerCoeffs = getHorner(coeff, alfa);
    if alfa ~= 0
        hornerRevCoeffs = getHornerReverse(coeff, alfa);
        % wybieranie najlepszego k zgodnie ze wzorem
        best_k = 0;
        best_k_val = inf;
        temp_coeff = coeff(1:size(coeff, 1)-1, 1);
        for temp_k = 1:size(hornerRevCoeffs,1)
            aj = temp_coeff(temp_k);
            bj = hornerCoeffs(temp_k);
            cj = hornerRevCoeffs(temp_k);
            if abs(aj) + abs(cj) > 0
                if abs(cj-bj)/(abs(aj)+abs(cj)) < best_k_val
                    best_k = temp_k;
                    best_k_val = abs(cj-bj)/(abs(aj)+abs(cj));
                end
            end
        end
        for k=best_k:size(hornerCoeffs,1)
            hornerCoeffs(k,1) = hornerRevCoeffs(k,1); 
        end
    end
    new_coeff = hornerCoeffs;
end

