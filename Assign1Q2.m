clc
clear
z = @(x1,x2) 3*x1 + 2*x2;
c1 = @(x1,x2) 2*x1 + 4*x2 - 8;
c2 = @(x1,x2) 3*x1 + 5*x2 - 15;

A = [2 4;3 5];
B = [8;15];
m = size(A,1);
x1 = 0:max(B);
%x1=0:max(B./A(:,1));
for i=1:m
  x22 =  (B(i) - A(i,1) * x1)/A(i,2);
  x2 = max(0,x22);
  plot(x1,x2)
  hold on
end

%Points Of Intersection
A = [A;[1 0;0 1]];
B = [B;[0;0]];
m = size(A,1);
pt =[];
for i=1:m
    for j=i+1:m
        AA = [A(i,:);A(j,:)];
        BB = [B(i);B(j)];
        X = AA\BB;
        if(X>=0)
            pt = [pt,X];
        end
    end
end


for i=1:size(pt,2)
    plot(pt(1,i),pt(2,i),'*b');
    hold on
end

%Feasible Points
f = [];
for i=1:size(pt,2)
    if(c1(pt(1,i),pt(2,i)) >= 0 &&  c2(pt(1,i),pt(2,i)) >= 0)
      f = [f,[pt(1,i);pt(2,i)]];
    end   
end

for i=1:size(f,2)
    plot(f(1,i),f(2,i),'*r');
    hold on
end

%Optimal Sol
max = -1;
index = 1;
for i=1:size(f,2)
    val = z(f(1,i),f(2,i));
    if(val > max)
        max = val;
        index = i;
    end
end

if(isempty(f))
    disp('No Feasible Region')
else
    disp('Optimal Max Val is')
    disp(max)
    disp('At Points')
    disp(f(:,index))
    plot(f(1,index),f(2,index),'*g')
end

min = 1000000;
index = 1;
for i=1:size(f,2)
    val = z(f(1,i),f(2,i));
    if(val < min)
        min = val;
        index = i;
    end
end

if(isempty(f))
    disp('No Feasible Region')
else
    disp('Optimal Min Val is')
    disp(min)
    disp('At Points')
    disp(f(:,index))
    plot(f(1,index),f(2,index),'*y')
end
%In Graph
%Blue Intercepts
%Red  Feasible Points
%Green Optimal Point Maximum
%Yellow Optimal Point Minimum