function A= bivariate_normal(n,rho,x,C,sigma,plots)  

% Plots random matrix whose pair of off diagonal entries M_{ij} and M_{ji} are sampled from a bivariate normal distribution with mean 0, variance 1 and correlation coefficient -2/pi.

A=zeros(n);

for i=1:n
     for j=i:n
     mu = [0 0];             
     Sigma = [sigma^2 rho*sigma^2;rho*sigma^2 sigma^2];     % Covariance matrix, the off diagonal terms represent the covariance
     R = mvnrnd(mu,Sigma);       % R is a vector consisting of a pair of numbers generated from bivariate normal r.v.
        if i==j
        A(i,j)=0;
        else
            H=rand;
            if H<C
        A(i,j)=R(1);
        A(j,i)=R(2);
            else
            end
            
        end
     end
end
A(1:(n+1):end)=x;
assignin('base','A',A)
if plots==0
return;

elseif plots==1

d=eig(A);
i=imag(d);
j=real(d);
plot(j,i,'o');
hold on
ellipse(n,C,x,rho,sigma)                % Plots the ellipse corresponding to n centred at the origin
end

c = 1;