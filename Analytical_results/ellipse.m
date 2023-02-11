function ellipse(n,C,x,rho,sigma)

% Plots the theoretical ellipse for a system whose eigenvalues follow the elliptical distribution. 

a=sigma*sqrt(n*C)*(1+rho); % horizontal radius
b=sigma*sqrt(n*C)*(1-rho); % vertical radius
x0=x;                      % x0,y0 ellipse centre coordinates
y0=0;
t=-pi:0.01:pi;
x=x0+a*cos(t);
y=y0+b*sin(t);
plot(x,y)