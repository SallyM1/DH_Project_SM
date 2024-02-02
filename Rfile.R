getwd()
setwd( "C:/Users/sally/OneDrive/Desktop/Digital Health/DH_Project_SM/alcohol_deaths.csv")

library(pacman)


pacman::p_load(
  rio,
  here,
  dplyr,
  epikit,
  forcats,
  readr,
  styler,
  tidyverse,
  janitor
)

library(readr)
alcohol_deaths <- read_csv("alcohol_deaths.csv")

alcohol_deaths <- alcohol_deaths[, -1]

alcohol_deaths$region <- gsub(" ", "_", alcohol_deaths$region)

column_class <- class(alcohol_deaths$year)
print(column_class)

column_class <- class(alcohol_deaths$region)
print(column_class)

column_class <- class(alcohol_deaths$deaths)
print(column_class)


