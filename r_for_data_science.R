
# Estudos de bibliografia para R.........
# Este projeto tem por objetivo se aprofundar nos livros e exemplos 
# para asssim formar um conhecimento de como programar da melhor maneira
# em R, com boas práticas e extraindo o máximo o seu potencial.

# Bibliografia: diversos livros gratuitos disponivies no endereço a baixo.

# https://github.com/AnaCarolinaFDias/DescomplicaEstatistica/tree/master/R/Livros%20de%20R

############################################################

# Livro 2: R for Data Science
# https://r4ds.had.co.nz/


# Etapas da Ciencia de dados :
 # ---- Importar seus dados
 # ---- Organizar os dados
 # ---- Transformar os dados 
 # ---- Visualizar os dados
 # ---- Gerar modelos com os dados
 # ---- Gerar comunicação com os dados
 
# Instalando os pacote de Ciência de dados no R que usaremos nesse script.

install.packages("tidyverse")
install.packages(c("nycflights13", "gapminder", "Lahman"))

# Carregando os pacotes e atualizando

library(tidyverse)
tidyverse_update()

# Ao executar uma função de um pacote é possivel apenas escrever a função()
# ou declarar o pacote::função()
dplyr::mutate()
nycflights13::flights


## Introdução  - visualiuzação de Dados

## bibliografia adcional : http://vita.had.co.nz/papers/layered-grammar.pdf 


# Vamos começar respondendo a pergunta se carros com motores grandes usam mais 
# combustível do que carros com motores pequenos? 
# Qual é a relação entre o tamanho do motor e a eficiência de combustível? 
# É positivo? Negativo? Linear? Não linear?
# Vamos carregar uma base de dados de exemplo do ggplot2

mpg <- ggplot2::mpg

# Nomes das variaveis:
names(ggplot2::mpg)

# mpg ---> milhas por galão....

# Relacionando duas variáveis: displ(tamanho do motor em litros) e hwy(eficiencia em mpg)

ggplot(data = mpg ) +
  geom_point(mapping = aes(x=displ, y=hwy))

# Cria o fundo do gráfico
ggplot()

# data = dataset

# geom_point() adciona uma camada de pontos ao seu gráfico
# mapping = aes(x , y ) --> define como as variáveis em seu dataset são mapeadas
# para propriedades visuais, x e y são as variáveis a serem mapeadas nos eixos x e y 
# Exemplo Modelo:

# ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# Exercicio
# Quantas linhas e colunas no dataset mpg
dim(mpg)

# Como saber a descrição de cada coluna nesse dataset
?mpg

# Crie um gráfico de dispersão usando hwy vs. cyl

ggplot(data=mpg)+
  geom_point(mapping = aes(x=hwy, y= cyl))

# Gráfico de linhas de class vs. drv 

ggplot(data=mpg)+
  geom_point(mapping=aes(x=class, y=cyl))






