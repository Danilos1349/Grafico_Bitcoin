# 📈 Projeto: Histórico de Preço do Bitcoin

Este projeto visa analisar e visualizar o histórico de preços do Bitcoin em dólares, com destaque para os eventos de halving que ocorrem aproximadamente a cada 4 anos. O gráfico gerado mostra as flutuações de preço ao longo do tempo, destacando as datas dos halvings e oferecendo uma visão clara de como os preços evoluíram.

## Tecnologias e Bibliotecas Utilizadas

- **R**: Linguagem de programação usada para tratamento de dados e criação do gráfico.
- **pacman**: Para facilitar a instalação e carregamento de pacotes.
- **dplyr**: Para manipulação de dados.
- **ggplot2**: Para visualização de dados.
- **stringr**: Para manipulação de strings (uso na limpeza de dados).
- **lubridate**: Para manipulação de datas.
- **ggrepel**: Para melhorar a legibilidade dos rótulos no gráfico.
- **scales**: Para formatação de valores monetários.
- **readr**: Para leitura de arquivos de dados (como .csv ou .txt).

## Objetivo

O objetivo principal do projeto é gerar um gráfico de linha que mostre a evolução dos preços do Bitcoin ao longo do tempo. O gráfico também marca os eventos de halving do Bitcoin, que são momentos importantes para os investidores e analistas do mercado.

## Funcionalidades

### 1. **Tratamento de Dados**

O primeiro passo do projeto envolve o tratamento e limpeza dos dados de preço do Bitcoin. O código faz o seguinte:

- **Conversão de Datas**: As datas originais são convertidas para o formato `Date` para facilitar a manipulação e visualização.
- **Extração de Componentes da Data**: São extraídos o dia, o mês (com abreviação) e o ano para melhor compreensão no gráfico.
- **Formatação do Preço**: O preço do Bitcoin é tratado para lidar com formatação de vírgulas e pontos, convertendo-o para formato numérico.

### 2. **Cálculos Adicionais**

- **Cálculo de Valores em Dólares**: O preço do Bitcoin é formatado para o formato de moeda (dólares), facilitando a leitura e interpretação do gráfico.

### 3. **Análise de Halving**

Os eventos de halving são momentos importantes na história do Bitcoin e são marcados no gráfico. O código seleciona as datas dos halvings (2012, 2016, 2020 e 2024) e as destaca de maneira clara. Cada data de halving recebe uma etiqueta formatada, que é colocada sobre o gráfico para identificação visual.

### 4. **Melhora da Escala**

O código ajusta as escalas do gráfico para melhor visualização:

- **Escala Y (Preço)**: A escala do eixo Y é configurada para exibir os preços do Bitcoin com a formatação de dólar.
- **Escala X (Data)**: O eixo X é ajustado para exibir as datas com intervalos de 2 anos e um formato de data legível.

### 5. **Visualização do Gráfico**

O gráfico gerado é uma linha representando a evolução do preço do Bitcoin ao longo do tempo. Além disso:

- **Linha do Preço**: A linha principal do gráfico mostra a variação do preço do Bitcoin.
- **Marcas de Halving**: Os eventos de halving são destacados por pontos azuis no gráfico, com etiquetas explicativas.
- **Anotação de Texto**: O gráfico inclui uma anotação explicativa destacando a importância dos halvings.

### 6. **Estética e Anotações**

A estética do gráfico é aprimorada utilizando a função `theme_dark()`, proporcionando um fundo escuro, o que torna os elementos visuais mais destacados. A anotação "Em destaque a ocorrência do Halving" também é incluída para enfatizar a relevância do evento.

## Como Usar

### Pré-requisitos

Certifique-se de ter o R instalado no seu sistema.

### Instalação dos Pacotes

Este projeto depende de algumas bibliotecas, que podem ser instaladas e carregadas utilizando o pacote `pacman`:

```r
install.packages("pacman")  # Caso não tenha o pacman instalado
library(pacman)

p_load("dplyr", "ggplot2", "stringr", "lubridate", "ggrepel", "scales", "readr")
```
## Licença

Este projeto é livre para fins educacionais e pessoais.

## 👨‍💻 Desenvolvido por

Danilo 🧠  