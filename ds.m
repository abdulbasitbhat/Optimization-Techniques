clc
clear all
C=[-2 0 -1 0 0 0];
A=[-1 -1 1 1 0 -5; -1 2 -4 0 1 -8];
ib=[4 5];
%max -5x-5y, x+y>=2,4x+y>=4,
 C=[-5 -6 0 0 0];
 A=[-1 -1 1 0 -2; -4 -1 0 1 -4];
 ib=[3 4];
zjcj=C(ib)*A-C;
RUN=true;
while RUN
if any(A(:,size(A,2))<0)
fprintf('the current BFS is not feasible')
[lvg_val, pvt_row]=min(A(:,size(A,2)));
for i=1:size(A,2)-1
if A(pvt_row,i)<0
m(i)=zjcj(i)/A(pvt_row,i);
else
m(i)=-inf;
end
end
[ent_val, pvt_col]=max(m);
A(pvt_row,:)=A(pvt_row,:)/A(pvt_row,pvt_col);
for i=1:size(A,1)
if i~=pvt_row
A(i,:)=A(i,:)-A(i,pvt_col).*A(pvt_row,:);
end
end
ib(pvt_row)=pvt_col;
zjcj=zjcj-zjcj(pvt_col).*A(pvt_row,:);
ZCj=[zjcj;A];
else
RUN=false;
fprintf(' current BFS is Feasible and Optimal \n')
end
