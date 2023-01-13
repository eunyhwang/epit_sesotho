setup_epit <- function(){ 
    install.packages("epitweetr")
    # check if JAVA_HOME environment set up 
    result <- Sys.getenv("JAVA_HOME")
    if (is.null(result) == TRUE) {
    print("You need to set the JAVA HOME environment variable")
    } else {print("go on")}
}

setup_epit()
