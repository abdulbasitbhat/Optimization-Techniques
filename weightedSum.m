clc
clear all

c1 = [3 2 4];
c2 = [1 5 3];

a = [2 4 1;3 5 4];
b = [8;15];

%Optimal Equations are 2, so weight = 2
weight = 2;
w = weight;

% c = [c1 c2];
% disp('Concat')
% disp(c)
% c = (1/w)*c;
% disp('Apply Weight')
% disp(c)

%Applying Weights
c1 = (1/w)*c1;
c2 = (1/w)*c2;
%Adding Coeff of same variables
c = c1+c2;
disp('Optimal Function')
disp(c);
disp('s.t.')
disp(a);
disp('RHS')
disp(b);
