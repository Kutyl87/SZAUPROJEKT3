% Parametry algorytmu PSO
S = 50;            % liczba cząstek
n = 2;             % liczba wymiarów
b_lo = [-5, -5];         % dolne ograniczenie dla każdego wymiaru
b_up = [5,5 ];          % górne ograniczenie dla każdego wymiaru
term_criteria = 150; % kryterium zakończenia
w =0.1;           % waga inercji
fi_p = 1;          % współczynnik osobistej najlepszej pozycji
fi_g = 1.6;          % współczynnik globalnej najlepszej pozycji
func = @Himmelblau;
% Wywołanie funkcji PSO z funkcją celu Ackley
result = PSO(S, n, b_lo, b_up, func, term_criteria, w, fi_p, fi_g);

% Wyświetlenie wyników
disp('Znalezione minimum:');
disp(result);
disp('Wartość funkcji celu w znalezionym minimum:');
func(result(:,:)');% Parametry algorytmu PSO

x1_values = linspace(-5, 5, 1000);
x2_values = linspace(-5, 5, 1000);

[X, Y] = meshgrid(x1_values, x2_values);
x1_vector = reshape(X, [], 1);
x2_vector = reshape(Y, [], 1);
Z = func([x1_vector, x2_vector]);

% Przekształć wektor Z z powrotem na macierz
Z_matrix = reshape(Z, size(X));
func_name = [func2str(func),'a'];
% 3d
figure;
h = surf(X, Y, Z_matrix);
set(h,'LineStyle','none')
title(['Funkcja ', func_name]);
xlabel('x_{2}');
ylabel('x_{1}');
zlabel(['Wartośc funkcji ',func_name]);
colormap('parula'); % You can choose any colormap you prefer
colorbar;
hold on
scatter3(result(:, 1), result(:, 2), func(result(:,:)), 'r', 'filled');
set(gcf,'papersize',[16 12]);
print(gcf,[func_name,'_pso_3d_3.pdf'],'-dpdf', '-bestfit', '-r400')
% print(gcf,'Ackley_pso_3d.pdf','-dpdf', '-bestfit', '-r400')


% poz
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
print(gcf,[func_name,'_pso_poz_3.pdf'],'-dpdf', '-bestfit', '-r400')