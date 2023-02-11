function outlierEIG_rho_dependent_maxmindiff(n,sigma,C,Nrealz)



outlierEIG=zeros(Nrealz,1);
meanOUTLIER=zeros(1,21);
rho=(-1:0.1:1);
err=zeros(1,21);
minXstar=zeros(1,Nrealz);
meanminXstar=zeros(1,21);
errminXstar=zeros(1,21);
eigMaxNrealz=zeros(1,Nrealz);

for j=1:21

for i=1:Nrealz
outlierEIG(i)=eig_plot_normal_Xdependent_outlier(n,rho(j),sigma,C);
minXstar(i)=minX;
eigMaxNrealz(i)=eigMax;
end


err(j)=max(eigMaxNrealz)-min(eigMaxNrealz);
meanOUTLIER(j)=mean(outlierEIG);


meanminXstar(j)=mean(minXstar);
errminXstar(j)=std(minXstar);

fprintf('Processing %d...',j);
end



plot(rho,meanOUTLIER,'*')
hold on
errorbar(rho,meanOUTLIER,err,'blue')

assignin('base','meanminXstar',meanminXstar)
assignin('base','errminXstar',errminXstar)