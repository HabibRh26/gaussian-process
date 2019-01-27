% Answer for Question C
% The following code plots the data (both training and test) on a single 
% period 

xs = linspace(0, 1, 1000)';       

meanfunc = [];                    
covfunc = @covPeriodic;           
likfunc = @likGauss;              

x2 = mod(x,0.9989)

hyp = struct('mean', [], 'cov', [0.0702 -0.0011 0.2210], 'lik', -2.2122);

[mu s2] = gp(hyp, @infGaussLik, meanfunc, covfunc, likfunc, x2, y, xs);

f = [mu+2*sqrt(s2); flipdim(mu-2*sqrt(s2),1)];
fill([xs; flipdim(xs,1)], f, [7 7 7]/8)
hold on; plot(xs, mu, 'Color', 'k', 'LineWidth', 1.0); plot(x2, y, 'ob', 'MarkerFaceColor', 'b', 'MarkerSize', 5)


set(gca,'fontsize',17);
xlabel('X mod p', 'FontSize', 17,'FontWeight','bold');
ylabel('Output Y', 'FontSize', 17,'FontWeight','bold');