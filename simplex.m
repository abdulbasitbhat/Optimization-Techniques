clc
clear all
 C = [2 1 0 0 0 0];
 a = [1 2 1 0 0; 1 1 0 1 0; 1 -1 0 0 1];
 b = [10;6;2];

A = [a b];
bv = [3 4 5];
zjcj = C(bv)*A-C;
table = [A;zjcj];
disp(zjcj);

ratio = [];
RUN = true;
while RUN
   if any(zjcj(1:end-1)<0)
       %table is not optimal yet
       [EV,PC] = min(zjcj(1:end-1));
       %[EntringVar PivotCol]
       if all(A(:,PC)<0)
           %all vals of entring col var neg, min ration fail
           error('Unbounded, Min Ratio Fail')
       else
           cc = A(:,PC);
           sol = A(:,end);
           for i = 1:size(A,1)
               if cc(i) > 0
                   ratio(i) = sol(i)/cc(i);
               else
                   ratio(i) = inf;
               end
           end
           [LV,PR] = min(ratio);
           %LeavingVar PivotRow
       end
       bv(PR) = PC;
       %Divide the row to get 1
       k = A(PR,PC);
       A(PR,:) = A(PR,:)/k;
       
       %Row Operations
       for i = 1:size(A,1)
           if i~=PR
             A(i,:) = A(i,:) - A(i,PC)*A(PR,:);  
           end
       end
      zjcj = C(bv)*A-C;
      table = [A;zjcj];
   else
       %No neg val in zjcj means optimality
       disp('Optimaity')
       disp(zjcj(end));
       RUN = false;     
   end        
end
