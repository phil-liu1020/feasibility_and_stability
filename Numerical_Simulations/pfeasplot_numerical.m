 function pfeasplot_numerical(n,rho,C,c,sigmaL,sigmaGridp)

% Plots the feasibility probability against \gamma=\sigma\sqrt{nC}
% numerically by calculating P_{feas} from a sample of X* for each given \gamma.
% c is the competition strength
% C is the connection probability, n the community size and \rho the correlation coefficient
% Set pstabplott=1 if you want to plot proabbility of stability given that
% the system is feasible
% WARNING!!! pstabplott ONLY WORKS FOR N=3

%sigmaL is the length of the interval in sigma. sigmaGridp is the gridpoint
%size in sigma

pSTAB=zeros(10,1);
gamma=sqrt((n-1)*C)*(sigmaGridp:sigmaGridp:sigmaL);
pfeas=zeros(1,sigmaL/sigmaGridp);

tic
for i=1:sigmaL/sigmaGridp
    
   if rho==0
   tic
   X=  normalAij(n,sigmaGridp*i,c,C,10000);
   pfeas(i)=prob_feasibility(X);                                               
   toc
   else
   tic
   X= fp_bivariate_normalAij_10000realisations(n,rho,C,sigmaGridp*i,10000);
   pfeas(i)=prob_feasibility(X);
   fprintf('Processing %d of %d...',i,sigmaL/sigmaGridp);
   toc
   end

end
assignin('base','pSTAB',pSTAB)
assignin('base','pfeas',pfeas)

plot(gamma,pfeas,'*',...
                'MarkerEdgeColor','g',...
                'MarkerFaceColor','g',...
                'MarkerSize',5)
            if rho ~=0
hold on


xlabel('\gamma')
ylabel('P_{feas}')
            else
            end
     toc       
       
%%% Use code template below for plotting extra points if I haven't plotted enough points.
%for i=1:8
%X= fp_bivariate_normalAij_10000realisations(3,-0.9,1,0.05*(i+17),10000);
%pfeas(i)=prob_feasibility(X);
%end
%plot(sqrt(3)*(0.9:0.05:1.25),pfeas,'go')
            
 