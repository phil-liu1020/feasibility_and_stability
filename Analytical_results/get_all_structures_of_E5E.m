function get_all_structures_of_E5E(a,b,c,d,e)

% If we want to look at Aij^4*Aji, then we put in (a,b,c,d,e)=(1,1,1,1,2)

p=perms([a b c d e]);   % Finds the whole set of unique permutations of (a,b,c,d,e) 
p=unique(p,'rows');
assignin('base','p',p);
syms a [4 4]
A1 =[   0, a1_2, 0, 0;a2_1,    0,0, 0 ; 0,0, 0, 0  ; 0,    0, 0, 0] ;    %specifies the matrices we'd like to multiply together
A2 =[ 0,0,a1_3,0;0,0,0,0;a3_1,0,0,0;0,0,0,0 ];
A3 =[ 0,0,0,a1_4;0,0,0,0;0,0,0,0;a4_1,0,0,0 ];


B=sym(zeros(4,4,length(p)));
C=sym(zeros(length(p),1));

for i=1:length(p) 
a=1;  
for j=1:5
if p(i,j)==1
a=a*A1;
elseif p(i,j)==2
a=a*A2;
elseif p(i,j)==3
a=a*A3;    
end
end
B(:,:,i)=a;
end
assignin("base",'B',B)

    
%[GC,GR] = groupcounts(p(1,:)');
%odd=mod(GC,2);


%for i=1:length(GC)
%if odd(i)==1
  %  q=GR(i);
%else
%end
%end

%BB=sym(zeros(4,4,2*length(p(:,1))));
%if q==1
 %   BB(:,:,i)=B(:,:,i)*A1;
%elseif q==2
 %   BB(:,:,i)=B(:,:,i)*A2;
%elseif q==3
 %   BB(:,:,i)=B(:,:,i)*A3;
%else
%end
%end

%for i=1:length(p(1,:))
%if q==1
%    BB(:,:,i+length(B))=A1*B(:,:,i);
%elseif q==2
%    BB(:,:,i+length(B))=A2*B(:,:,i);
%elseif q==3
 %   BB(:,:,i+length(B))=A3*B(:,:,i);
%else
%end
%end
    
%assignin('base','BB',BB)


for i=1:length(B)
if sum(B(1,:,i))==0
else
C(i)=sum(B(1,:,i));
end
end
C( all( isAlways(C==0) ,2) ,:) = [];
assignin("base",'C',C)