function [new_coeff] = getHorner(coeff, alfa)
%GETHORNER carries out Horners scheme
    new_coeff = zeros(size(coeff,1)-1, 1);
    curr_ind = size(coeff,1)-1;
    q_i = 0;
    new_coeff_ind = 1;
    
    while curr_ind > 0
        q_i = coeff(new_coeff_ind) + q_i * alfa;
        new_coeff(new_coeff_ind)=q_i;
        new_coeff_ind = new_coeff_ind + 1;
        curr_ind = curr_ind - 1;
    end
end

