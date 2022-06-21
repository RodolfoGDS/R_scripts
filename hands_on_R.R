# Estudos de bibliografia para R.........
# Este projeto tem por objetivo se aprofundar nos livros e exemplos 
# para asssim formar um conhecimento de como programar da melhor maneira
# em R, com boas práticas e extraindo o máximo o seu potencial.


# Bibliografia: diversos livros gratuitos disponivies no endereço a baixo.

# https://github.com/AnaCarolinaFDias/DescomplicaEstatistica/tree/master/R/Livros%20de%20R

############################################################

# Livro 1: Hands-On Programming with R:
# https://rstudio-education.github.io/hopr/ 

###########################


# Matemática básica

2 * 3

4 - 1 

6 / (4-1)

# Criando uma sequencia de valores usando o operador dois pontos(:)

100:130


# Exercício 2.1 (Magia com Números)

# 1 - Escolha qualquer número e adicione 2 a ele.

# 2 - Multiplique o resultado por 3.

# 3 - Subtraia 6 da resposta.

# 4 - Divida o que você recebe por 3.

 

5 + 2 
7 * 3 
21 - 6
15 / 3

# Vamos criar um dado virtual:

# O operador : retorna um resultado que é um vetor. No caso um dado vai de 1 até 6.

1:6

# Vamos salvar o resultado da sequencia 1:6 em um objeto R.

## Objeto: Apenas um nome que você pode usar para chamar os dados armazenados.

## Operador de atribuição ( <- ) ---- (Alt -)

dado <- 1:6
dado

#Regras para nomear um objeto: 


# Primeiro, um nome não pode começar com um número. 
# Segundo, um nome não pode usar alguns símbolos especiais, como
# ^, !, $, @, +, -, /ou *

# R faz distinção entre maiúsculas e minúsculas, portanto, name e Name se referirá
# a diferentes objetos

# R irá sobrescrever qualquer informação anterior armazenada em um objeto sem 
# pedir permissão. Portanto, é uma boa ideia não usar nomes que já foram usados.

# Você pode ver quais nomes de objetos você já usou com a função ls().


Name <- 1

name <- 0

my_number <- 999

Name <- my_number + name

ls()


# Vamos agora analisar as possibilidades de operções matemáticas com o objeto dado.

dado - 1

dado + 2

dado/2

dado * 10

dado * dado

# R aplicará a mesma operação a cada elemento do conjunto. 

# A operação dado * dado, é uma multiplicação de dois vetores de mesmo tamanho.

# No caso de vetores de tamanho distintos O R repetirá o vetor curto para fazer as 
# operações.

dado + 1:2

dado + 1:4


# As multiplicações matriciais tradicionais são executadas usando o operador
# %*% para multiplicação interna e %o% para mutiplicação externa.

dado %*% dado

dado %o% dado


# Outras operações com matrizes também é possivel como calcular a determinate(det)
# ou transpor a matriz com (t)

matriz <- dado%o%(6:11)

t(matriz)
det(matriz)

###########################

### Funções:

# round() ---> arredondar um número

# factorial() ---> caclular o fatorial

round(3.1415)

factorial(5)

# Os dados que você passa para função são chamdos argumentos da função.

mean(1:6)

mean(dado)

round(mean(dado))

# Quando você passa uma função como argumento de uma função, o R resolverá da operação
# mais interna para a mais externa.


#############################################################################
              # PROJETO 1 - JOGO DE DADOS
#############################################################################

# Para simular um dado sendo jogado podemos usar a função sample(). 
# esta função tem como argumento a x= um vetor e size=um numero. 
# A função sample retornará uma vetor de size elementos.

sample(x=1:4, size=2)

sample(x= dado, size=1)

# Caso não especifique o argumento a ordem faz diferença 
sample(dado,1)


# No caso de especificar com clareza o argumento a ordem não importa.

sample(size=1, x= dado)

# Caso não tenha certeza de quais nomes usar com uma função, pode pesquisar os
# argumentos da função usando outra função a args()

args(sample)

args(round)

round(x=3.1415, digits = 2)

# A função sample na verdade não serve para rolar dois dados, pois não permite 
# que ocorra um par de identico no lançamento do dado. Isso ocorre porque
# a função sample cria uma amostra sem substituição, o segundo elemento do vetor
# possui n-1 valores a ser escolhido aleatoriamente. Ou seja o segundo sorteio 
# depende do primeiro, e isso não ocorre no mundo físico, para corrigir isso 
# basta passar mais um argumento na função, o replace=TRUE. Gerando assim uma
# amostragem com reposição.


sample(x= dado, size=2, replace=TRUE)


# Caso você queira somar as faces soteadas dos dados use a função sum()

rodada_dado <- sample(dado, size= 2, replace=T)
sum(rodada_dado)


# Construindo uma função para jogar dois dados e somar seus resultados.


my_function <- function(){} 


roll <- function(){
  
  dado <- 1:6
  rodada_dado <- sample(x=dado, size=2, replace=TRUE)
  sum(rodada_dado)
}
roll()
roll()

# Fornecendo um argumento para a função.

roll2 <- function(dado_jogador){
  
  rodada_dado <- sample(dado_jogador, size=2, replace = TRUE)
  sum(rodada_dado)
  
}
roll2(dado_jogador = 1:6)


roll2()


# caso eu queria fornecer um valor padrão(default) para o argumento da função

roll2 <- function(dado_jogador=1:6){
  
  rodada_dado <- sample(dado_jogador, size=2, replace = T)
  sum(dado_jogador)
}
roll2()

# Parte 2 ----> A casa sempre ganha! usando a probabilidade a nosso favor

# Baixando um  pacote diretamente na linha de comando e instalando no seu disco Rigido.

install.packages("ggplot2")

#Carregando o pacote 

library(ggplot2)

# Criando vetores usando a função c() ---> concatenate, collect, combine

x <- c(-1,-0.8,-0.6,-0.4,-0.2,0,0.2,0.4,0.6,0.8,1)

y <- x^3

qplot(x,y)


# Graficos de dispersão são uteis para relação entre duas variáveis e 
# histograma é útil para ver a distribuição de uma única variável.
# Automaticamente o qplot irá retorna um histograma quando apenas uma
# variável for informada.

x <- c(1,2,2,2,2,3,3)
qplot(x, binwidth= 1)

x2 <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth=1)

x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3, binwidth=1)


# Ao rodar os dados e obter a soma dos resultados você pode obter uma distribuição em histograma.
# Para nao precisar rodar varias rezes a função roll() basta usar a função replicate, o argumento
# é quantas vezez quer repetir e em seguida o que quer que seja repetido

replicate(3, 1+1)

replicate(10, roll())

# Imagine agora que queremos observar a distribuição de 10.000 jogadas 

rolls <- replicate(10000,  roll())
qplot(rolls, binwidth=1)


# O resultado gráfico mostra que os dados sao confiáveis..

# Bom agora vamos vamos dar peso para cada valor do dado. Serão dados ponderados
# onde o valor 6 terá maior probabilidade de sair que os de mais. 

roll <- function() {
  dados <- 1:6
  rodada <- sample(dados, size = 2, replace = TRUE, 
                 prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(rodada)
}

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)



#############################################################################
                    # PROJETO 2  - JOGO DE CARTAS                   
#############################################################################

# Tarefa 1: construir o baralho


# criando atomic vectors --> podem ser do tipo double, integer, character, logical, complex e raw.

# DOUBLE ---> armazena numeros regulares quem podem ser positivos ou negativos, grandes ou pequenos, 
# ter digito a direita ou não.

dado <- c(1,2,3,40,0.9,0.7)

typeof(dado)


# Interger ---> armazena inteiros, sem componentes decimais. você pode criar um inteiro usando a letra
# L maiusculo mesmo após o numero.

inteiro <- c(-1L, -2L, -4L,1L, 2L)
typeof(inteiro)

inteiro_2 <- c(-1,-2,-3,-40)
typeof(inteiro_2)


# Character ---> armazena pequenos pedaços de texto

texto <- c("Hello", "World") 
typeof(texto)

typeof("Hello")

# Os elementos individuais de um vetor de caracter são conhecidos como strings


# Logical --> armazenam TRUE ou FALSE, também pode ser T ou F.

3>4
logico <- c(TRUE, FALSE, TRUE)
typeof(logico)



# Complex ----> armazenam numeros complexos. Para criar um vetor complexo adcione
# um terno imaginario (i)

complexo <- c(1+1i, 1+2i, 1+3i)
typeof(complexo)


#Raw ---> armazenam bytes brutos de dados. Usamos a funçao raw()

raw(3)
raw(2)
raw(20)

typeof(raw(18))


# Imagine uma mão de poker com royal flush (ás, rei, dama, valete, dez) todos do 
# naipe de espadas.. Vamos contruir um atomic vector para guardar essa mão.

hand <- c("as", "rei", "dama", "valete", "dez")


# Agora vamos criar algo bidimensional que armazene também o naipe.

attributes(hand)


# Vamos dar atributos ao vetor. 

dado <- 1:6
names(dado)
names(dado) <- c("um","dois", "tres", "quatro","cinco","seis")
attributes(dado)
dado

# Note que os nomes não serão afetados quando forem feitas alterações nos vetores

dado -1

# No entanto você pode alterar os valores de nomes quyando quiser.

names(dado) <- c("one", "two", "tres", "four", "cinco", "meia-duzia")
dado

# Mudando a dimensão do vetor e transformado em array n-dimensional, para isso
# vamos usar a função dim() e determinar qual valor el vai receber

dim(dado) <- c(3,2)
dado

dim(dado) <- c(2,3)
dado

# Na funçao dim() o primeiro argumento sempre será para as linahs e a segunda par coluna
# No caso podemos passar uma terceira informação gerando um hipercubo


dim(dado) <- c(1,2,3)
dado


# Matrizes ---> usaremos a função matrix() e passaremos como argumento um atomic vector
# depois definiremos quantas linhas iremos querer.

matriz <- matrix(dado, nrow=2)
matriz

# Caso queira preencher linha por linha basta passar o argumento byrow = TRUE

matriz <- matrix(dado, nrow=2, byrow=TRUE)
matriz


# Arrays: a função array cria uma matriz n-dimensional. Para usar o array
# forneça um vetor atômico como primeiro argumento e um vetor de dimensões
# como segundo argumento (dim).

array <- array(c(11:14,21:24,31:34), dim = c(2,2,3))
array

## Exercício: Crie uma matriz que armazene o nome e o naipe de cada carta
# de um royal flush.

hand1 <- c("as", "rei", "dama", "valete","dez", "espadas", "espadas", "espadas",
           "espadas", "espadas")

matrix(hand1, nrow=5)
matrix(hand1, ncol=2)
dim(hand1) <- c(5,2)

#Preenchendo linha por linha ou linha por linha

hand1 <-c("as", "espadas", "rei", "espadas", "dama", "espadas", "valete", "espadas",
          "dez", "espadas") 
matrix(hand1, nrow=5, byrow=TRUE)  
matrix(hand1, ncol=2, byrow=TRUE)
  
  
# Classe: Observe aqui que ao alterar as dimensões do seu objeto não alterará o tipo
# do objeto , mas alterará a class , o atributo do objeto.

dim(dado) <- c(2,3)
typeof(dado)  
class(dado)  

attributes(dado)

# Também é possivel aplicar a função class a objetos que não possuem um
# class atributo.

class("Hello")
class(4)  
  
  
# Datas e Horários: A hora parece uma string de caracteres quando você exibe, 
# mas seu tipo de dados é double e sua classe  "POSIXct POSIXt".

agora <- Sys.time()
agora

typeof(agora)

class(agora)

# Na estrutura POSIXct, cada hora é representada pelo número de segundos que 
# se passaram entre a hora e 12:00 AM de 1º de janeiro de 1970 (na zona Universal
# Time Coordinated (UTC).


## Fatores: armazena informações categóricas, cor dos olhos, etnia, genero, religiao
# Para criar um fator passamos um vetor atomico

genero <- factor(c("male", "female","female", "male"))
typeof(genero)

attributes(genero)

# Usando o unclass é possivel como o R está armazenando o seu vetor
unclass(genero)

# Também é possivel converter o um factor para um caracter

as.character(genero)


# Coerção --. ato de induzir ou compelir, forçar. Como ocorre no R?
# Se uma string de caracteres estiver presente em um valor atomico ,
# todo o resto será convertido para string de caracteres. Seo vetor
# tiver apenas logicos e números, os logicos serão convertidos para número
# TRUE = 1 e FALSE = 0

sum(c(T,T,F,F))

# Da mesma forma pode pedir para converter os dados de um tipo para outro:

as.character(1)

as.logical(1)

as.numeric(FALSE)



# Listas : vetores atomicos, pois agrupam dados em uma única dimensão.
# Podem agrupar objetos diferentes, como listas dentro de listas, arrays, 
# da mesma forma que a função c() cria um vetor a função list() cria uma lista
# e seus valores são separados por vírgula.

lista1 <- list(100:130, "R", list(TRUE, FALSE))
lista1

# Acessando o primeiro valor da lista:
lista1[[1]]
# Acessando o subítem do primeiro valor da lista:
lista1[[1]][2]
# Acessando o ultimo item da lista:
lista1[[length(lista1)]]

## Data Frame: versão bidimensional de uma lista, é a forma de armazenamento 
# de dados mais util para análise de dados. Pense semelhante a estrutura de uma
# tabela de dados do excel. Dentro da mesma coluna do dataframe , cada célular
# deve ser do mesmo tipo de dado.

# Criando um dataframe manualmente usando a função data.frame(). 

df <- data.frame(face= c("as", "dois","seis"),
                 suit= c("clubs", 'clubs', "clubs"),
                 value= c(1,2,3))
df
# Note que cada vetor informado possui o mesmo comprimento

# Agora os nomes serão armazenados no names() um atributo do objeto.

names(df)

# analisando o tipo de dado
typeof(df)

# analisando a classe
class(df)

# analisando a estrutura

str(df)

# Em alguns casos o R salva o dataframe como um factor para evitar isso passe 
# a informação stringAsFactors = FALSE

df <- data.frame(face= c("as", "dois","seis"),
                 suit= c("clubs", 'clubs', "clubs"),
                 value= c(1,2,3), stringsAsFactors = T)
str(df)
df <- data.frame(face= c("as", "dois","seis"),
                 suit= c("clubs", 'clubs', "clubs"),
                 value= c(1,2,3), stringsAsFactors = F)


# Carregando base de dados em csv usando o Rstudio 

# Caminho: Environment/Import/From text(base)/seu_diretorio_do_arquivo

# Visualizando o dado
View(deck)

# As 6 primeiras linhas
head(deck)

# As 6 ultimas linhas
tail(deck)

# Salvando o csv ---> (dataframe,nome_que_vai_da,row.names=FALSE)
# ROW.NAMES = FALSE não permite que seja adcionado uma coluna index

write.csv(x = deck,file = "cards.csv", row.names = FALSE)

# Agora aonde está sendo salvo o meu arquivo??

getwd()

#### Notação do R

# Selecionando Valores: Escreva o nome do objeto e passe entre colchetes
# um valor ou um conjunto de valores. objeto[ , ], o primeiro valor 
# agruparar as linhas e segundo as colunas. Podemos passar os índices de 
# interesse de 6 formas distintas, são elas:

# Inteiros positivos: Tratado como o i,j da algebra linear, linha i e coluna j
deck[1,1]

# Para extrair mais de um valor use o vetor c().
deck[1, c(1,2,3)]

# Esse conjunto de dados selecionado pode ser armazenado em uma nova variavel

nova <- deck[1, c(1,2,3)]
nova

# subconjunto com valores repetidos.
deck[c(1,1), c(1,2,3)]

# Da mesma forma que aplicamos ad dataset, podemos aplicar a um vetor atomico/

vetor <- c(6,1,3,6,10,5)
vetor[1:3]  

# Lembre que em R a indexação começa em 1. Quando é informado apenas uma coluna
# o R retornará um vetor, 

deck[1:3, 1]

# Mas caso queira que seja retornado um dataset basta usar o drop=FALSE

deck[1:3, 1, drop=FALSE]

# Inteiros negativos também são usados para seleção de dados. 
# No caso de passar um valor negativo o indice referente a ele será excluido

deck[-(2:52),1:3]

# Para criar um objeto vazio basta o zero 0

deck[0,0]

# Valores em branco são úteis quando se quer extrair tudo de uma dimensão.

deck[1, ]
  

# Valores lógicos servem tanto para linhas como para colunas, toda a informação
# passada como falsa será excluida do resultado de retorno.

deck[1, c(T, T, F)]
vetor  
vetor[c(F,T,F,F,T,F)]  

# Nomes: é possivel passar os nomes das colunas por exemplo.
deck[1, c("face", "value")]

deck[ ,'value']

######
# Criando uma função para destribuir as cartas.

deal <- function(baralho){
  
  baralho[1, ]
}

# dessa maneira a cima a mesma carta sempre será distribuida. A função nao 
# entende que a carta já saiu. precisamos então embaralhar a cada rodada de
# distribuição de cartas.

random <- sample(1:52, size= 52)
random

deck2 <- deck[random, ]
deck2

# Precisamos executar o random a cada rodada para que seja embaralhado 

shuffle <- function(cartas){
  random <- sample(1:52, size = 52)
  cartas[random, ]
}

deal(deck)
deal(deck)

### Cifrões e colchetes duplos, cifrões são uteis para tirar dados de apenas
# uma coluna

deck$value
deck$suit

# Podemos usar esse tipo de seleção para ajudar em calculos
mean(deck$value)
median(deck$value)

# Podemos usar o cifrão para listas
lst <- list(numbers=c(1,2), logical= TRUE, strings= c("a","b", "c"))
lst
lst$numbers
lst$logical

sum(lst$numbers)

# Outra forma de criar subconjuntos é usando o duplo colchete [[ ]]
lst[[1]]

# Ou o simple colchete
lst["numbers"]
lst[["numbers"]]


