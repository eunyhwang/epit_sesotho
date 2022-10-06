# Prerequisites
Before you run epitweetr, you need these softwares. Please be aware of that you need to install the correct version of each. If you need more information about this, check out Epitweetr vignette.
- R version 3.6.3 or higher
- Java 1.8 eg. openjdk version “1.8” https://www.java.com/download/. In Mac, https://docs.oracle.com/javase/9/install/installation-jdk-and-jre-macos.htm
- Microsoft Visual C++ 2010 Redistributable Package (x64) https://www.microsoft.com/en-us/download/details.aspx?id=26999

# Installation
## Download and install Anaconda
`wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-ppc64le.sh`

`bash https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-ppc64le.sh`

## Create a conda environment and run scripts
Before running the codes below, please modify the variables in the .env file to your own first and run the codes on the Anaconda prompt. As a result, you will get a local API address, copy and paste to try the API in Swagger.
```conda create -n epit_api python=3.6
conda activate epit_api
pip install R

Rscript setup_epit.R #setup the epitweetr env
python run_epit.py #launch epitweetr with 4 loops
Rscript endpoint.R #build up API
Rscript run_api.R```
