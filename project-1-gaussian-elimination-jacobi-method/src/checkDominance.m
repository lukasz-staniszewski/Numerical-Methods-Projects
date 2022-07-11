function [is_dominant] = checkDominance(A)
%CHECKDOMINANCE Checks if matrix A is strongly diagonally dominant.
    is_dominant_row = true;
    is_dominant_col = true;
    for i=1:size(A, 1)
        sum_row = 0;
        sum_col = 0;
        for j=1:size(A, 1)
            if i ~= j
                sum_row = sum_row + abs(A(i,j));
                sum_col = sum_col + abs(A(j,i));
            end
        end
        if abs(A(i,i)) <= sum_row
            is_dominant_row = false;
        end
        if abs(A(i, i)) <= sum_col
            is_dominant_col = false;
        end
    end
    if is_dominant_row || is_dominant_col
        is_dominant = true;
    else
        is_dominant = false;
    end
end

