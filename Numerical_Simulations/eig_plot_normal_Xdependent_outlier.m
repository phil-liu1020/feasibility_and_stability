function eigMax = eig_plot_normal_Xdependent_outlier(n,rho,sigma,C)





A= bivariate_normal(n,rho,-1,C,sigma,0);
X=-inv(A)*ones(n,1);
M=diag(X)*A;
Re=real(eig(M)); Im=imag(eig(M));
eigMax=max(Re);    % eigenvalue with real part of the smallest magnitude


minX=min(X);
assignin('base','minX',minX)
assignin('caller','minX',minX)
assignin('caller','eigMax',eigMax)