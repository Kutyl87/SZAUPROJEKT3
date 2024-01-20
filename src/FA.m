function [x_best] = FA(S,n,b_lo, b_up, func, term_criteria, gamma)
    x = zeros(S,n);
    for i=1:S
        x(i,:) = unifrnd(b_lo,b_up);
    end
    counter = 0;

    while counter < term_criteria - 1
        for i = 1:S
            for j = 1:i
                if func(x(j, :)) < func(x(i, :)) % Upewnij się, że to jest problem minimalizacji
                    r = norm(x(j, :) - x(i, :));
                    attractiveness = exp(-gamma * r);
                    x(i, :) = x(i, :) + attractiveness * (x(j, :) - x(i, :));
                end
            end
        end

        % Normalizacja atrakcyjności
        max_attraction = max(attractiveness);
        attractiveness = attractiveness / max_attraction;

        counter = counter + 1;
    end

    % Ostateczna ocena rozwiązań
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
