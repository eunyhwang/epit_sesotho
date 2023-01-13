library(plumber)
library(ggplot2)
library(dplyr)
library(mapview)
library(rgdal)
library(dotenv)

load_dot_env()
data_path <- Sys.getenv("DATA_PATH")

pr("endpoint.R") %>%
pr_run(port=8000)
