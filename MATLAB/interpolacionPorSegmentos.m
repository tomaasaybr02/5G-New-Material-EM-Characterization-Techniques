function y_interp = interpolacionPorSegmentos(x, y, n_subconjunto, orden)
    % Esta función realiza la interpolación de Lagrange tomando un
    % subconjunto de los datos y extrapolando a todo el conjunto.
    % x: puntos conocidos (frecuencia)
    % y: valores conocidos (parámetro)
    % n_subconjunto: número de puntos en el subconjunto
    % orden: orden del polinomio de Lagrange
    
    % Seleccionar un subconjunto representativo
    indices_subconjunto = round(linspace(1, length(x), n_subconjunto));
    x_subconjunto = x(indices_subconjunto);
    y_subconjunto = y(indices_subconjunto);
    
    % Realizar la interpolación en todo el rango de x
    y_interp = interpolacionLagrange(x_subconjunto, y_subconjunto, x, orden);
end