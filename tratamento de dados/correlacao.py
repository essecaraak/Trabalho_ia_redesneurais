import pandas as pd

dataframe =pd.read_excel("dados_normalizados.xlsx")
dataframe.apply(pd.to_numeric, errors='coerce')

novo_dataframe = dataframe.corr()


novo_dataframe.to_excel('dados_correlacionados.xlsx', index=True)