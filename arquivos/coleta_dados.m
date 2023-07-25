format long
% Carregar os dados do Excel e selecionar as colunas relevantes
dados = readtable('dados_normalizados.xlsx');
variaveis = dados(:, [1, 2, 3, 4, 6, 7,13]);
classes = dados(:, 15);

% Converter a tabela para um array
variaveis = table2array(variaveis);
classes = table2array(classes);

% Separar os dados em conjunto de treinamento e conjunto de teste
pct_treinamento = 0.7;  % Porcentagem de dados para o conjunto de treinamento
indices_treinamento = randperm(size(variaveis, 1), round(pct_treinamento * size(variaveis, 1)));
indices_teste = setdiff(1:size(variaveis, 1), indices_treinamento);

dados_treinamento = variaveis(indices_treinamento, :);
classes_treinamento = classes(indices_treinamento);
dados_teste = variaveis(indices_teste, :);
classes_teste = classes(indices_teste);


% Salvar os dados em um arquivo .mat
save('indices_treinamento.mat', 'indices_treinamento');
save('indices_teste.mat', 'indices_teste');
save('dados_treinamento.mat', 'dados_treinamento');
save('dados_teste.mat', 'dados_teste');
save('classes_treinamento.mat', 'classes_treinamento');
save('classes_teste.mat', 'classes_teste');












