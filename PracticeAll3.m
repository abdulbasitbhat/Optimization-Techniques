clc
clear

C =[3 5];   %Z coeff
A = [1 2;1 1;0 1];  %Coeff of s.t
B = [2000;1500;600]; %RHS of s.t

sign = [0 0 1];

I = eye(size(A,1));

k = find(sign>0);

I(k,:) = -I(k,:);

A = [A I B];

obj = array2table(A);
obj.Properties.VariableNames(1:size(A,2)) = {'x1','x2','s1','s2','s3','sol'}