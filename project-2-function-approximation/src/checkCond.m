[x,y] = getData();
for n = 0:10
    A = getA(n, x);
    condATA = cond(A'*A);
    disp(['For polynomal of ' int2str(n) ' cond of A^TA equals ' int2str(condATA)])
end