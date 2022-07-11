function [A,b] = prepareTest()
%PREPARETEST Prepares A matrix and b vector for test.
G = 10*rand(5);
A = G * (G');
b = 30*rand(5,1);
end

