function [new_coeff] = getHornerReverse(coeff, alfa)
%GETHORNERREVERSE przeprowadza odwrotny schemat Hornera
    if alfa == 0
        disp('Cant use method, α=0');
        return
    end
    new_coeff = zeros(size(coeff,1)-1, 1);
    curr_ind = size(coeff,1)-1;
    q_i = 0;
    while curr_ind > 0
        q_i = (q_i-coeff(curr_ind+1)) / alfa;
        new_coeff(curr_ind)=q_i;
        curr_ind = curr_ind - 1;
    end
end

