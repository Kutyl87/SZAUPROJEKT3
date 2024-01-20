% Definiowanie parametrów
S = 40; % Liczba świetlików
n = 3;  % Liczba zmiennych w funkcji celu
b_lo = [0 0 0]; % Dolne ograniczenie zmiennych
b_up = [10 10 10];  % Górne ograniczenie zmiennych
term_criteria = 1000; % Kryterium zakończenia
gamma = 0.9; % Parametr gamma dla funkcji atrakcyjności
func = @pid_function;
result = FA(S, n, b_lo, b_up, func, term_criteria, gamma);
% Wyświetlenie wyników
disp('Znalezione minimum:');
disp(result);
disp('Wartość funkcji celu w znalezionym minimum:');
func(result);% Parametry algorytmu PSO