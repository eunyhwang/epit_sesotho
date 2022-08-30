#install.packages("vscDebugger")
#install.packages("plumber")
#install.packages("ggplot")
library(plumber)
library(ggplot2)

pr("endpoint.R") %>%
pr_run(port=8000)
#r <- plumb("endpoint.R")
#r$run(port = 5000)
