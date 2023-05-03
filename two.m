clc
clear


A = [1 1 -1 3;5 1 4 15];
b = [15;12];
c = [1 2 -1 1];

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
   B = A(:,pairs(1,:));
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
    if(bfsol(1,i) > max)
        max = bfsol(1,i);
        index = i;
    end  
end

disp('Max at')
disp(bfsol(1:n,index))
disp('Max Val')
disp(bfsol(index))

