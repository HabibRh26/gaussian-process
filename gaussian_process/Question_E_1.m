% Answer for Question E
% The following code visualizes the data "cw1e.mat"

load("cw1e.mat")

surf(reshape(x(:,1),11,11),reshape(x(:,2),11,11),reshape(y,11,11));

contourf(reshape(x(:,1),11,11),reshape(x(:,2),11,11),reshape(y,11,11));

set(gca,'fontsize',17);
xlabel('Input X1', 'FontSize', 17,'FontWeight','bold');
ylabel('Input X2', 'FontSize', 17,'FontWeight','bold');
zlabel('Output Y', 'FontSize', 17,'FontWeight','bold')

