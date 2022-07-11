function [a] = solveQR(n, A, y)
%SOLVEQR makes approximation by using qr factorization
    [Q, R] = qrgsm(A);
    qtb = Q'*y;
    % solving stepped matrix
    a = zeros(n+1,1);
    for k = n+1:-1:1
        sum_x = 0;
        for j = k+1:n+1
            sum_x = sum_x + a(j)*R(k,j);
        end
        a(k) = (qtb(k,1) - sum_x)/R(k,k);
    end
    
 end

