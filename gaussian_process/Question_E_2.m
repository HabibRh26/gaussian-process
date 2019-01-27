% Answer for Question E
% single covSEard

load('cw1e.mat')

X_t = linspace(-10, 10, 100);
Y_t = linspace(-10, 10, 100);
[X1,X2]=meshgrid(X_t',Y_t');
 
X =  [X1(:),X2(:)];

meanfunc = @meanZero;
covfunc = @covSEard; 
likfunc = @likGauss;

hyp = struct('mean', [], 'cov', 0.1*randn(3,1), 'lik', 0);
hyp = minimize(hyp, @gp, -200, @infGaussLik, meanfunc, covfunc, likfunc, x, y);
[mu s2] = gp(hyp, @infGaussLik, [], covfunc, likfunc, x, y, X);

surf(X1,X2,reshape(mu+2*sqrt(s2),size(X1)));
hold on; surf(X1,X2,reshape(mu-2*sqrt(s2),size(X1)));

set(gca,'fontsize',17);
xlabel('Input X1', 'FontSize', 17,'FontWeight','bold');
ylabel('Input X2', 'FontSize', 17,'FontWeight','bold');
zlabel('Output Y', 'FontSize', 17,'FontWeight','bold');
title('@covSEard')

ticks = linspace(-10,10,5)';
xticks(ticks); yticks(ticks); zticks([-4, -2, 0, 2, 4])
axis([-10 10 -10 10 -4 4]);