function mlps = treinar_mlps(mlps, dados_treinamento, classes_treinamento)
    

    for i = 1:length(mlps)
        mlp = mlps{i};

        % Embaralhe os dados de treinamento antes de treinar a rede
        indices_embaralhados = randperm(size(dados_treinamento, 1));
        dados_treinamento_embaralhados = dados_treinamento(indices_embaralhados, :);
        classes_treinamento_embaralhadas = classes_treinamento(indices_embaralhados);

        % Treine a MLP com o conjunto de dados de treinamento embaralhado
        mlps{i} = train(mlp, dados_treinamento_embaralhados', classes_treinamento_embaralhadas');

       
    end

   
end
