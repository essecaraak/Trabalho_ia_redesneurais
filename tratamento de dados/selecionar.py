import pandas as pd
import numpy as np

# Carregar dados normalizados
dataframe = pd.read_excel("dados_normalizados.xlsx")
dataframe.apply(pd.to_numeric, errors='coerce')

# Analisar a significância das variáveis
estatisticas = pd.read_excel("teste_significancia.xlsx")
variaveis_significantes = set(estatisticas[estatisticas['Média (Classe 0)'] != estatisticas['Média (Classe 1)']]['Variável'])

# Analisar a correlação entre as variáveis
novo_dataframe = pd.read_excel("dados_correlacionados.xlsx", index_col=0)
matriz_correlacao = novo_dataframe.iloc[:-1, :-1]
variaveis_correlacionadas = set()

for i in range(len(matriz_correlacao.columns)):
    for j in range(i+1, len(matriz_correlacao.columns)):
        if abs(matriz_correlacao.iloc[i, j]) > 0.7:  # limiar de correlação
            variaveis_correlacionadas.add(matriz_correlacao.columns[j])

# Descartar as variáveis que não conseguem discriminar entre as classes
variaveis_nao_discriminantes = set()
for variavel in variaveis_significantes:
    classe_0_media = estatisticas.loc[estatisticas['Variável'] == variavel, 'Média (Classe 0)'].values[0]
    classe_1_media = estatisticas.loc[estatisticas['Variável'] == variavel, 'Média (Classe 1)'].values[0]
    if np.isclose(classe_0_media, classe_1_media):
        variaveis_nao_discriminantes.add(variavel)

# Descartar as variáveis com alta correlação e as que não discriminam entre as classes
variaveis_selecionadas = list(variaveis_significantes - variaveis_correlacionadas - variaveis_nao_discriminantes)

# Imprimir as variáveis selecionadas
print("Variáveis selecionadas:")
for variavel in variaveis_selecionadas:
    print(variavel)

# Criar um novo DataFrame apenas com as variáveis selecionadas
novo_dataframe = dataframe[variaveis_selecionadas]

