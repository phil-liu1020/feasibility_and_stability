function eigMax= eig_plot_normal_Xindependent_outlier(n,rho,sigma,C)

A= bivariate_normal(n,rho,-1,C,sigma,0);

E6 = (n-1)*(9*rho+6*rho^3)*C + rho*(1+2*rho^2)*2*(n-1)*(n-2)*C^2 + (n-1)*(n-2)*C^3 + rho^3*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + rho*(1+2*rho^2)*(n-1)*(n-2)*C^2 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho*(1+2*rho^2)*C^2 + 2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^3*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho*(1+2*rho^2)*C^2 + 2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^3*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho*(1+2*rho^2)*C^2;

E5E = 2*(n-1)*(n-2)*(1+2*rho^2)*C^2 + 4*(3*rho^2*(n-1)*(n-2))*C^2 + 3*rho^2*(n-1)*(n-2)*C^3 + rho*(n-1)*(n-2)*C^3 + 5*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^2*C^3 + (n-1)*(3+12*rho^2)*C;

E4E2 = 4*(n-1)*(n-2)*rho*(1+2*rho^2)*C^2 + 6*rho*(n-1)*(n-2)*C^2 + 3*rho*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho^2*C^3 + 2*rho*(n-1)*(n-2)*C^3 + 2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^3*C^3 + (n-1)*(9*rho+6*rho^3)*C;

E3E3 = 4*rho^2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + 2*(n-1)*(n-2)*rho^2*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*C^3 + ((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + 2*(n-1)*(n-2)*3*rho^2*C^2 + (n-1)*(n-2)*(1+2*rho^2)*C^2 + 2*(n-1)*(n-2)*3*rho^2*C^2 + (n-1)*(n-2)*(1+2*rho^2)*C^2 + (3+12*rho^2)*(n-1)*C;

varXorder6 = (2*E6 + 2*E5E + 2*E4E2 + E3E3) - (2*E6 + 2*(n-1)*C*rho*(2*(n-1)*(n-2)*rho^2*C^2+(n-1)*(1+2*rho^2)*C));

mu = (1+(n-1)*rho*C*sigma^2)*ones(n,1);
Sigma=rho*sigma^2*C*ones(n);
Sigma(1:n+1:end)=(n-1)*sigma^2*C+( (C*(n-1)+C^2*(n-1)*(n-2))+(4*C^2*(n-1)*(n-2)+6*C*(n-1))*rho+(2*C*(n-1)+C^2*(n-1)*(n-2)-(n-1)^2*C^2)*rho^2 )*sigma^4 + varXorder6*sigma^6;
                 
X = mvnrnd(mu,Sigma);

M=diag(X)*A;
Re=real(eig(M)); Im=imag(eig(M));

eigMax=max(Re);


minX=min(X);
assignin('base','minX',minX)
assignin('caller','minX',minX)
assignin('caller','eigMax',eigMax)