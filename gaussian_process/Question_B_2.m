% Answer for Question B
% The following code creates a contour plot of negative log marginal 
% likelihood. The contour plot shows that there are more than one local
% optima. The global optimum may not be reached depending on the initial
% condition.

xx = linspace(-4,4,100);
yy = linspace(-4,1,100);

Z = zeros(length(xx),length(yy));

for i = 1:length(xx)
    for j = 1:length(yy)
              
    meanfunc = [];                    
    covfunc = @covSEiso;              
    likfunc = @likGauss;              

    hyp = struct('mean', [], 'cov', [xx(i) 0], 'lik', yy(j));
    
    [nlZ, dnlZ] = gp(hyp, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
    
    Z(j,i) = min(log(nlZ),5);
        
    end
end

figure
contourf(xx,yy,Z,15)
colormap(hot)

minMatrix1 = min(Z(:));
[row1,col1] = find(Z==minMatrix1);

minMatrix2 = min(min(Z(:,50:100)));
[row2,col2] = find(Z==minMatrix2);

hold on; plot(xx(col1), yy(row1), '+w', 'LineWidth', 1.0); 
plot(xx(col2), yy(row2), '+k', 'LineWidth', 1.0);

set(gca,'fontsize',17);
xlabel('Characteristic Lengthscale (log scale)', 'FontSize', 17,'FontWeight','bold');
ylabel('Noise Standard Deviation (log scale)', 'FontSize', 17,'FontWeight','bold');
