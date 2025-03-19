%{
function y_vals = interpolacionLagrange(x, y, x_eval, n)
    % Inicializar el vector de resultados
    y_vals = zeros(1, length(x_eval));
    
    % Determinar el número de subintervalos
    num_intervals = length(x) - n + 1;
    
    % Iterar sobre cada punto de evaluación
    for k = 1:length(x_eval)
        x_val = x_eval(k);    % Valor actual de x_eval
        y_val = 0;            % Inicializar y_val para este x_eval

        % Encontrar el subintervalo apropiado para x_val
        for interval = 1:num_intervals
            if x_val >= x(interval) && x_val <= x(interval + n - 1)
                % Calcular el valor interpolado para este x_val en el subintervalo
                for i = interval:interval + n - 1
                    L = 1;    % Polinomio de Lagrange para el i-ésimo término
                    for j = interval:interval + n - 1
                        if i ~= j
                            L = L * (x_val - x(j)) / (x(i) - x(j));  % Cálculo del polinomio de Lagrange
                        end
                    end
                    y_val = y_val + y(i) * L;  % Acumula los términos ponderados
                end
                break;
            end
        end

        y_vals(k) = y_val;    % Almacenar el resultado interpolado
    end
end
%}

function y_vals = interpolacionLagrange(x, y, x_eval, n)
    if n > length(x)
        error('El orden del polinomio no puede ser mayor que el número de puntos conocidos.');
    end
    
    % Inicializar el vector de resultados
    y_vals = zeros(1, length(x_eval));
    
    % Iterar sobre cada punto de evaluación
    for k = 1:length(x_eval)
        x_val = x_eval(k);    % Valor actual de x_eval
        y_val = 0;            % Inicializar y_val para este x_eval

        % Calcular el valor interpolado para este x_val
        for i = 1:n
            L = 1;            % Polinomio de Lagrange para el i-ésimo término
            for j = 1:n
                if i ~= j
                    L = L * (x_val - x(j)) / (x(i) - x(j));  % Cálculo del polinomio de Lagrange
                end
            end
            y_val = y_val + y(i) * L;  % Acumula los términos ponderados
        end

        y_vals(k) = y_val;    % Almacenar el resultado interpolado
    end
end

%}
