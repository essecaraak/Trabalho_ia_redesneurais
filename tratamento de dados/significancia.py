import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import norm

dataframe = pd.read_excel("tratamento de dados/dados_normalizados.xlsx")
dataframe.apply(pd.to_numeric, errors='coerce')

variaveis = dataframe.columns[:-1]  # Seleciona todas as colunas, exceto a última (classe)
classe = dataframe.columns[-1]  # Seleciona a última coluna (classe)

estatisticas = pd.DataFrame(columns=['Variável', 'Média (Classe 0)', 'Desvio Padrão (Classe 0)',
                                     'Média (Classe 1)', 'Desvio Padrão (Classe 1)'])

for variavel in variaveis:
    dados_classe0 = dataframe[dataframe[classe] == 0][variavel]
    dados_classe1 = dataframe[dataframe[classe] == 1][variavel]

    media_classe0 = dados_classe0.mean()
    desvio_padrao_classe0 = dados_classe0.std()
    media_classe1 = dados_classe1.mean()
    desvio_padrao_classe1 = dados_classe1.std()

    estatisticas = estatisticas._append({'Variável': variavel,
                                        'Média (Classe 0)': media_classe0,
                                        'Desvio Padrão (Classe 0)': desvio_padrao_classe0,
                                        'Média (Classe 1)': media_classe1,
                                        'Desvio Padrão (Classe 1)': desvio_padrao_classe1},
                                       ignore_index=True)

    # Plotar curvas gaussianas
    plt.figure()
    plt.hist(dados_classe0, density=True, alpha=0.5, label='Classe 0')
    plt.hist(dados_classe1, density=True, alpha=0.5, label='Classe 1')

    x = np.linspace(min(dataframe[variavel]), max(dataframe[variavel]), 100)
    y_classe0 = norm.pdf(x, media_classe0, desvio_padrao_classe0)
    y_classe1 = norm.pdf(x, media_classe1, desvio_padrao_classe1)
    plt.plot(x, y_classe0, label='Curva Gaussiana (Classe 0)')
    plt.plot(x, y_classe1, label='Curva Gaussiana (Classe 1)')

    plt.xlabel(variavel)
    plt.ylabel('Densidade')
    plt.legend()

    plt.show()

estatisticas.to_excel('testesignificancia.xlsx', index=True)
