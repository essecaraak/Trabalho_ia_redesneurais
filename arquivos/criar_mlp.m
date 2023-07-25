function mlp = criar_mlp(neuronios_por_camada, taxa_aprendizado, momentum, percentual_acerto_desejado)


    % Criação da MLP usando a função padrão da Neural Network Toolbox
    mlp = feedforwardnet(neuronios_por_camada, 'traingdx');
    mlp.trainParam.lr = taxa_aprendizado;
    mlp.trainParam.mc = momentum;
    mlp.trainParam.goal = (100 - percentual_acerto_desejado) / 100;  % Critério de parada baseado no percentual de acertos desejado
end