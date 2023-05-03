clc
clear

%First conv ineq to eq then do this
A = [-1 1 1 0;1 1 0 1];
b = [1;2];
c = [1 2 0 0];

z = @(X)c*X;

n = size(A,2);  %Variables
m = size(A,1);  %Constraints

ncm = nchoosek(n,m);
pairs = nchoosek(1:n,m);

basicsol = [];
bfsol = [];
for i=1:ncm
   y = zeros(n,1);   
   basicVar = pairs(i,:);
   B = A(:,pairs(i,:));
   x = B\b;
   basicsol = [basicsol x];
   if(x>=0)
       y(basicVar) = x;
       bfsol = [bfsol , y];
   end   
end

cost = z(bfsol);
max = 0;
index = -1;
for i=1:size(cost,2)
    if(cost(i) > max)
        max = cost(i);
        index = i;
    end
end

disp('Max at')
disp(bfsol(:,index))
disp('Max Val')
disp(cost(index))

