% Definiowanie parametrów
S = 160; % Liczba świetlików
n = 2;  % Liczba zmiennych w funkcji celu
b_lo = [-5 -5]; % Dolne ograniczenie zmiennych
b_up = [5 5];  % Górne ograniczenie zmiennych
term_criteria = 1000; % Kryterium zakończenia
gamma = 0.2; % Parametr gamma dla funkcji atrakcyjności
func = @Ackley;
result = FA(S, n, b_lo, b_up, func, term_criteria, gamma);
% Wyświetlenie wyników
disp('Znalezione minimum:');
disp(result);
disp('Wartość funkcji celu w znalezionym minimum:');
Ackley(result);% Parametry algorytmu PSO
x1_values = linspace(-5, 5, 1000);
x2_values = linspace(-5, 5, 1000);

[X, Y] = meshgrid(x1_values, x2_values);
x1_vector = reshape(X, [], 1);
x2_vector = reshape(Y, [], 1);
Z = func([x1_vector, x2_vector]);

% Przekształć wektor Z z powrotem na macierz
Z_matrix = reshape(Z, size(X));
%% Ackley
figure;
h = surf(X, Y, Z_matrix);
set(h,'LineStyle','none')
title('Ackley Function');
xlabel('X1');
ylabel('X2');
zlabel('Ackley Value');
colormap('parula'); % You can choose any colormap you prefer
colorbar;
hold on
scatter3(result(:, 1), result(:, 2), func(result), 'r', 'filled');