% Answer for Question C
% The following code runs normality test on the residual

meanfunc = [];                    
covfunc = @covPeriodic;           
likfunc = @likGauss;              

hyp = struct('mean', [], 'cov', [0.0702 -0.0011 0.2210], 'lik', -2.2122);

[y_pred, s2] = gp(hyp, @infGaussLik, meanfunc, covfunc, likfunc, x, y, x);

y_resid = zeros(size(y));

for i=1:length(y_resid)

    y_resid(i) = y(i)-y_pred(i);
    
end 

y_resid_std = std(y_resid)

for i=1:length(y_resid)

    y_resid(i) = y_resid(i)/y_resid_std;
    
end 

figure
ax1 = subplot(1,2,1);

[f,x_values] = ecdf(y_resid);
F = plot(ax1, x_values,f,'b-');
set(F,'LineWidth',2);
hold on;
G = plot(ax1, x_values,normcdf(x_values,0,1),'r-');
set(G,'LineWidth',2);
legend([F G],...
       'Empirical CDF','Standard Normal CDF',...
       'Location','SE');
   
set(gca,'fontsize',17);
xlim([-2.5,2.5])
xlabel('Normalised Residual', 'FontSize', 17,'FontWeight','bold');
ylabel('Cumulative Fraction', 'FontSize', 17,'FontWeight','bold');   
   
ax2 = subplot(1,2,2);
plot(ax2, x, y_resid, '*');

set(gca,'fontsize',17);
xlim([-2.5,2.5])
xlabel('Input X', 'FontSize', 17,'FontWeight','bold');
ylabel('Normalised Residual', 'FontSize', 17,'FontWeight','bold');

   
[h, p] = kstest(y_resid)

%%%

%x_normal = linspace(-4, 4, 1000)';
%y_normal = normpdf(x_normal, 0, 1); 

%figure;

%histogram(y_error, 7, 'Normalization', 'probability');
%hold on; plot(x_normal,y_normal)

%set(gca,'fontsize',17);
%xlabel('Input X', 'FontSize', 17,'FontWeight','bold');
%ylabel('Output Y', 'FontSize', 17,'FontWeight','bold');