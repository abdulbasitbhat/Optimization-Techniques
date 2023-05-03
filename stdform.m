clc
%Inputs
C =[3 5];   %Z coeff
A = [1 2;1 1;0 1];  %Coeff of s.t
B = [2000;1500;600]; %RHS of s.t

sign = [0 0 1];  %O for <= and 1 for >=

s = eye(size(A,1));  %size(A,1) = number of rows   size(A,2) = Number Of Columns

k = find(sign > 0);

s(k,:) = -s(k,:);  

A = [A s B];

Obj = array2table(A);
Obj.Properties.VariableNames(1:size(A,2)) = {'x_1','x_2','s1','s2','s3','Sol'};