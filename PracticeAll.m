clc
clear

z = @(x1,x2) x1 + x2;
c1 = @(x1,x2) x1 + 2*x2 - 10;
c2 = @(x1,x2) x1 + x2 -6;
c3 = @(x1,x2) x1 -2*x2 -1;
c4 = @(x1,x2) 2*x1 - 2*x2 -2;

%Matrices
A = [1 2;1 1;1 -2;2 -2];
B = [10;6;1;2];

m = size(A,1);
x1 = 0:max(B);

%Note x1 and x22 and x2 are arrays and not single values.  
%x22 = (B(i) - A(i,1) * x1)/A(i,2); has x2 values for all x1
for i = 1:m
    x22 = (B(i) - A(i,1) * x1)/A(i,2);
    x2 = max(0,x22);
    plot(x1,x2)
    hold on
end

%Int
A = [A;[0 1;1 0]];
B = [B;[0;0]];
m = size(A,1);
pt = [];
for i=1:m
    for j = i+1:m 
        AA = [A(i,:);A(j,:)];
        BB = [B(i);B(j)];
        x = AA\BB;
        if(x>=0)
            pt = [pt x];
        end
    end
end
for i=1:size(pt,2)
    plot(pt(1,i),pt(2,i),'*g');
    hold on
end

%Feasible ones
f = [];
for i=1:size(pt,2)
    if(c1(pt(1,i),pt(2,i)) <= 0 && c2(pt(1,i),pt(2,i)) <= 0 && c3(pt(1,i),pt(2,i))<=0 && c4(pt(1,i),pt(2,i))<=0)
       f = [f [pt(1,i);pt(2,i)]];
    end
end
for i=1:size(f,2)
    plot(f(1,i),f(2,i),'*b');
    hold on
end

max =0;
for i=1:size(f,2)
    val = z(f(1,i),f(2,i));
    if(val > max)
      max = val;
      index = i;
    end
end

disp(max);
disp(f(:,index));




