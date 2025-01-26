library(tidyverse)
Joe <- c(1,2,3)
Bill <- c("a","b","c")

TEST <- tibble(Joe,Bill)
names(TEST)

names(TEST) <- c("Mary","Ann")
names(TEST)

NewNames <- c("Marguerite","Petronilla")
names(TEST) <- NewNames
names(TEST)

MoreNames <- c("Dirk","Fred")
MORENAMES <- tibble(MoreNames)
names(TEST) <- MORENAMES$MoreNames
names(TEST)
