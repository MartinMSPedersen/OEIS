library(stringi)
library(magrittr)

load("kolakoski-10mil.rda")

kolakoski %<>% stri_flatten %>%
	gsub("11","A",.) %>%
	gsub("22","B",.) %>%
	gsub("12","C",.) %>%
	gsub("21","D",.)

save(kolakoski,file = "kolakoski-compress.rda")
