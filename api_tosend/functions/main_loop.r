library(dotenv)
load_dot_env()

proxy <- Sys.getenv("HTTPS_proxy")
hadoop <- Sys.getenv("HADOOP_HOME")
data_path <- Sys.getenv("DATA_PATH")

Sys.setenv(HTTPS_Proxy = proxy)
Sys.setenv(HADOOP_HOME = hadoop)
print("main_loop starts")
library(epitweetr)
epitweetr_app(data_path)