% Script para cargar un modelo de ML y predecir el punto de equilibrio
clear
clc

% =========================================================
% 1. Cargar el modelo entrenado
% =========================================================
% Asegúrate de que el archivo 'modelo_mecanico.mat' esté en el mismo directorio
% o en la ruta de MATLAB.
try
    load('modelo_mecanico.mat');
    disp('Modelo cargado exitosamente.');
catch
    error('No se pudo encontrar el archivo del modelo. Asegúrate de que el archivo "modelo_mecanico.mat" esté en la ruta.');
end

% El modelo se carga en una variable con el nombre que usaste para guardarlo,
% en este caso, 'modelo_meca1'.

% =========================================================
% 2. Crear nuevos datos para la predicción
% =========================================================
% Crea una tabla con los nuevos datos que quieres predecir.
% Es CRUCIAL que los nombres de las columnas coincidan con los que usaste
% para entrenar el modelo.
% % Ejemplo: prediciendo el punto de equilibrio para una nueva configuración
% nueva_masa = 3;         % Masa de 2.5 kg
% nuevo_amortiguamiento = 1.4; % Coeficiente de amortiguamiento de 1.0
% nueva_rigidez = 8;       % Constante del resorte de 7.0 N/m
% nueva_fuerza = 1.8;         % Fuerza de 1.5 N
nueva_masa = 0.5;         % Masa de 2.5 kg
nuevo_amortiguamiento = 0.3367; % Coeficiente de amortiguamiento de 1.0
nueva_rigidez = 3.9756;       % Constante del resorte de 7.0 N/m
nueva_fuerza = 1.9665;         % Fuerza de 1.5 N

% Crear la tabla de nuevos datos.
% La variable debe ser del tipo 'table'.
nueva_configuracion = table(nueva_masa, nuevo_amortiguamiento, ...
                            nueva_rigidez, nueva_fuerza, ...
                            'VariableNames', {'masa_m', 'amortiguamiento_c', 'rigidez_k', 'fuerza_F'});

disp('----------------------------------------------------');
disp('Nueva configuración para la predicción:');
disp(nueva_configuracion);

% =========================================================
% 3. Realizar la predicción
% =========================================================
% Usamos la función 'predictFcn' del modelo para obtener la predicción.
prediccion_ML = modelo_meca1.predictFcn(nueva_configuracion);

% =========================================================
% 4. Mostrar el resultado
% =========================================================
disp('----------------------------------------------------');
fprintf('La predicción del modelo de ML para el punto de equilibrio es: %.4f metros\n', prediccion_ML);

% =========================================================
% 5. (Opcional) Comparar con el cálculo analítico
% =========================================================
% Para verificar la precisión del modelo, comparamos con la fórmula
% analítica que usamos para generar el dataset.
x_eq_analitico = nueva_fuerza / nueva_rigidez;
fprintf('El valor analítico (real) del punto de equilibrio es: %.4f metros\n', x_eq_analitico);