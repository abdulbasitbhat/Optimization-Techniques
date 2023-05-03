clc
clear

z = @(x1,x2) 5*x1 +3*x2;
c1 = @(x1,x2) 3*x1 + 5*x2 - 15;
c2 = @(x1,x2) 5*x1 + 2*x2 - 10;


%Matrices
A = [3 5;5 2];
B = [15;10];

%Plot Lines
m = size(A,1);
x1 = 0:max(B);
for i=1:m
    x22 = (B(i) - A(i,1) * x1)/A(i,2);
    x2 = max(0,x22);
    plot(x1,x2)
    hold on
end

%Find intersections
A = [A;[0 1;1 0]];
B = [B [0;0]];

m = size(A,1);
inte = [];
for i=1:m
  for j=i+1:m
      AA = [A(i,:);A(j,:)];
      BB = [B(i);B(j)];
      X = AA\BB;
      if(X>=0)
          inte = [inte,X];
      end
  end
end

%Feasible ones
f = [];
for i=1:size(inte,2)
    if(c1(inte(1,i),inte(2,i))<=0 && c2(inte(1,i),inte(2,i))<=0)
        f = [f [inte(1,i);inte(2,i)]];
    end
end

%optimal
max = 0;
index = 0;
for i=1:size(f,2)   %Correct other codes here
    val = z(f(1,i),f(2,i));
    if(val>max)
        max = val;
        index = i;
    end
end

disp(max)
disp(f(:,index))
