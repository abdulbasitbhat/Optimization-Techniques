clc
clear



A = [2 3 -1 4;1 -2 6 -7];
B = [8;-3];
c = [2 3 4 7];

z = @(X)c*X;
n = size(A,2);
m = size(A,1);

nck = nchoosek(n,m);
pairs = nchoosek(1:n,m);

inte = [];
for i =1:nck
    y =zeros(n,1);
    basicVar = pairs(i,:);
    AA = A(:,pairs(i,:));
    x = AA\B;
    if(x >=0)
        y(basicVar) = x;
        inte = [inte y];
    end
end

max = 0;
for i=1:size(inte,2)
    val = z(inte(:,i));
    if(val > max)
        max = val;
        index = i;
    end
end

disp(max)
disp(inte(:,index))