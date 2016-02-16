library(shiny)
library(ggplot2)
library(dplyr)

df1 <- read.csv("./data/births.csv", stringsAsFactors = FALSE)

names(df1) <- c("year", "race", "type", "tot_birth", "events", "percent")
