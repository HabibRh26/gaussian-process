% Answer for Question D
% The following code generates data points using covSEiso

x = linspace(-5,5,200)';   

covfunc = {@covSEiso};   
hyp.cov = [2, 0];   

n=200;
K =  feval(covfunc{:}, hyp.cov, x);
K_I = K + 1e-6*eye(200);  %adding a small diagonal matrix
y = chol(K_I)'* gpml_randn(0.5, n, 1);
  
plot(x, y, 'Color', 'b', 'LineWidth', 1.5); 

set(gca,'fontsize',17);