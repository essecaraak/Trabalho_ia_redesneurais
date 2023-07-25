
import pandas as pd

dataframe =pd.read_excel("dados_semcolunasvazias.xlsx")
novo_dataframe = dataframe.copy()  # Cria uma cópia do dataframe original
    
for coluna in novo_dataframe.columns:
    coluna_min = novo_dataframe[coluna].min()  # Valor mínimo da coluna
    coluna_max = novo_dataframe[coluna].max()  # Valor máximo da coluna
        
        # Aplica a normalização linear na coluna
    novo_dataframe[coluna] = (novo_dataframe[coluna] - coluna_min) / (coluna_max - coluna_min)

novo_dataframe.to_excel('dados_normalizados.xlsx', index=False)