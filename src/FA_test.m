% Definiowanie parametrów
S = 180; % Liczba świetlików
n = 2;  % Liczba zmiennych w funkcji celu
b_lo = -5; % Dolne ograniczenie zmiennych
b_up = 5;  % Górne ograniczenie zmiennych
term_criteria = 1000; % Kryterium zakończenia
gamma = 0.1; % Parametr gamma dla funkcji atrakcyjności
func = @Himmelbau;
result = FA(S, n, b_lo, b_up, func, term_criteria, gamma);
% Wyświetlenie wyników
disp('Znalezione minimum:');
disp(result);
disp('Wartość funkcji celu w znalezionym minimum:');
Ackley(result(:,1)',result(:,2)');% Parametry algorytmu PSO
x1_values = linspace(-5,5,1000);
x2_values = linspace(-5,5,1000);
[X, Y] = meshgrid(x1_values, x2_values);
%% Ackley
Z = func(X, Y);
figure;
h = surf(X, Y, Z);
set(h,'LineStyle','none')
title('Ackley Function');
xlabel('X1');
ylabel('X2');
zlabel('Ackley Value');
colormap('parula'); % You can choose any colormap you prefer
colorbar;
hold on
scatter3(result(:, 1), result(:, 2), func(result(:, 1)', result(:, 2)'), 'r', 'filled');