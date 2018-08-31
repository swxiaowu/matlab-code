clear all;
A = [1 1; -1 2; 2 1];
b = [2; 2; 3];
lb = zeros(2,1);
[x,fval,exitflag,output] = ga(@lincontest6,2,A,b,[],[],lb)
