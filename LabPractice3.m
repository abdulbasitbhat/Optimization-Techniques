clc
clear

A = [1 0 0;0 1 0;-1 1 0;-1 0 2];
b = [4;4;6;4];
m = size(A,1);
I = eye(m);

sign = [0 0 0 0];

for i=1:size(sign,1)
    if(sign(i)>0)
        I(:,i) = -I(:,i);
    end
end

A = [A b I];
disp(A);