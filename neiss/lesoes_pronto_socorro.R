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


products <- vroom::vroom("neiss/products.tsv")
View(products)

populations <- vroom("neiss/population.tsv")
View(populations)



selected <- injuries %>% filter(prod_code == 649)
nrow(selected)


selected %>% count(location,wt = weight, sort = TRUE )


selected %>% count(body_part, wt = weight, sort= TRUE)


selected %>% count(diag, wt = weight, sort = TRUE)


summario <- selected %>% 
  count(age,sex, wt=weight)
summario

summario %>% 
  ggplot(aes(age, n, colour = sex)) +
  geom_line()+
  labs(y = "Estimated number of injuries")



summary <- selected %>% 
  count(age, sex, wt = weight) %>% 
  left_join(population, by = c("age", "sex")) %>% 
  mutate(rate = n / population * 1e4)
