save('todas_as_redes.mat','mlpstotal');
load('dados_teste.mat', 'dados_teste');
load('classes_teste.mat', 'classes_teste');
mlpsteste=mlpstotal;
melhores=cell(10, 1);
for i =1:10
    melhores{i}=coletar_melhor_rede(mlpsteste, dados_teste, classes_teste); 
    indices_remover = false(size(mlpsteste));
    for j = 1:length(mlpsteste)
        indices_remover(j) = isequal(mlpsteste{j}, melhores{i});
    end
    mlpsteste = mlpsteste(~indices_remover);
    
end 

avaliar_mlps(melhores, dados_teste, classes_teste,'10_melhores_redes')