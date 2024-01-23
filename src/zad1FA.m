% Definiowanie parametrów
S = 50; % Liczba świetlików
n = 2;  % Liczba zmiennych w funkcji celu
b_lo = [-5 -5]; % Dolne ograniczenie zmiennych
b_up = [5 5];  % Górne ograniczenie zmiennych
term_criteria = 400; % Kryterium zakończenia
gamma = 0.12; % Parametr gamma dla funkcji atrakcyjności
alpha = 0.01;
func = @Himmelblau;
result = FA(S, n, b_lo, b_up, func, term_criteria, gamma,alpha);
% Wyświetlenie wyników
disp('Znalezione minimum:');
disp(result);
disp('Wartość funkcji celu w znalezionym minimum:');
func(result);% Parametry algorytmu PSO
x1_values = linspace(-5, 5, 1000);
x2_values = linspace(-5, 5, 1000);

[X, Y] = meshgrid(x1_values, x2_values);
x1_vector = reshape(X, [], 1);
x2_vector = reshape(Y, [], 1);
Z = func([x1_vector, x2_vector]);

% Przekształć wektor Z z powrotem na macierz
Z_matrix = reshape(Z, size(X));
%% 3d
figure;
h = surf(X, Y, Z_matrix);
set(h,'LineStyle','none')
title(['Funkcja ', func_name]);
xlabel('x_{2}');
ylabel('x_{1}');
zlabel(['Wartośc funckji ',func_name]);
colormap('parula'); % You can choose any colormap you prefer
colorbar;
hold on
scatter3(result(:, 1), result(:, 2), func(result(:,:)), 'r', 'filled');
set(gcf,'papersize',[16 12]);
print(gcf,[func_name,'_fa_3d_3.pdf'],'-dpdf', '-bestfit', '-r400')
%% poz
figure;
contourf(X, Y, Z_matrix);
set(h,'LineStyle','none')
title(['Funkcja ', func_name]);
xlabel('x_{2}');
ylabel('x_{1}');
zlabel(['Wartośc funckji ',func_name]);
colormap('parula'); % You can choose any colormap you prefer
colorbar;
hold on
scatter3(result(:, 1), result(:, 2), func(result(:,:)), 'r', 'filled');
set(gcf,'papersize',[16 12]);
print(gcf,[func_name,'_fa_poz_3.pdf'],'-dpdf', '-bestfit', '-r400')