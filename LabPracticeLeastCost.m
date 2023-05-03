clc
clear all

Supply = [15 25 10 15];
Demand = [20 10 15 15 5];
Cost = [3 11 4 14 15;6 16 18 2 28;10 13 15 19 17;7 12 5 8 9];
[m,n] = size(Cost);

if sum(Supply) ~= sum(Demand)
    disp('Unbalanced')
    if(sum(Supply) > sum(Demand))
        %add column
        Cost(:,end+1) = zeros(m);
        Demand(end+1) = sum(Supply) - sum(Demand);
    else
        %add row
        Cost(end+1,:) = zeros(n);
        Supply(end+1) = sum(Demand) - sum(Supply);
    end
end
[m,n] = size(Cost);
X = zeros(m,n);
while ( any(Supply ~= 0) || any(Demand~=0) )
    min_el = min(Cost(:));
    [ROW,COL] = find(Cost == min_el);
    y = min(Supply(ROW), Demand(COL));
    [alloc,index] = max(y);
    
    rr = ROW(index);
    cc = COL(index);
    X(rr,cc) = alloc;
    Supply(rr) = Supply(rr) - alloc;
    Demand(cc) = Demand(cc) - alloc;
    Cost(rr,cc) = Inf;    
end

