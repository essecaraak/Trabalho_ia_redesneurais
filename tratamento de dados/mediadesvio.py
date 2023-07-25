import pandas as pd

dataframe =pd.read_excel("dados_normalizados.xlsx")
dataframe.apply(pd.to_numeric, errors='coerce')

novo_dataframe = dataframe.describe()



novo_dataframe.to_excel('dados_estatisticos.xlsx', index=True)