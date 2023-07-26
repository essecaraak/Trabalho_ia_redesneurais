
import pandas as pd
import numpy as np


dataframe =pd.read_excel("tratamento de dados/dados.xlsx")
dataframe.apply(pd.to_numeric, errors='coerce')

novo_dataframe = dataframe.copy()  # Cria uma cópia do dataframe original
    
for coluna in novo_dataframe.columns:
    media_coluna = novo_dataframe[coluna].mean()  # Calcula a média da coluna
        
        # Preenche os valores vazios da coluna com a média
    novo_dataframe[coluna].fillna(media_coluna, inplace=True)
    novo_dataframe[coluna] = np.where(novo_dataframe[coluna] < 0, media_coluna, novo_dataframe[coluna])
novo_dataframe.to_excel('dados_semcolunasvazias.xlsx', index=False)