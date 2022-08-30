#install.packages("vscDebugger")
#install.packages("plumber")
#install.packages("ggplot")
#install.packages("mapview")
#install.packages("rgdal")
library(plumber)
library(ggplot2)
library(mapview)
library(rgdal)

pr("endpoint.R") %>%
pr_run(port=8000)
#r <- plumb("endpoint.R")
#r$run(port = 5000)
