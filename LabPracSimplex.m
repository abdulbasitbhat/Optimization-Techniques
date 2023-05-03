clc
clear all

% C = [4 6 3 1 0 0 0 0]; %extra 0 for sol
% a = [1 4 8 6 1 0 0;4 1 2 1 0 1 0;2 3 1 2 0 0 1];
% b = [11;7;2];
% A = [a b];
% bv = [5 6 7];
% zjcj = C(bv)*A - C;

%For Checking Answers to manual practice
C = [-1 2 -1 0 0 0 0];
a = [1 2 -2 1 0 0;1 0 -1 0 1 0;2 -1 2 0 0 1];
b = [4;4;2];

A = [a b];
bv = [4 5 6];
zjcj = C(bv)*A - C;

ratio = [];
RUN = true;
while RUN
    %If Optimal
    if(all(zjcj(1:end-1)>=0))
        disp('OPTIMAL TABLE')
        disp('Solution:')
        disp(zjcj(end))
        disp('at')
        disp(A(:,end))
        disp('bv')
        disp(bv)
        RUN = false;
        
    else
        %Find min in zjcj
        [EV,PC] = min(zjcj(1:end-1));
        %Ratio Rule
        cc = A(:,PC);
        sol = A(:,end);
        for i=1:size(A,1)
            if(cc(i)>0)
                ratio(i) = sol(i)/cc(i);
            else
                ratio(i) = inf;
            end
        end
        [LV,PR] = min(ratio);
        bv(PR) = PC;
        
        %Update Matrix
        A(PR,:) = A(PR,:)/A(PR,PC);
        for i=1:size(A,1)
            if i~=PR
                A(i,:) = A(i,:) - A(i,PC)*A(PR,:);
            end
        end  
        zjcj = C(bv)*A - C;
    end
end

