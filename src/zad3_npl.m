% Parametry algorytmu PSO
S = 50;            % liczba cząstek
n = 3;             % liczba wymiarów
b_lo = [0 0 0];         % dolne ograniczenie dla każdego wymiaru
b_up = [50 15 30];          % górne ograniczenie dla każdego wymiaru
term_criteria = 300; % kryterium zakończenia
w =0.6;           % waga inercji
fi_p = 1.7;          % współczynnik osobistej najlepszej pozycji
fi_g = 1.8;          % współczynnik globalnej najlepszej pozycji
func = @npl_function;
% Wywołanie funkcji PSO z funkcją celu Ackley
result = PSO(S, n, b_lo, b_up, func, term_criteria, w, fi_p, fi_g);

% Wyświetlenie wyników
disp('Znalezione minimum:');
disp(result);
disp('Wartość funkcji celu w znalezionym minimum:');



for i=1:size(result,1)
    npl_function(result(i,:))
end