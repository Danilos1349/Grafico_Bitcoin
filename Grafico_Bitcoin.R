install.packages("pacman")
library(pacman)

p_load("dplyr", "ggplot2", "stringr", "lubridate", "ggrepel", "scales", "readr")

# tratar os dados

Preços_Bitcoin_tratado <- bitcoin_completo %>%
  mutate(
    Data = as.Date(Date, format = "%m/%d/%Y"),
    dia = day(Data),
    mês = month(Data, label = TRUE),
    ano = year(Data),
    Data_descrita = paste(dia, mês, ano),
    Preço = Price %>%
      str_replace_all(",", "#") %>%
      str_replace_all("\\.", ",") %>%
      str_replace_all("#", ".") %>%
      parse_number(locale = locale(decimal_mark = ",", grouping_mark = "."))
  ) %>%
  select(-c(1, 2, 3, 4, 5, 6, 7, 8, 9))

Preços_Bitcoin_tratado = Preços_Bitcoin_tratado %>% 
  mutate(Valor = as.numeric(gsub(",", "", Preço)))

# melhorar a escala

limites = Preços_Bitcoin_tratado %>% 
  filter(Preço == max(Preço, na.rm = TRUE)) %>% 
  mutate(dolares = dollar(Preço)) %>% 
  mutate(etiqueta = paste(Data_descrita, dolares, sep = "\n"))

marcadores_halving = Preços_Bitcoin_tratado %>% 
  filter(Data == "2012-11-28" | Data == "2016-07-09" | Data == "2020-05-11" | 
           Data == "2024-04-19") %>% 
  mutate(dolares = dollar(Preço)) %>% 
  mutate(etiqueta = paste(Data_descrita, dolares, sep = "\n"))

# melhorar a escala

marcasy = seq(min(0),
              max((Preços_Bitcoin_tratado$Preço)),
              by = 10000)

marcasx = seq(ymd(min(Preços_Bitcoin_tratado$Data)), 
              ymd(max(Preços_Bitcoin_tratado$Data)),
              by = "2 year")

# criando o gráfico

gráfico_linha_bitcoin = ggplot(data = Preços_Bitcoin_tratado, mapping = aes(x = Data, y = Preço)) + 
  geom_line(color = "gold") +
  geom_point(data = marcadores_halving, color = "blue") +
  geom_label_repel(data = marcadores_halving, alpha = 0.9, force = 100 , nudge_x = -50,
                   nudge_y = 10000, mapping = aes(label = etiqueta)) +
  scale_y_continuous(breaks = marcasy, labels = dollar) +
  scale_x_date(breaks = marcasx, labels = date_format("%b %Y")) +
  labs(title = "Histórico de preço do bitcoin em dólar",
       x = "",
       y = "Dólares") +
  annotate("text", label = "Em destaque a ocorrência do Halving", 
           color = "green", fontface = "bold", size = 4, y = 30000, 
           x = as.Date("2013-07-30", format = "%Y-%m-%d")) +
  theme_dark(base_size = 10)

# chamando o gráfico

gráfico_linha_bitcoin