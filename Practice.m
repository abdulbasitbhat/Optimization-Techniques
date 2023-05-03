clc
clear

z = @(x1,x2) x1 + x2;
c1 = @(x1,x2) x1 + 2*x2 - 10;
c2 = @(x1,x2) x1 + x2 -6;
c3 = @(x1,x2) x1 -2*x2 -1;
c4 = @(x1,x2) 2*x1 - 2*x2 -2;

%Representing and Plotting
A = [1 2;1 1;1 -2;2 -2];
B = [10;6;1;2];

m = size(A,1);  %No of equations, equal to number of rows
x1 = 0:max(B);  %posiible values of one variable, second we get from eq
                %we use both to plot a line
for i=1:m
    x22 = (B(i) - A(i,1) *x1)/A(i,2);
    x2 = max(0,x22);   %Only first quad
    plot(x1,x2);
    hold on;   %Without it only last line will plot
end
% x1 + 2x2 = 10   means x2 = (10 - 1*x1)/2  
%generally    (B(i)- A(i,1)*x1)/A(i,2)

%Points Of Intersection
A = [A;[0 1;1 0]];
B = [B;[0;0]];
m_new = size(A,1);

inte = [];
for i = 1:m_new
    for j = i+1:m_new
        AA = [A(i,:);A(j,:)];
        BB = [B(i);B(j)];
        s = AA\BB;
        if(s>=0)
            inte = [inte s];
        end
    end
end
disp(inte)
%Plotting Points Of Intersection
for i=1:size(inte,2)
    plot(inte(1,i),inte(2,i),'*b');
    hold on
end

%Feasible Ones
f = [];
for i = 1:size(inte)
    if(c1(inte(1,i),inte(2,i))<=0 && c2(inte(1,i),inte(2,i))<=0 && c3(inte(1,i),inte(2,i))<=0 && c4(inte(1,i),inte(2,i))<=0 )
        f = [f [inte(1,i);inte(2,i)]];
    end
end

for i=1:size(f,2)
    plot(inte(1,i),inte(2,i),'*g');
    hold on
end

%optimal val
max = 0;
for i=1:size(f,2)
    val = z(f(1,i),f(2,i));
    if(val > max)
        max = val;
        index = i;
    end
end

disp('optimal val')
disp(max)
disp('at')
disp(f(:,index))




