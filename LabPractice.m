clc
clear

%Graphical Method
z = @(x1,x2) 3*x1 + 2*x2;
c1 = @(x1,x2) 2*x1 + 4*x2 - 8;
c2 = @(x1,x2) 3*x1 + 5*x2 - 15;

A = [2 4;3 5];
B = [8;15];

%Plot lines
m = size(A,1);
x1 = 0:max(B);
for i=1:m
    x22 = (B(i) - A(i,1) * x1)/A(i,2);
    x2 = max(0,x22);
    plot(x1,x2);
    hold on
end

%Finding intersec points
inter = [];
A = [A;[0 1;1 0]];
B = [B;[0;0]];
m = size(A,1);
for i=1:m
    for j = i+1:m
        AA = [A(i,:);A(j,:)];
        BB = [B(i);B(j)];
        X = AA\BB;
        if(X>=0)
            inter = [inter X];
        end
    end
end
for i=1:size(inter,2)
    plot(inter(1,i),inter(2,i),'*r');
    hold on;
end

%Feasible region points
f = [];
for i=1:size(inter,2)
    if(c1(inter(1,i),inter(2,i)) <=0 && c2(inter(1,i),inter(2,i))<=0)
        f = [f [inter(1,i);inter(2,i)]];
    end
end

for i=1:size(f,2)
    plot(f(1,i),f(2,i),'*r');
    hold on;
end

max = 0;
index = 0;
for i=1:size(f,2)
    val = z(f(1,i),f(2,i));
    if(val > max)
        max = val;
        index = i;
    end
end

disp('Optimal')
disp(max)
disp('at')
disp(f(:,index));
