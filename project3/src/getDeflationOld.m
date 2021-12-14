function [new_coeff] = getDeflation2(coeff, alfa)
%GETHORNER Summary of this function goes here
%   Detailed explanation goes here
    hornerCoeffs = getHorner(coeff, alfa);
    if alfa ~= 0
        hornerRevCoeffs = getHornerReverse(coeff, alfa);
        n = size(hornerRevCoeffs,1);
        best_k = (n + mod(n,2))/2;
        disp("~~DEFLATION HERE~~")
        disp("hornerRevCoeffs:")
        disp(hornerRevCoeffs)
        disp("hornerCoeffs:")
        disp(hornerCoeffs)
        disp("BEST_K:")
        disp(best_k)
        disp("~~DEFLATION NOT HERE~~")
        for k=best_k:size(hornerCoeffs,1)
            hornerCoeffs(k,1) = hornerRevCoeffs(k,1); 
        end
    end
    new_coeff = hornerCoeffs;
end

