% Answer for Question D
% The following code provides visual comparison between the three 
% covariance functions

x = linspace(0, 10, 1000);
y_tot = zeros(size(x)); y_1 = zeros(size(x)); y_2 = zeros(size(x));

A = exp(-0.5); B = 1; C = 1; D = exp(2); E = 1;

for i=1:length(x)

    y_1(i) = C^2*exp((-2/(A^2))*(sin(pi*x(i)/B))^2);
    y_2(i) = E^2*exp(-x(i)^2/(2*D^2));
    y_tot(i) = y_1(i) * y_2(i);
    
end


plot(x,y_tot,'k-', 'LineWidth',2); 
hold on;
plot(x,y_1,'r-', 'LineWidth',1); 
plot(x,y_2,'b-', 'LineWidth',1);



set(gca,'fontsize',17);
legend('@covProd','@covPeriodic','@covSEiso')
xlabel('(x-z)', 'FontSize', 17,'FontWeight','bold');
ylabel('k(x,z)', 'FontSize', 17,'FontWeight','bold');