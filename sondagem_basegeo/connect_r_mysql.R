### Bibliografia:  https://programminghistorian.org/pt/licoes/introducao-mysql-r
####  https://solutions.rstudio.com/db/best-practices/drivers/

library("DBI")
library("odbc")
library("dplyr")
library("dbplyr")
library("RMySQL")

conn <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "base_sondagem",
  host = "localhost",
  username = "root",
  password = "Senhamysql*1") #seu password


dbListTables(conn)

# Inserindo uma query com dado 

identificacao <-  "INSERT INTO identificacao_sondagem(COD_IDENT_FURO, 
                                                      COD_PROJETO,
                                                      DATA_INICIO,
                                                      DATA_FINAL,
                                                      MUNICIPIO,
                                                      ESTADO,
                                                      REFERENCIA)
                                                      
                                              VALUES('SGB-RJ-0001',
                                                     'SGP-10',
                                                     2022-10-09,
                                                     2022-10-10,
                                                     'NITEROI',
                                                     'RIO DE JANEIRO',
                                                     'RELATORIOX')"

posicionamento <- "INSERT INTO collar_posicao (LATITUDE, LONGITUDE)
                            VALUES(-22.949278, -43.154818);"

rsInsert <- dbSendQuery(conn, identificacao)


dbDisconnect(conn)
