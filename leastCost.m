clc
clear all

% cost = [20 19 14 21 16;15 20 13 19 16;18 15 18 20 10];
% supply = [40 60 70];
% demand = [30 40 50 40 60];

 cost = [2 10 4 5;6 12 8 11;3 9 5 7];
 supply = [12 25 20];
 demand = [25 10 15 5];



% cost = [3 11 4 14 15;6 16 18 2 28;10 13 15 19 17;7 12 5 8 9];
% supply = [15 25 10 15];
% demand = [20 10 15 15 5];

[m,n] = size(cost);
if(sum(supply) == sum(demand))
   disp('Balanced') 
elseif(sum(supply) < sum(demand))
    %Unbalanced  Add row   and set the resp val as the diff
    cost(end+1,:) = zeros(1,n);
    supply(end+1) = sum(demand) - sum(supply);
else
    %Unbaanced  Add column  and set the resp val as the diff
    cost(:,end+1) = zeros(m,1);
    demand(end+1) = sum(supply) - sum(demand);
end
disp('Balanced Cost Matrix')
disp(cost)
[m,n] = size(cost);  %updated vals
balanced = [cost supply';demand sum(demand)];
disp(balanced)

X = zeros(m,n);
%X stores solution
Initial_cost = cost;
while any(supply ~= 0) || any(demand ~= 0)
    %Find min element in whole cost table
    min_cost = min(cost(:));
    [row,col] = find(cost == min_cost);
    disp([row,col]);
    y = min(supply(row),demand(col));
    [alloc, index] = max(y); %if tie chose one with max
    
    rr = row(index);
    cc = col(index);
    
    X(rr,cc) = alloc;
    supply(rr) = supply(rr) - alloc;
    demand(cc) = demand(cc) - alloc;
    cost(rr,cc) = Inf;
end

final_cost = Initial_cost .* X;
Final_cost = sum(final_cost(:));
disp('Final Cost')
disp(Final_cost);
disp(X);