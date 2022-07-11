function [A] = getA(n,x)
%GETA Creates A matrix from given polynomial degree and x
    x_size = size(x, 1);
    A = zeros(x_size,n+1);
    for i=1:(x_size)
        for j=1:(n+1)
            A(i,j)=x(i)^(j-1);
        end
    end
end

