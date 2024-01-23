clear;
x1_values = linspace(-5, 5, 1000);
x2_values = linspace(-5, 5, 1000);

[X, Y] = meshgrid(x1_values, x2_values);
x1_vector = reshape(X, [], 1);
x2_vector = reshape(Y, [], 1);
Z = Ackley([x1_vector, x2_vector]);

% Przekształć wektor Z z powrotem na macierz
Z_matrix = reshape(Z, size(X));

% Narysuj wykres funkcji Ackley
figure;
surf(X, Y, Z_matrix, 'EdgeColor', 'none');
title('Funkcja Ackleya');
xlabel('x_{2}');
ylabel('x_{1}');
zlabel('Wartośc funckji Ackleya');
colormap('parula');
colorbar;
% matlab2tikz ('Ackley_3d.tex' , 'showInfo' , false)
% exportgraphics(figure, 'output.pdf', 'Append', true);
% saveas(gcf,'Ackley_3d.pdf')
 set(gcf,'papersize',[16 12]);
print(gcf,'Ackley_3d.pdf','-dpdf', '-bestfit', '-r400')
% Narysuj wykres funkcji Ackley
figure;
contourf(X, Y, Z_matrix);
title('Funkcja Ackleya');
xlabel('x_{2}');
ylabel('x_{1}');
zlabel('Wartośc funckji Ackleya');
colormap('parula');
colorbar;
% matlab2tikz ('Ackley_3d.tex' , 'showInfo' , false)
% exportgraphics(figure, 'output.pdf', 'Append', true);
 set(gcf,'papersize',[16 12]);
print(gcf,'Ackley_poz.pdf','-dpdf', '-bestfit', '-r400')
Z = Himmelblau([x1_vector, x2_vector]);

% Przekształć wektor Z z powrotem na macierz
Z_matrix = reshape(Z, size(X));
figure;
surf(X, Y, Z_matrix, 'EdgeColor', 'none');
title('Funkcja Himmelblau');
xlabel('x_{1}');
ylabel('x_{2}');
zlabel('Wartość funkcji Himmelblau');
colormap('parula');
colorbar;
% matlab2tikz ('Himmelblau_3d.tex' , 'showInfo' , false)
% set(gcf, 'PaperUnits', 'normalized')
% set(gcf, 'PaperPosition', [0 0 1 1])
 set(gcf,'papersize',[16 12]);
  print(gcf,'Himmelblau_3d.pdf','-dpdf', '-bestfit', '-r400')
% saveas(gcf,'Himmelblau_3d.pdf')

% Przekształć wektor Z z powrotem na macierz
Z_matrix = reshape(Z, size(X));
figure;
contourf(X, Y, Z_matrix);
title('Funkcja Himmelblau');
xlabel('x_{1}');
ylabel('x_{2}');
zlabel('Wartość funkcji Himmelblau');
colormap('parula');
colorbar;
set(gcf,'papersize',[16 12]);
print(gcf,'Himmelblau_poz.pdf','-dpdf', '-bestfit', '-r400')