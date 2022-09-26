#install.packages("dotenv")
library(dotenv)
setwd("S:/Forschungsdaten/Zig/ZiG1/epit_trial_final/run_epit")
load_dot_env()

proxy <- Sys.getenv("HTTPS_proxy")
hadoop <- Sys.getenv("HTTPS_hadoop")
data_path <- Sys.getenv("DATA_PATH")

Sys.setenv(HTTPS_Proxy = proxy)
Sys.setenv(HADOOP_HOME = hadoop)
print("detect_loop starts") 
epitweetr::detect_loop(data_path)