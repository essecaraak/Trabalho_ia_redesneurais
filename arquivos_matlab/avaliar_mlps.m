function avaliar_mlps(mlps, dados_teste, classes_teste,nomearquivo)
    
    resultados_acuracia = 0;

    % Criar um arquivo para salvar os resultados
    fileID = fopen(nomearquivo, 'w');

    for i = 1:length(mlps)
        mlp = mlps{i};
        
        % Obter as saídas da MLP para o conjunto de teste
        predicoes = mlp(dados_teste');

        classes_preditas = round(predicoes);

        % Calcular a acurácia do teste
        acuracia = sum(classes_preditas' == classes_teste) / length(classes_teste) * 100;


        % Salvar os parâmetros da MLP e os resultados dos testes no arquivo
        fprintf(fileID, 'iteração %d:\n', i);
        fprintf(fileID, 'Rede Neural :\n');
        fprintf(fileID, 'Camadas de neurônios: %s\n', formatar_camadas(mlp.layers));
        fprintf(fileID, 'Taxa de aprendizado: %f\n', mlp.trainParam.lr);
        fprintf(fileID, 'Momentum: %f\n', mlp.trainParam.mc);
        fprintf(fileID, 'Percentual de acerto desejado: %f\n', (1 - mlp.trainParam.goal) * 100);
        fprintf(fileID, 'Acurácia do teste: %f\n', acuracia);
        fprintf(fileID, '\n');

        resultados_acuracia = resultados_acuracia + acuracia;
    end

    % Calcular a média de desempenho e salvar no arquivo
    media_desempenho = resultados_acuracia/length(mlps);
    fprintf(fileID, 'Média de desempenho: %f\n', media_desempenho);

    % Fechar o arquivo após os testes
    fclose(fileID);
end

function str_camadas = formatar_camadas(layers)
    num_camadas = length(layers);
    str_camadas = '[';
    for i = 1:num_camadas
        if num_camadas == 1 && layers{1}.size == 1
            str_camadas = '1';
        end
        num_neuronios = layers{i}.size;
        str_camadas = [str_camadas, num2str(num_neuronios)];
        if i < num_camadas
            str_camadas = [str_camadas, ', '];
        end
    end
    str_camadas = [str_camadas, ']'];
end
