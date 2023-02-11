function unstable = eig_plot_normal_Xdependent(n,rho,sigma,C,plots)




A= bivariate_normal(n,rho,-1,C,sigma,0);
X=-inv(A)*ones(n,1);
M=diag(X)*A;
Re=real(eig(M)); Im=imag(eig(M));
eigMinReal=min(abs(Re));    % eigenvalue with real part of the smallest magnitude

if plots==1
plot(Re,Im,'*','MarkerEdgeColor','black')
else
end

REp=Re(Re>0);
unstable=length(REp)/length(Re);


