function [x_best] = FA(S,n,b_lo, b_up, func, term_criteria, gamma)
    x = zeros(S,n);
    for i=1:S
        x(i,:) = unifrnd(b_lo,b_up);
    end
    counter = 0;
    while counter < term_criteria
        for i=1:S
            for j=1:i
                if func(x(j, :)) < func(x(j, :)) % Dostosuj do swojej funkcji celu
                    r = norm(x(j, :) - x(i, :)); % Oblicz odległość między świetlikami
                    attractiveness = exp(-gamma * r); % Attrakcyjność zgodnie z formułą
                    x(i, :) = x(i, :) + attractiveness * (x(j, :) - x(i, :)); % Aktualizacja pozycji
                end
            end
        end
        counter = counter + 1;
    end
    % Ostateczne ocenianie rozwiązania
    f_best = func(x(1, :));
    x_best = x(1, :);
    for i = 2:S
        f_current = func(x(i, :));
        if f_current < f_best
            f_best = f_current;
            x_best = x(i, :);
        end
    end
end