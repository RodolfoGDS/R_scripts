# Estudos de bibliografia para R.........
# Este projeto tem por objetivo se aprofundar nos livros e exemplos 
# para asssim formar um conhecimento de como programar da melhor maneira
# em R, com boas práticas e extraindo o máximo o seu potencial.


# Bibliografia: diversos livros gratuitos disponivies no endereço a baixo.

# https://github.com/AnaCarolinaFDias/DescomplicaEstatistica/tree/master/R/Livros%20de%20R

############################################################

# Livro 1: Hands-On Programming with R:

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

