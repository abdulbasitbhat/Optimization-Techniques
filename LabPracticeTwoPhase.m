clc
clear all

%Phase 1
% Solve art var eq, just change C, Simplex
C = [0 0 0 0 0 -1 -1 -1 0]; 
a = [5 1 -1 0 0 1 0 0;6 5 0 -1 0 0 1 0;1 4 0 0 -1 0 0 1];
b = [10;30;8];
A = [a b];
bv = [6 7 8];
zjcj = C(bv)*A - C;
st_bv = bv;

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
        disp(bv);
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



%Phase 2
%Change C, Change A, update zjcj as C changed. Simplex
C = [-12 -10 0 0 0 0];
A(:,st_bv) = [];

ratio = [];
RUN = true;
A_orig = A;
zjcj = C(bv)*A - C;
while RUN
    %If Optimal
    if(all(zjcj(1:end-1)>=0))
        disp('OPTIMAL TABLE')
        disp('Solution:')
        disp(zjcj(end))
        disp('at')
        disp(A(:,end))
        disp(bv);
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



