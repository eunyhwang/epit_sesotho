#install.packages("vscDebugger")
#install.packages("plumber")
#install.packages("ggplot")
#install.packages("mapview")
#install.packages("rgdal")
#install.packages("dplyr")
library(plumber)
library(ggplot2)
library(dplyr)
library(mapview)
library(rgdal)

pr("endpoint.R") %>%
pr_run(port=8000)