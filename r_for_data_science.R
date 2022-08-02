
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

# Valores ausentes --> quase toda operação que envolve um valor NA será NA

NA > 5
10 == NA

NA + 10
NA/2

NA == NA

x <- NA
y <- NA

x == y

# Como resolver essa situação?? usamos o is.na()

is.na(x)
is.na(y)
is.na(x) == is.na(y)

# Agora quando usamos o filter o valor retorna irá incluir os valores TRUE e excluir os FALSE e NA

df <- tibble(x = c(1,NA,3))

filter(df, x>1)

filter(df,is.na(x) | x >1)

# Vamos usar o dataset nycflights para algumas consultas:

# 1 -  Voos com atraso de 2h ou mais na chegada (arr_delay)

filter(flights,arr_delay == 2 | arr_delay >= 2 )

# 2 - Voos para huston (dest == IAH e HOU)

filter(flights, dest == "IAH" | dest =="HOU")

# 3 - Voos operados pela United airlines(UA), America airlines(AA) ou Delta airlines(DL)
select(flights, carrier)

filter(flights, carrier == "UA"| carrier == " AA"| carrier == "DL")

# 4 - Voos que partiram no verão (jan // feb // mar)

unique(select(flights, month))

filter(flights,month == 1 | month == 2 | month == 3 )



## Organize as linhas com arrange()

arrange(flights, year, month, day)

#Use o desc() para reordenar uma coluna em ordem decrescente

arrange(flights, desc(year))


# Agora vamos seleiconar colun as com o select

select(flights, year, month, day)

# Agora podemos passar as colunas como intervalo, 

select(flights, year:day)

# Podemos tambem dizer quem nao queremos selcionar da mesma forma

select(flights, -(year:month))

## Adcionando novas variáveis com o mutate();

# criando um dataset menor
flights_small <- select(flights, year:day,ends_with("delay"), distance, air_time)
names(flights_small)
# usando o mutate,
flights_small <- mutate(flights_small, gain = dep_delay- arr_delay, speed = distance/air_time *60)

names(flights_small)

flights_small <- mutate(flights_small, gain=dep_delay, hours= air_time/60,
                        gain_per_hour = gain/hours )
names(flights_small)

## Caso queira apenas as novas variáveis basta usar o transmute

transmute(flights, gain= dep_delay - arr_delay,hours = air_time/60,
          gain_per_hour = gain/hours)

## Funções de criação úteis

# Classificação usando o min_rank() determina o primeiro, segundo.... de cada objeto

y <-  c(1,2,2,NA,3,4)
min_rank(y)

# Caso queria ao contrario do ultimo para o primeiro use o desc()

min_rank(desc(y))

# As variações de min_rank()...
row_number(y)

dense_rank(y)
percent_rank(y)
cume_dist(y)


## Resumos agrupados com summarise()

summarise(flights, delay = mean(dep_delay, na.rm= TRUE))

# Usar o summarise se torna mais eficiente com o group_by. retornando sumarios agrupados

by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm=T))


# Combinando operações com o operador pipe

delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = T)
  ) %>% 
  filter(count > 20, dest != "HNL")

# Valores ausentes

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year,month,day) %>% 
  summarise(mean = mean(dep_delay))


### Contagens --> Sempre que fizer uma agregração é importante fazer um acontagem

delays <-  not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(delay = mean(arr_delay))

ggplot(data=delays, mapping = aes(x=delay))+
  geom_freqpoly(binwidth = 10)

  
## Análise exploratória de dados : desenvolver uma compreeensão de seus dados.
# Combinando ggplot2 com tidyverse.

library(tidyverse)
tidyverse_update()
library(ggplot2)  



# definições:
# 1 - Uma variável é uma quantidade, qualidade ou propriedade que você pode medir.
# 2 - Um valor é o estado de uma variável quando você a mede. O valor de uma variável 
## pode mudar de medição para medição.
# 3 - uma observação é um conjunto de medições
# 4 - Dados tabulares são um conjunto de valores


## Variação é a tendencia dos valores de uma variável mudarem de medição para medição.

# Visualizando distribuições. 
# Variável categórica so pode receber um valor de conjuto de valores.
# Os gráficos de barra são melhores para examinar uma distribução de uma variável categorica

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x =cut))

# A altura das barras mostra quantas observações ocorreram. 

diamonds %>% 
  count(cut)

# Uma variável continua pode receber um valor de um conjunto infinito de possbilidades
# dessa maneira a melhor forma de examinar uma variável continua é com histograma

ggplot(data=diamonds)+
  geom_histogram(mapping = aes(x=carat), binwidth = 0.5)

# Essa contagem por intervalo pode ser feita de forma direta também 

diamonds %>% 
 dplyr::count(ggplot2::cut_width(carat, 0.5))

## Explorando as barras do grafico histograma

smaller <-  diamonds %>% 
  filter(carat < 3)

ggplot(data = smaller, mapping = aes(x=carat))+
  geom_histogram(binwidth = 0.1)

## Caso queira avalair mais uma variável no mesmo histograma é melhor usar
## o geom_freqpoly

ggplot(data=smaller,mapping = aes(x= carat, colour = cut))+
  geom_freqpoly(binwidth = 0.1)

## manipulando as a espessura das barras do histogramas para ver tendencias,
## e agrupamentos 


ggplot(data=smaller, mapping = aes(x= carat))+
  geom_histogram(binwidth = 0.01)
  

## Vamos olhar um dataset sobre tempo de duração de uma erupção vulcanica e /
## ver como podemos separar dois grandes grupos.

ggplot(data = faithful, mapping = aes(x =eruptions))+
  geom_histogram(binwidth = 0.25)


## Valores incomuns: outliers são pontos que não parecem se encaixar no padrão.
## Podem ser erros de entrada de dados, outras vezes valores discrepantes. 
## Analisando esses valores no histograma

ggplot(diamonds)+
  geom_histogram(mapping = aes(x=y),binwidth =0.5)

# Vamos ampliar os valores do eixo y usando o coord_cartesian()

ggplot(diamonds) +
  geom_histogram(mapping = aes(x=y),binwidth = 0.5)+
  coord_cartesian(ylim=c(0,50))
  
# Agora vamos separa esses valores outliers usando o dplyr

unusual <- diamonds %>% 
  filter(y < 3 | y > 20) %>% 
  select(price, x, y,z) %>% 
  arrange(y)
unusual
  


## Valores Ausentes -- > como tratar


#Separando as linhas --- opção não muito recomendada

diamonds2 <- diamonds %>% 
  filter(between(y,3,20))

# Substituindo os valores incomuns para valores ausentes

diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y < 3 | y > 20,NA,y)) 

  
  

















  
  
  
  
  
  



