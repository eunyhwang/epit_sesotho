# Prerequisites
Before you run epitweetr, you need these softwares. Please be aware of that you need to install the correct version of each. If you need more information about this, check out Epitweetr vignette.
- R version 3.6.3 or higher
- Java 1.8 eg. openjdk version “1.8” https://www.java.com/download/. In Mac, https://docs.oracle.com/javase/9/install/installation-jdk-and-jre-macos.htm
- Microsoft Visual C++ 2010 Redistributable Package (x64) https://www.microsoft.com/en-us/download/details.aspx?id=26999

# Instruction
## Download and install Anaconda
`wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-ppc64le.sh`

`bash https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-ppc64le.sh`

## Create a conda environment 
To run these codes, first modify the variables in the ```.env``` file to your own, then run them from the Anaconda prompt.
```
conda env create -f env.yml
conda activate epit
```
## Envrionment variable
```
Rscript setup_epit.R 
```
This line is to check if JAVA_HOME envrionment is setup and the R environment knows the path. If you get an error, you need to set the JAVA_HOME variable for your OS, please see your specific OS instructions.


## Launch epitweetr with 4 loops
```
python run_epit.py
``` 
This script launches the epitweetr Shiny app by executing four parallel loops (main_loop, detect_loop, search_loop, and fs_loop). Each loop script contains two lines ```proxy <- Sys.getenv("HTTPS_proxy")
hadoop <- Sys.getenv("HTTPS_hadoop")``` in order to set the path of proxy and hadoop. If you do not need this step, please mark the lines with a ```#```.

As a result of this line, you will see an address number (generally starting with https://127.) on your conda prompt. Copy and past the address on your web-browser. Then you will see a epitweetr dashboard.

Epitweetr requires that you have an account in order to collect data. Please feel free to choose a Twitter account or a Twitter developer account. Once the account has been created, put the account information on the dashboard. If you need more information, please check this link.(https://cran.r-project.org/web/packages/epitweetr/vignettes/epitweetr-vignette.html)

## Build up API
```
Rscript endpoint.R 
Rscript run_api.R
```
Following the collection of data, you can use these R scripts to build up API. In the result of ```run_api.R```, you will get a local API address. Paste it in your web-browser to view the API on Swagger. We have only 4 endpoints for basic functions of epitweetr; top_words, top_entities, create_maps, and trend_line. 

