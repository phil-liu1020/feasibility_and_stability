function get_all_structures_of_E6(a,b,c,d,e,f)

p=perms([a b c d e f]);
p=unique(p,'rows');
syms a [4 4]
A1 =[   0, a1_2, 0, 0;a2_1,    0, 0, 0 ;  0,    0, 0, 0  ; 0,    0, 0, 0];
A2 =[   0, 0, a1_3, 0;0,    0, 0, 0 ;  a3_1,    0, 0, 0  ; 0,    0, 0, 0] ;
A3 =[   0, 0, 0, 0;0,    0,a2_3,0 ;  0,   a3_2, 0, 0  ; 0, 0, 0, 0] ;
%A2 =[   0, 0, a1_3, 0;0,    0, 0, 0 ;  a3_1,    0, 0, 0  ; 0,    0, 0, 0] ;

B=sym(zeros(4,4,length(p)));
C=sym(zeros(length(p),1));

for i=1:length(p)
a=1;  
for j=1:6
if p(i,j)==1
a=A1*a;
elseif p(i,j)==2
a=A2*a;
elseif p(i,j)==3
a=A3*a;    
end
end
B(:,:,i)=a;
end

assignin("base",'B',B)



for i=1:length(B)
if sum(B(1,:,i))==0
else
C(i)=sum(B(1,:,i));
end
end
C( all( isAlways(C==0) ,2) ,:) = [];
assignin("base",'C',C)

