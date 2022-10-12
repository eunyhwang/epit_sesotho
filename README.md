# Prerequisites
Before you run epitweetr, you need these softwares. Please be aware of that you need to install the correct version of each. If you need more information about this, check out Epitweetr vignette.
- R version 3.6.3 or higher
- Java 1.8 eg. openjdk version “1.8” https://www.java.com/download/. In Mac, https://docs.oracle.com/javase/9/install/installation-jdk-and-jre-macos.htm
- Microsoft Visual C++ 2010 Redistributable Package (x64) https://www.microsoft.com/en-us/download/details.aspx?id=26999

# Instruction
## Download and install Anaconda
```
wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-ppc64le.sh
bash https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-ppc64le.sh
```
First, install Anaconda with theses codes.

## Create a conda environment 
After donwlodaing the ZIP file, unzip it and run the below codes to create an environment named ```epit```. 
```
conda env create -f env.yml
conda activate epit
```
## Envrionment variable
From this step, go under the ```api_tosend``` folder, and modify the variables in the ```.env``` file to your own which is about the path of proxy, the path of hadoop, and the path of the epitweetr folder you want to work. Now, continue to follow the instruction by executing the line. 
```
Rscript setup_epit.R 
```
This line is to check if JAVA_HOME envrionment is setup and the R environment knows the path. If you get an error, you need to set the JAVA_HOME variable for your OS, please see your specific OS instructions.


## Launch epitweetr with 4 loops
```
python run_epit.py
``` 
This script launches the epitweetr Shiny app by executing four parallel loops under ``` functions``` folder (main_loop, detect_loop, search_loop, and fs_loop). Each loop script contains two lines ```proxy <- Sys.getenv("HTTPS_proxy")
hadoop <- Sys.getenv("HTTPS_hadoop")``` in order to set the path of proxy and hadoop. If you do not need this step, please mark the lines with a ```#```.

As a result of this line, you will see an address number (generally starting with https://127.) on your conda prompt. Copy and past the address on your web-browser. Then you will see a epitweetr dashboard.

Epitweetr requires you to have an account in order to collect data. Please feel free to choose a Twitter account or a Twitter developer account. Once the account has been created, put the account information on the dashboard. If you need more information, please check this link.(https://cran.r-project.org/web/packages/epitweetr/vignettes/epitweetr-vignette.html)

## Build up API
```
Rscript endpoint.R 
Rscript run_api.R
```
Following the collection of data, you can use these R scripts to build up API. In the result of ```run_api.R```, you will get a local API address. Paste it in your web-browser to view the API on Swagger. 

Here is the instruction of using the API for those who are not familiar with Swagger.

0. It has four endpoints at the moment: top_words, top_entities, create_maps, and trend_line. By default, the region is set as Lesotho or African Region, and the period is set from 1st to 30th of August.
1. Choose one endpoint and click "Try it out" on the right side, a few parameters will be displayed but only "disease name" is available to be modified for now.
2. Type a name of a disease (for this, please see the ```topics.xlsx``` file which contains a list of disease names).
3. Each endpoint will display tweets that mention the disease; top_words represents top words, top_entities represents context, create_maps displays distributions of tweets, and trend_line represents the trend in tweet numbers.

