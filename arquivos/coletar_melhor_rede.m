function melhormlp =coletar_melhor_rede(mlpstotal, dados_teste, classes_teste)
melhoracuracia=0;
melhormlp=mlpstotal{1};

for i = 1:length(mlpstotal)
        mlp = mlpstotal{i};
     
        % Obter as saídas da MLP para o conjunto de teste
        predicoes = mlp(dados_teste');
        classes_preditas = round(predicoes);

        % Calcular a acurácia do teste
        acuracia = sum(classes_preditas' == classes_teste) / length(classes_teste) * 100;
        if acuracia > melhoracuracia
            melhoracuracia=acuracia;
            melhormlp=mlp;
        end
            
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
end