% Answer for Question A
% load cw1a.mat before running this code

xs = linspace(-3, 3, 1000)';      % test inputs 

meanfunc = @meanZero;             % zero mean function
covfunc = @covSEiso;              % Squared Exponental covariance function
likfunc = @likGauss;              % Gaussian likelihood

% initial values for the log hyperparameters
hyp = struct('mean', [], 'cov', [-1 0], 'lik', 0);

% minimize the negative log likelihood
hyp2 = minimize(hyp, @gp, -200, @infGaussLik, meanfunc, covfunc, likfunc, x, y);

hyp2

[mu s2] = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y, xs);

% plot the 95% error bar for the test data
f = [mu+2*sqrt(s2); flipdim(mu-2*sqrt(s2),1)];
fill([xs; flipdim(xs,1)], f, [7 7 7]/8);

% plot the mean values for the test data
% plot the training data
hold on; plot(xs, mu, 'Color', 'k', 'LineWidth', 1.0); plot(x, y, 'ob', 'MarkerFaceColor', 'b', 'MarkerSize', 5)

set(gca,'fontsize',17);
xlabel('Input x_*', 'FontSize', 17,'FontWeight','bold');
ylabel('Output y_*', 'FontSize', 17,'FontWeight','bold');