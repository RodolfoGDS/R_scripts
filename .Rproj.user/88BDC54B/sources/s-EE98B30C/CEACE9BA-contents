
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



# Mapeamentos estéticos: adcionando uma terceira variável ao grafico do ggplot
# Nesse caso vamos aplicar cor as diferentes classes que estão relacionadas ao tamanho do veículo
names(mpg)
unique(mpg["class"])

ggplot(data=mpg)+
  geom_point(mapping=aes(x= displ, y= hwy, color=class))

# Agora vamos fazer usar o tamanho do ponto para diferenciar as classes.

ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ,  y= hwy, size = class))
# Podemos usar uma escala de transparencia informando o alpha ou mudando o tipo de ponto pelo shape

ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ, y= hwy, alpha= class))

ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ, y= hwy, shape= class))

# Caso queira apenas mudar as cores do ponto sem vincular a uma forma de classificar,
# basta mudar a sintaxe.Assim a cor não transmite informaçãoes sobre a viariável apenas 
# altera a apareencia do gráfico

ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ, y= hwy), color= "red")


# Dividindo o gráfico em facetas 

ggplot(data=mpg)+
  geom_point(mapping=aes(x= displ, y= hwy))+
  facet_wrap(~class, nrow = 2)

# Para combinar duas variáveis use o facet_grid()
unique(mpg["drv"])
unique(mpg["cyl"])       

ggplot(data=mpg)+
  geom_point(mapping=aes(x=displ, y= hwy))+
  facet_grid(drv~cyl)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

# Objetos Geométricos ---> vamos agor amudar o objeto geométrico do gráfico
ggplot(data=mpg)+
  geom_smooth(mapping = aes(x=displ, y=hwy))


# Passando mais uma variável para dar mais informação ao gráfico
ggplot(data=mpg)+
  geom_smooth(mapping= aes(x=displ, y = hwy, linetype=drv))

# Passando informação usando o group
ggplot(data=mpg)+
  geom_smooth(mapping=aes(x=displ, y= hwy, group = drv))


# Mudando as cores

ggplot(data=mpg)+
  geom_smooth(mapping=aes(x= displ, y= hwy, color = drv))

# Tirando a Legenda

ggplot(data=mpg)+
  geom_smooth(mapping=aes(x= displ, y= hwy, color = drv),
                        show.legend = FALSE)


# Sobrepondo gráficos de pontos e linhas ---> geom_point() geom_smooth()

ggplot(data=mpg)+
  geom_point(mapping= aes(x=displ, y=hwy))+
  geom_smooth(mapping = aes(x=displ, y=hwy))

## Obs: Note que na linha de código do gráfico a cima passamos duas vezes x e y,
## isso não é necessário.


ggplot(data=mpg, mapping=aes(x=displ, y=hwy))+
  geom_point()+
  geom_smooth()

## Obs: Passando todo os dados do mapping na primeira função 


# Da mesma forma é possivel passar variáveis e estilos específicos em cada geometria 

ggplot(data=mpg, mapping = aes(x=displ, y= hwy))+
  geom_point(mapping = aes(color = class))+
  geom_smooth()


# Também é possível usar um filtro

ggplot(data=mpg, mapping= aes(x= displ, y=  hwy))+
  geom_point(mapping = aes(color = class))+
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)


## OBS: se ---> standart error  -----> ?geom_smooth()

# Formas diferentes de passar a informação no ggplot...

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))



# Grafico 1 :

ggplot(data=mpg, mapping=aes(x= displ, y= hwy))+
  geom_point()+
  geom_smooth(se=F)

# Grafico 2 :

ggplot(data=mpg, mapping=aes(x=displ, y=hwy, group=drv))+
  geom_point()+
  geom_smooth(se=FALSE)

# Grafico 3 :

ggplot(data=mpg,mapping=aes(x=displ, y=hwy, color=drv))+
  geom_point()+
  geom_smooth(se=FALSE)

# Gráfico 4 :

ggplot(data=mpg, mapping=aes(x=displ, y= hwy))+
  geom_point(mapping=aes(color=drv))+
  geom_smooth(se=F)

#Gráfico 5 :

ggplot(data = mpg, mapping=aes(x=displ, y=hwy, linetype= drv))+
  geom_point(mapping=aes(color=drv))+
  geom_smooth(se=F)
?geom_point  
  
# Gráfico 6 : 

ggplot(data = mpg,mapping = aes(x=displ,y=hwy,fill = drv)) +
  geom_point(shape=21, size=5, colour = "white",stroke=3)



ggplot(mtcars, aes(wt, mpg, drv)) +
  geom_point(shape = 21, size = 5, stroke = 5)+
  geom_point()


##### Transformações Estatísticas

ggplot(data=diamonds)+
  geom_bar(mapping = aes(x=cut))
names(diamonds)

# obs: Gráficos de barras , histogramas e polígonos de frequencia agrupam  seus 
# dados e em seguida, plotam as contagens de bin.
# Por de traz da função geom_bar() o algoritmo stat ( stat_count() ) trabalha fazendo a contagem e 
# agrupando no eixo X.

ggplot(data= diamonds) +
   stat_count(mapping(aes(x= cut)))

# Caso queira barras que indiquem proporção e não contagem  basta pasasr no y = stat(prop)

ggplot(data=diamonds) +
  geom_bar(mapping = aes(x= cut, y = stat(prop), group=1))

# É possível também destacar os valores  usando a summary

ggplot(data=diamonds)+
  stat_summary(mapping= aes(x= cut, y = depth),
           fun.min = min,
           fun.max = max,
           fun = median)


### Ajustes e posição 

## Colorindo as barras usando o colour e o fill

ggplot(data = diamonds)  +
  geom_bar(mapping = aes(x=cut, colour = cut))

ggplot(data= diamonds) +
  geom_bar(mapping= aes(x=cut, fill= cut))

# Caso queira pode preencher utilizando outra variável 

ggplot(data= diamonds)+
  geom_bar(mapping = aes(x=cut, fill= clarity))


# As três opções do argumento position = "identity", "dodge" , "fill" . 

ggplot(data=diamonds, mapping= aes(x=cut, fill= clarity))+
  geom_bar(alpha= 1/5, position= "identity")

ggplot(data=diamonds, mapping=aes(x=cut, colour= clarity))+
  geom_bar(fill= NA, position="identity")

# A position= "fill", coloca todas as barras do mesmo tamanho 
ggplot(data=diamonds) +
  geom_bar(mapping=aes(x=cut, fill = clarity), position = "fill")

# A position = "dodge" coloca os objetos sobrepostos dispostos lado a lado 

ggplot(data= diamonds)+
  geom_bar(mapping = aes(x = cut, fill=clarity), position = "dodge")

## No caso de gráfico de pontos com muitos pontos caindo no mesmo lugar, fica dificil 
#  observar onde é a concentração uma vez que ele está sobreposto.
# É possivel usar a configuração position = "jitter" que irá adcionar uma quantidade aleatória
# de ruído para cada ponto. 

ggplot(data= mpg)+
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")


## Sistemas de coordenadas ---. alterando os eixos x e y do seu gráfico

ggplot(data = mpg, mapping = aes(x= class, y = hwy ))+
  geom_boxplot()

# alterando os eixos do grafico coord_flip()
ggplot(data = mpg, mapping = aes(x=class, y=hwy))+
  geom_boxplot()+
  coord_flip()

# Definindo a proporção de aspecto corretamente para mapas
# Útil para dado espaciais

nz <- map_data("nz")
ggplot(nz, aes(long, lat, group = group))+
  geom_polygon(fill = "white", colour = "black")

ggplot(nz,aes(long, lat, group = group)) +
  geom_polygon(fill= "white", colour = "black")+
  coord_quickmap()

# Usando uma projeção polar para alterar os eixos de representação gráfica

bar <-  ggplot(data=diamonds) +
  geom_bar(
    mapping=aes(x=cut, fill= cut),
    show.legend = FALSE,
    width = 1
  )+
  theme(aspect.ratio = 1) +
  labs(x = NULL, y= NULL)

bar + coord_flip()
bar + coord_polar()


# Gramática em camadas de gráfico 
## Modelo de código 
' ' '
ggplot(<data>)+
  <GEOM_FUNCTION> (
    mapping = aes(<MAPPINGS>),
    stat = <STAT>,
    position = <POSITION>
  ) +
  <COORDINATE_FUNCTION>+
  <FACET_FUNCTION>

' ' '
##########################
# Trasnformação de dados


### Noções básicas de dplyr:

# dplyr::filter() ---> filtra as observções
# dplyr::arrange() --> reordena as linhas
# dplyr::select() ---> escolha variáveis pelo seu nome
# dplyr::mutate() ---> crie novas variáveis 
# dplyr::summarise() ---> obten ha um sumário

# Vamos usar o dataset de flights.

library(nycflights13)
library(tidyverse)

# Dados de primeiro de janeiro
filter(flights, month == 1, day ==1)
jan1 <- filter(flights, month==1, day==1)

# Dados de 25 de dezembro
dez25 <- filter(flights, month == 12, day == 25)

# Note que month não é um atributo e sim uma comparação lógica usada para filtrar o dado. Por
# isso usa == e não  = 

# Agora vamos utilizar os operadores lógicos

filter(flights, month ==11 | month == 12)
filter(flights, month %in% c(11,12))

## Lei de De Morgan: !(x & y) é o mesmo que !x | !y que é igual a !(x | Y) que por fim é !x & !y

# Exemplo para voos atrasados na chegada ou na partida em mais de 2 horas.

filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)










