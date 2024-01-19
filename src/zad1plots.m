clear;
x1_values = linspace(-5, 5, 1000);
x2_values = linspace(-5, 5, 1000);

[X, Y] = meshgrid(x1_values, x2_values);
x1_vector = reshape(X, [], 1);
x2_vector = reshape(Y, [], 1);
Z = Ackley([x1_vector, x2_vector]);

% Przekształć wektor Z z powrotem na macierz
Z_matrix = reshape(Z, size(X));

% Narysuj wykres funkcji Ackley
figure;
surf(X, Y, Z_matrix, 'EdgeColor', 'none');
title('Ackley Function');
xlabel('X1');
ylabel('X2');
zlabel('Ackley Value');
colormap('parula');
colorbar;


Z = Himmelbau([x1_vector, x2_vector]);

% Przekształć wektor Z z powrotem na macierz
Z_matrix = reshape(Z, size(X));
figure;
surf(X, Y, Z_matrix, 'EdgeColor', 'none');
title('Himmelbau Function');
xlabel('X1');
ylabel('X2');
zlabel('Himmelbau Value');
colormap('parula');
colorbar;
