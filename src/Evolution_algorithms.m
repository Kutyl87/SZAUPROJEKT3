% Parametry algorytmu PSO
S = 50;            % liczba cząstek
n = 2;             % liczba wymiarów
b_lo = -5;         % dolne ograniczenie dla każdego wymiaru
b_up = 5;          % górne ograniczenie dla każdego wymiaru
term_criteria = 1000; % kryterium zakończenia
w =0.7;           % waga inercji
fi_p = 1.2;          % współczynnik osobistej najlepszej pozycji
fi_g = 1.3;          % współczynnik globalnej najlepszej pozycji
func = @Ackley;
% Wywołanie funkcji PSO z funkcją celu Ackley
result = PSO(S, n, b_lo, b_up, func, term_criteria, w, fi_p, fi_g);

% Wyświetlenie wyników
disp('Znalezione minimum:');
disp(result);
disp('Wartość funkcji celu w znalezionym minimum:');
Ackley(result(:,:)');% Parametry algorytmu PSO

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
scatter3(result(:, 1), result(:, 2), func(result(:,:)), 'r', 'filled');