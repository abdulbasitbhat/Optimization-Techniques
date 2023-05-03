clc
clear



% A = [1 0 0 1 0 0 0;0 1 0 0 1 0 0;-1 1 0 0 0 1 0;-1 0 2 0 0 0 1];
% B = [4;4;6;4];
% c = [-1 2 -1 0 0 0 0];
A = [-1 1 1 0;1 1 0 1];
B = [1;2];
c = [1 2 0 0];
z = @(X) c*X;

m = size(A,1);
n = size(A,2);
nck = nchoosek(n,m);
pairs = nchoosek(1:n,m);

sol = [];
for i=1:nck
    y = zeros(n,1);
    basicVar = pairs(i,:);
    AA = A(:,pairs(i,:));
    X = AA\B;
    if(X>=0)
        y(basicVar) = X;
        sol = [sol y];
    end   
end

cost = z(sol);
max = 0;
index = 0;
for i=1:size(cost,2)
    if(cost(i) > max)
        max = cost(i);
        index = i;
    end
end

disp(max)
disp('at')
disp(sol(:,index));