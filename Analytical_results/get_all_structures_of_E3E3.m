function get_all_structures_of_E3E3(permlist,i,j,k,l,m,n)

% perms123123=perms([1 2 3 1 2 3]);
% uniqperms_col1to3_123123=unique(perms123123,'rows');
% permlist is set as "uniqperms_col1to3_123123"
% Function finds the product of all combinations of products of matrices
% Eij. Say if you're seeking all combinations of E12*E13*E14, then (i,j,k,l,m,n)=(1,2,1,3,1,4).

% permlist is the set of all permutations of say E12*E13*E14 we'd like to consider.

A1=Epsilon(i,j);
A2=Epsilon(k,l);
A3=Epsilon(m,n);

B=sym(zeros(4,4,length(permlist)));
C=sym(zeros(length(permlist),1));

for i=1:length(permlist) 
a=1;  
for j=1:3
if permlist(i,j)==1
a=a*A1;
elseif permlist(i,j)==2
a=a*A2;
elseif permlist(i,j)==3
a=a*A3;    
end
end
B(:,:,i)=a;
end
assignin("base",'B',B)


for i=1:length(B(1,1,:))
if sum(B(1,:,i))==0
else
C(i)=sum(B(1,:,i));
end
end
C( all( isAlways(C==0) ,2) ,:) = [];
assignin("base",'C',C)

assignin('base','A1',A1)
assignin('base','A2',A2)
assignin('base','A3',A3)