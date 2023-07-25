% Carregar os dados e criar mlps
load('indices_treinamento.mat', 'indices_treinamento');
load('indices_teste.mat', 'indices_teste');
load('dados_treinamento.mat', 'dados_treinamento');
load('dados_teste.mat', 'dados_teste');
load('classes_treinamento.mat', 'classes_treinamento');
load('classes_teste.mat', 'classes_teste');

load('rede_neural(5, 0.04, 0.3, 90).mat', 'mlp1');
load('rede_neural(10, 0.05, 0.4, 95).mat', 'mlp2');
load('rede_neural(6, 0.04, 0.3, 95).mat', 'mlp3');
load('rede_neural(6, 0.03, 0.2, 94).mat', 'mlp4');
load('rede_neural([1,4], 0.03, 0.2, 90).mat', 'mlp5');
load('rede_neural([1,5], 0.05, 0.3, 93).mat', 'mlp6');
% criar mlps
num_redes = 20;
mlps1 = cell(num_redes, 1);
for i = 1:num_redes
   mlps1{i} = mlp1;
end

mlps2 = cell(num_redes, 1);
for i = 1:num_redes
  mlps2{i} = mlp2;
end

mlps3 = cell(num_redes, 1);
for i = 1:num_redes
  mlps3{i} = mlp3;
end
mlps4 = cell(num_redes, 1);
for i = 1:num_redes
  mlps4{i} = mlp4;
end

mlps5 = cell(num_redes, 1);
for i = 1:num_redes
  mlps5{i} = mlp5;
end

mlps6 = cell(num_redes, 1);
for i = 1:num_redes
  mlps6{i} = mlp6;
end
% treinar e testar mlps
mlps1 = treinar_mlps(mlps1, dados_treinamento, classes_treinamento);
avaliar_mlps(mlps1, dados_teste, classes_teste,'resultado_rede1')

mlps2 = treinar_mlps(mlps2, dados_treinamento, classes_treinamento);
avaliar_mlps(mlps2, dados_teste, classes_teste,'resultado_rede2')

mlps3 = treinar_mlps(mlps3, dados_treinamento, classes_treinamento);
avaliar_mlps(mlps3, dados_teste, classes_teste,'resultado_rede3')

mlps4 = treinar_mlps(mlps4, dados_treinamento, classes_treinamento);
avaliar_mlps(mlps4, dados_teste, classes_teste,'resultado_rede4')

mlps5 = treinar_mlps(mlps4, dados_treinamento, classes_treinamento);
avaliar_mlps(mlps5, dados_teste, classes_teste,'resultado_rede5')

mlps6 = treinar_mlps(mlps4, dados_treinamento, classes_treinamento);
avaliar_mlps(mlps6, dados_teste, classes_teste,'resultado_rede6')

mlpstotal = cell(120, 1);
for i = 1:20
  mlpstotal{i} = mlps1{i};
end
for i = 1:20
  mlpstotal{20+i} = mlps2{i};
end
for i = 1:20
  mlpstotal{40+i} = mlps3{i};
end
for i = 1:20
  mlpstotal{60+i} = mlps4{i};
end
for i = 1:20
  mlpstotal{80+i} = mlps5{i};
end
for i = 1:20
  mlpstotal{100+i} = mlps6{i};
end
save('todas_as_redes.mat','mlpstotal');