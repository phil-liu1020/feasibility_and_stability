function pfeasplot_bivariate_hypercube_integral_6thorderC(n,C,rho,sigmaL,sigmaGridp)

% writes the vectors b and y into the workspace

sigma=(sigmaGridp:sigmaGridp:sigmaL);
pfeas=zeros(1,sigmaL/sigmaGridp);

E6 = (n-1)*(9*rho+6*rho^3)*C + rho*(1+2*rho^2)*2*(n-1)*(n-2)*C^2 + (n-1)*(n-2)*C^3 + rho^3*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + rho*(1+2*rho^2)*(n-1)*(n-2)*C^2 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho*(1+2*rho^2)*C^2 + 2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^3*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho*(1+2*rho^2)*C^2 + 2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^3*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho*(1+2*rho^2)*C^2;

E5E = 2*(n-1)*(n-2)*(1+2*rho^2)*C^2 + 4*(3*rho^2*(n-1)*(n-2))*C^2 + 3*rho^2*(n-1)*(n-2)*C^3 + rho*(n-1)*(n-2)*C^3 + 5*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^2*C^3 + (n-1)*(3+12*rho^2)*C;

E4E2 = 4*(n-1)*(n-2)*rho*(1+2*rho^2)*C^2 + 6*rho*(n-1)*(n-2)*C^2 + 3*rho*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho^2*C^3 + 2*rho*(n-1)*(n-2)*C^3 + 2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^3*C^3 + (n-1)*(9*rho+6*rho^3)*C;

E3E3 = 4*rho^2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + 2*(n-1)*(n-2)*rho^2*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*C^3 + ((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + 2*(n-1)*(n-2)*3*rho^2*C^2 + (n-1)*(n-2)*(1+2*rho^2)*C^2 + 2*(n-1)*(n-2)*3*rho^2*C^2 + (n-1)*(n-2)*(1+2*rho^2)*C^2 + (3+12*rho^2)*(n-1)*C;

varXorder6 = (2*E6 + 2*E5E + 2*E4E2 + E3E3) - (2*E6 + 2*(n-1)*C*rho*(2*(n-1)*(n-2)*rho^2*C^2+(n-1)*(1+2*rho^2)*C));

for i=1:sigmaL/sigmaGridp

    EX=(1+(n-1)*rho*sigma(i)^2*C);  
    VX=(n-1)*sigma(i)^2*C+((C*(n-1)+C^2*(n-1)*(n-2))+(4*C^2*(n-1)*(n-2)+6*C*(n-1))*rho+(2*C*(n-1)+C^2*(n-1)*(n-2)-(n-1)^2*C^2)*rho^2)*sigma(i)^4 + varXorder6*sigma(i)^6; 
    COVX=rho*sigma(i)^2*C;

    b=sqrt(abs(COVX)/VX);
    y=EX/sqrt(VX);

    fun = @(u)((1/(2^(n+0.5)*sqrt(pi)))*(1+erf((y-u*b)/sqrt(2*(1-b^2)))).^n.*exp(-u.^2/2));

    pfeas(i) = integral(fun,-Inf,Inf);
end

plot(sigma.*sqrt((n-1)*C),pfeas)