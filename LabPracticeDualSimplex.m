clc
clear all

% C = [-12 -10 0 0 0 0]; %Extra 0 for sol
% a = [-5 -1 1 0 0;-6 -5 0 1 0;-1 -4 0 0 1];
% b = [-10;-30;-8];
% A = [a b];
% bv = [3 4 5];
% zjcj = C(bv)*A -C;

%For Checking Answers to manual practice
C = [-5 -6 0 0 0];
a = [-1 -2 1 0;-4 -1 0 1];
b = [-2;-4];
A = [a b];
bv = [3 4];
zjcj = C(bv)*A -C;

ratio = [];
RUN = true;

while RUN
   if all(A(:,end)>0)
       disp('Sol')
       disp(zjcj(end));
       disp('at')
       disp(A(:,end));
       disp(bv);
       RUN = false;
   else
      [LV,PR] = min(A(:,end)); 
      rr = A(PR,1:end-1);
      zjj = zjcj(1:end-1);
      for i=1:size(A,2)-1
          if(rr(i)<0)
              ratio(i) = abs(zjj(i)./rr(i));
          else
              ratio(i) = inf;
          end
      end
      [EV,PC] = min(ratio);
      bv(PR) = PC;
      
      A(PR,:) = A(PR,:)/A(PR,PC);
      for i=1:size(A,1)
          if i~=PR
              A(i,:) = A(i,:) - A(i,PC)*A(PR,:);
          end
      end
      zjcj = C(bv)*A - C;
   end
   
end
