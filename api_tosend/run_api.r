#install.packages('vscDebugger', repos='http://cran.us.r-project.org')
#install.packages('plumber', repos='http://cran.us.r-project.org')
install.packages('ggplot2', repos='http://cran.us.r-project.org')
#install.packages('mapview', repos='http://cran.us.r-project.org')
#install.packages('rgdal', repos='http://cran.us.r-project.org')
#install.packages('dplyr', repos='http://cran.us.r-project.org')
#install.packages('dotenv', repos='http://cran.us.r-project.org')
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