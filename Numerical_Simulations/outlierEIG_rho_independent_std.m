function outlierEIG_rho_independent_std(n,sigma,C,Nrealz)



outlierEIG=zeros(Nrealz,1);
meanOUTLIER=zeros(1,17);
rho=(-0.8:0.1:0.8);
err=zeros(1,17);

for j=1:17

for i=1:Nrealz
outlierEIG(i)=eig_plot_normal_Xindependent_outlier(n,rho(j),sigma,C);
end

meanOUTLIER(j)=mean(outlierEIG);
err(j)=std(outlierEIG);

fprintf('Processing %d...',j);
end



plot(rho,meanOUTLIER,'*','markerfacecolor','red')
hold on
errorbar(rho,meanOUTLIER,err,'red')