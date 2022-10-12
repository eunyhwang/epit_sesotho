# Prerequisites
Before you run epitweetr, you need these softwares. Please be aware of that you need to install the correct version of each. If you need more information about this, check out Epitweetr vignette.
- R version 3.6.3 or higher
- Java 1.8 eg. openjdk version “1.8” https://www.java.com/download/. In Mac, https://docs.oracle.com/javase/9/install/installation-jdk-and-jre-macos.htm
- Microsoft Visual C++ 2010 Redistributable Package (x64) https://www.microsoft.com/en-us/download/details.aspx?id=26999

# Installation
## Download and install Anaconda
`wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-ppc64le.sh`

`bash https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-ppc64le.sh`

## Create a conda environment 
Before running the codes below, please modify the variables in the ```.env file``` to your own first and run the codes on the Anaconda prompt. As a result, you will get a local API address, copy and paste to try the API in Swagger.
```
conda env create -f env.yml
conda activate epit
```
## Envrionment variable
```Rscript setup_epit.R ```
This line is to check whether the R environment knows the path of the Java installation home. 

## Launch epitweetr with 4 loops
```python run_epit.py``` 
As a result of this line, you will see an address number(generally starting with https://127.X.X.X) on your conda prompt. Copy and past the address on your web-browser. Then you will see a epitweetr dashboard.

In order to collect data via epitweetr, you need an account. Feel free to choose a Twitter account or a Twitter developer account. After creating an account, put the information on the dashboard. You can find the information more in detail here.

## Build up API
```
Rscript endpoint.R 
Rscript run_api.R
```
# Scripts explained
## setup_epit.R
This file is written in R, which aims to setup the environment to run the epitweetr and to check if JAVA_HOME envrionment setup. If you get an error, you need to set the JAVA_HOME variable for your OS, please see your specific OS instructions.

## run_epit.R
This python scripts lauches the epitweetr Shiny app by executing four loops(main_loop, detect_loop, search_loop, and fs_loop) in pararellel. In order to use the paths as variables, please modify the text file(".env") with adujusting to your directory paths. 

## endpoint.R & run_api.R
Here are endpoints for basic functions of epitweetr; top_words, top_entities, create_maps, and trend_line. 
