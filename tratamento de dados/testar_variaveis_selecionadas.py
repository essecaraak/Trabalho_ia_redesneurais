import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import norm

# Carregar dados selecionados
dataframe = pd.read_excel("tratamento de dados/dados_selecionados.xlsx")
dataframe.apply(pd.to_numeric, errors='coerce')

# Selecionar as colunas de classe e variáveis
classe = dataframe.columns[-1]
variaveis = dataframe.columns[:-1]

for variavel in variaveis:
    dados_classe0 = dataframe[dataframe[classe] == 0][variavel]
    dados_classe1 = dataframe[dataframe[classe] == 1][variavel]

    media_classe0 = dados_classe0.mean()
    desvio_padrao_classe0 = dados_classe0.std()
    media_classe1 = dados_classe1.mean()
    desvio_padrao_classe1 = dados_classe1.std()

    # Plotar curvas gaussianas
    plt.figure()
    plt.hist(dados_classe0, density=True, alpha=0.5, label='Classe 0')
    plt.hist(dados_classe1, density=True, alpha=0.5, label='Classe 1')

    x = np.linspace(min(dataframe[variavel]), max(dataframe[variavel]), 100)
    y_classe0 = norm.pdf(x, media_classe0, desvio_padrao_classe0)
    y_classe1 = norm.pdf(x, media_classe1, desvio_padrao_classe1)

    plt.xlabel(variavel)
    plt.ylabel('Densidade')
    plt.legend()

    plt.show()
