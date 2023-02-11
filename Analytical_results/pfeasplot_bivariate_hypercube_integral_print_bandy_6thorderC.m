function pfeasplot_bivariate_hypercube_integral_print_bandy_6thorderC(n,C,rho,sigmaL,sigmaGridp)

% writes the vectors b and y into the workspace

sigma=(sigmaGridp:sigmaGridp:sigmaL);
b=zeros(1,sigmaL/sigmaGridp);
y=zeros(1,sigmaL/sigmaGridp);

E6 = (n-1)*(9*rho+6*rho^3)*C + rho*(1+2*rho^2)*2*(n-1)*(n-2)*C^2 + (n-1)*(n-2)*C^3 + rho^3*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + rho*(1+2*rho^2)*(n-1)*(n-2)*C^2 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho*(1+2*rho^2)*C^2 + 2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^3*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho*(1+2*rho^2)*C^2 + 2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^3*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho*(1+2*rho^2)*C^2;

E5E = 2*(n-1)*(n-2)*(1+2*rho^2)*C^2 + 4*(3*rho^2*(n-1)*(n-2))*C^2 + 3*rho^2*(n-1)*(n-2)*C^3 + rho*(n-1)*(n-2)*C^3 + 5*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^2*C^3 + (n-1)*(3+12*rho^2)*C;

E4E2 = 4*(n-1)*(n-2)*rho*(1+2*rho^2)*C^2 + 6*rho*(n-1)*(n-2)*C^2 + 3*rho*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*rho^2*C^3 + 2*rho*(n-1)*(n-2)*C^3 + 2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*rho^3*C^3 + (n-1)*(9*rho+6*rho^3)*C;

E3E3 = 4*rho^2*((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + 2*(n-1)*(n-2)*rho^2*C^3 + (n-1)*(n-2)*rho^3*C^3 + (n-1)*(n-2)*C^3 + ((n-1)^3-(n-1)^2-2*(n-1)*(n-2))*C^3 + 2*(n-1)*(n-2)*3*rho^2*C^2 + (n-1)*(n-2)*(1+2*rho^2)*C^2 + 2*(n-1)*(n-2)*3*rho^2*C^2 + (n-1)*(n-2)*(1+2*rho^2)*C^2 + (3+12*rho^2)*(n-1)*C;

varXorder6 = (2*E6 + 2*E5E + 2*E4E2 + E3E3) - (2*E6 + 2*(n-1)*C*rho*(2*(n-1)*(n-2)*rho^2*C^2+(n-1)*(1+2*rho^2)*C));

for i=1:sigmaL/sigmaGridp

    EX=1+(n-1)*rho*C*sigma(i)^2;
    COVX=rho*C*sigma(i)^2;
    VX= (n-1)*sigma(i)^2*C+((C*(n-1)+C^2*(n-1)*(n-2))+(4*C^2*(n-1)*(n-2)+6*C*(n-1))*rho+(2*C*(n-1)+C^2*(n-1)*(n-2)-(n-1)^2*C^2)*rho^2)*sigma(i)^4 + varXorder6*sigma(i)^6; 

    b(i)=sqrt(abs(COVX)/VX);
    y(i)=EX/sqrt(VX);
end

assignin('base','y',y)
assignin('base','b',b)

%This is the instructions for converting y and b to excel file
%xlswrite('y.xlsx',y)
%xlswrite('b.xlsx',b)
% open the file "numerical integration negative rho hypercube" saved in "Readme(Functions, figures, workspaces and fitted distributions)"