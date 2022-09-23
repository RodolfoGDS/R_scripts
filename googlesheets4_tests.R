### Bibliografia --  https://cran.r-project.org/web/packages/googlesheets4/googlesheets4.pdf
########### --- https://googlesheets4.tidyverse.org/


# instalando o pacote  googlesheets4

install.packages("googlesheets4")

# Carregando o pacote googlsheets4

library(googlesheets4)
library(tidyverse)
library(tibble)


## Autorizando o acesso ao google sheets


gs4_auth()

# lendo um arquivo do google 



EntradaSalario <- ("https://docs.google.com/spreadsheets/d/1Qe6SBb3eSG3-LcdMQHU36XpPofNfxhNPYPN-0PBBrmQ/edit#gid=0")
df1 <- data.frame(3555,"21-09-2022",2323,55444,"CDB")


## função para salvar

saveData <- function(data, SHEET_ID){
  data <- data %>% as.list() %>% data.frame()
  sheet_append(SHEET_ID, data)
}

saveData(df1,EntradaSalario )

