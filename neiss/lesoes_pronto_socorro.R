library(shiny)
library(vroom)
library(tidyverse)

tidyverse_update()

dir.create("neiss")

download <-  function(name){
  url <- "https://github.com/hadley/mastering-shiny/raw/master/neiss/"
  download.file(paste0(url,name), paste0("neiss/", name), quiet = TRUE)
}

download("injuries.tsv.gz")
download("population.tsv")
download("products.tsv")


injuries <- vroom("neiss/injuries.tsv.gz")
injuries
