% current_path = pwd;
% folder_path = [current_path '/Fotos Memoria/Capítulo 3/'];
% file_name = 'n2_muestra_error.pdf';
% full_file_path = fullfile(folder_path, file_name);
exportgraphics(gcf, 'x.PDF', 'Resolution', 300);