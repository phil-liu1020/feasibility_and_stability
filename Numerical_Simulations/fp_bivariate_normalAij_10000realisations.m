function X= fp_bivariate_normalAij_10000realisations(n,rho,C,sigma,Nreal)

% calculates fixed points of 1000 realisations of interaction matrices A s.t. A_{ij} is bivariate normal
% Nreal is the number of realisations of X* to be obtained

Acol=cell(Nreal,1);
X=zeros(Nreal,n);

parfor i=1:Nreal
A=bivariate_normal(n,rho,-1,C,sigma,0);
Acol{i}=A;
X(i,:)=-inv(A)*ones(n,1);
end

assignin('base','X',X);
assignin('caller','Acol',Acol)