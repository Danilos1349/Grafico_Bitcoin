import pandas as pd

# Lê os dois arquivos CSV
df_antigo = pd.read_csv(r'/Users/danilo/Desktop/Portfólio/Gráfico_Bitcoin/bitcoin_ate_08-04-2024.csv')
df_novo = pd.read_csv(r'/Users/danilo/Desktop/Portfólio/Gráfico_Bitcoin/bitcoin_pos_08-04-2024.csv')


# Junta os dois DataFrames (empilha linha por linha)
df_total = pd.concat([df_antigo, df_novo], ignore_index=True)

# Remove duplicatas (caso tenha linhas sobrepostas na virada do dia)
df_total = df_total.drop_duplicates()

# (Opcional) Ordena por data, se a coluna for 'Date'
df_total = df_total.sort_values('Date')

# Salva o resultado em um novo arquivo
df_total.to_csv('bitcoin_completo.csv', index=False)


# import os
# print('Diretório atual:', os.getcwd())
