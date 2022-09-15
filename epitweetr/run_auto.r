# Define functions
main_loop <- function(folder_dir, hadoop_dir, proxy_dir) {
    Sys.setenv(HTTPS_Proxy = proxy_dir)
    Sys.setenv(HADOOP_HOME = hadoop_dir)
    epitweetr_app(folder_dir)
}

detect_loop <-function(folder_dir, hadoop_dir, proxy_dir) {
    Sys.setenv(HTTPS_Proxy = proxy_dir)
    Sys.setenv(HADOOP_HOME = hadoop_dir)
    epitweetr::detect_loop(folder_dir)
}

search_loop <-function(folder_dir, hadoop_dir, proxy_dir) {
    Sys.setenv(HTTPS_Proxy = proxy_dir)
    Sys.setenv(HADOOP_HOME = hadoop_dir)
    epitweetr::search_loop(folder_dir)
}

detect_loop <-function(folder_dir, hadoop_dir, proxy_dir) {
    Sys.setenv(HTTPS_Proxy = proxy_dir)
    Sys.setenv(HADOOP_HOME = hadoop_dir)
    epitweetr::detect_loop(folder_dir)
}

run_epit <- function(folder_dir, hadoop_dir, proxy_dir) {
    #path = os.system(dir)
    library(epitweetr)
    print("it works")
    main_loop(folder_dir, hadoop_dir, proxy_dir)
    print("detect loop starts")
    detect_loop(folder_dir, hadoop_dir, proxy_dir)
    print("search loop starts")
    search_loop(folder_dir, hadoop_dir, proxy_dir)
    print("fs loop start")
    fs_loop(folder_dir, hadoop_dir, proxy_dir)
}

#set paths
epit_folder_dir <- "path"
set_proxy <- "path"
set_hadoop <- "path"

# Run epitweetr
library(epitweetr)
library(callr)
#library(subprocess) this package is not available anymore

#run_epit(folder_dir = epit_folder_dir, hadoop_dir = set_hadoop, proxy_dir = set_proxy)

#callr::r_bg(function(){
#    main_loop(folder_dir = epit_folder_dir, hadoop_dir = set_hadoop, proxy_dir = set_proxy);
#    detect_loop(folder_dir = epit_folder_dir, hadoop_dir = set_hadoop, proxy_dir = set_proxy);
#    search_loop(folder_dir = epit_folder_dir, hadoop_dir = set_hadoop, proxy_dir = set_proxy)
#    })

system(main_loop(folder_dir = epit_folder_dir, hadoop_dir = set_hadoop, proxy_dir = set_proxy), intern = FALSE, ignore.stdout = FALSE, ignore.stderr = FALSE, wait = FALSE)
system(detect_loop(folder_dir = epit_folder_dir, hadoop_dir = set_hadoop, proxy_dir = set_proxy), intern = FALSE, ignore.stdout = FALSE, ignore.stderr = FALSE, wait = FALSE)
system("search_loop(folder_dir = epit_folder_dir, hadoop_dir = set_hadoop, proxy_dir = set_proxy)", intern = FALSE, ignore.stdout = FALSE, ignore.stderr = FALSE, wait = FALSE)
