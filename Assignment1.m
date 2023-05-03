clc
clear
z = @(x1,x2) 3*x1 + 5*x2;
c1 = @(x1,x2) x1 + 2*x2 - 2000;
c2 = @(x1,x2) x1 + x2 - 1500;
c3 = @(x1,x2) x2 - 600;

%A = [2 4;3 5];
%B = [8;15];
A = [1 2;1 1 ;0 1];
B = [2000;1500;600];
m = size(A,1);  %Number of Rows ie equations here
x1 = 0:max(B);
%x1=0:max(B./A(:,1));
%Plotting Lines
for i=1:m
  x22 =  (B(i) - A(i,1) * x1)/A(i,2);
  x2 = max(0,x22);   %Clips -ve portion to x or y axis
  plot(x1,x2)
  hold on
end

%Points Of Intersection
%added 1 0 and 0 1 row for x and y intercepts 
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
%Intercepts


for i=1:size(pt,2)
    plot(pt(1,i),pt(2,i),'*b');
    hold on
end

%Feasible Points
f = [];
for i=1:size(pt,2)
    if(c1(pt(1,i),pt(2,i)) <= 0 &&  c2(pt(1,i),pt(2,i)) <= 0 && c3(pt(1,i),pt(2,i))<= 0)
      f = [f,[pt(1,i);pt(2,i)]];
    end   
end

for i=1:size(f,2)
    plot(f(1,i),f(2,i),'*r');
    hold on
end

%Optimal Sol
max = 0;
index = 0;
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
    disp('Optimal Val is')
    disp(max)
    disp('At Points')
    disp(f(:,index))
    plot(f(1,index),f(2,index),'*g')
end

%In Graph
%Blue Intercepts
%Red  Feasible Points
%Green Optimal Point

%Issues
%x1=0:max(B./A(:,1)); Dosent Work when any of the coefficients is 0 in any
%equation




