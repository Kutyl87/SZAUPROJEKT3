clear;
x1_values = linspace(-5,5,1000);
x2_values = linspace(-5,5,1000);
[X, Y] = meshgrid(x1_values, x2_values);

%% Ackley
Z = Ackley(X, Y);
figure;
h = surf(X, Y, Z);
set(h,'LineStyle','none')
title('Ackley Function');
xlabel('X1');
ylabel('X2');
zlabel('Ackley Value');
colormap('parula'); % You can choose any colormap you prefer
colorbar;

%% Himmelbau
Z = Himmelbau(X, Y);
figure;
h = surf(X, Y, Z);
set(h,'LineStyle','none')
title('Himmelbau Function');
xlabel('X1');
ylabel('X2');
zlabel('Ackley Value');
colormap('parula'); % You can choose any colormap you prefer
colorbar;