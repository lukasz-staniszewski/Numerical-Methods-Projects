function [x] = solveGaussPartial(A, b)
%SOLVEGAUSSPARTIAL Determines the solution of a system of linear equations Ax=b.
    n = size(A, 1);        % number of equations
    Ab = [A b];            % connecting horizontally A with b (extended matrix)
    
    for k=1:n              % k is the Gaussian elimination step
        % selection of the main element
        main_el = abs(Ab(k,k));
        main_el_ind = k;
        for j = k+1:n
            if abs(Ab(j, k)) > main_el
                main_el = abs(Ab(j, k));
                main_el_ind = j;
            end
        end
        % swapping rows
        temp_row = Ab(main_el_ind,:);
        Ab(main_el_ind,:) = Ab(k, :);
        Ab(k, :) = temp_row;        
        % Gaussian elimination - count l_ik and subtract multiplied by
        % row k from row i
        for i=k+1:n
            l = Ab(i,k) / Ab(k,k);
            Ab(i,:)=Ab(i,:) - l * Ab(k, :);
        end
    end

    % now we have the triangular matrix and the transformed vector 
    % of the right-hand sides of b and solve the equation from below
    x = zeros(n,1);
    for k = n:-1:1
        sum_x = 0;
        for j = k+1:n
            sum_x = sum_x + x(j)*Ab(k,j);
        end
        x(k) = (Ab(k,n+1) - sum_x)/Ab(k,k);
    end
 end

