% Answer for Question B

xs = linspace(-3, 3, 1000)';      

meanfunc = [];                    
covfunc = @covSEiso;              
likfunc = @likGauss;              

hyp = struct('mean', [], 'cov', [0 0], 'lik', 0);

hyp2 = minimize(hyp, @gp, -200, @infGaussLik, meanfunc, covfunc, likfunc, x, y);

hyp2

[nlZ, dnlZ] = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y);

[mu s2] = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y, xs);

f = [mu+2*sqrt(s2); flipdim(mu-2*sqrt(s2),1)];
fill([xs; flipdim(xs,1)], f, [7 7 7]/8)
hold on; plot(xs, mu, 'Color', 'k', 'LineWidth', 1.0); plot(x, y, 'ob', 'MarkerFaceColor', 'b', 'MarkerSize', 5)

set(gca,'fontsize',17);
xlabel('Input X', 'FontSize', 17,'FontWeight','bold');
ylabel('Output Y', 'FontSize', 17,'FontWeight','bold');