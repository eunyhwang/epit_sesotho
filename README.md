This repository is to document dataset, methods, and results of the NaLaA project. 

# Project Background

[NaLaA Project](https://ghpp.de/fileadmin/images/ueber-das-ghp/Datasheet_2021/Datasheet_21_CoGLo/NaLaA_CGP.pdf) (Natural Language Processing for Event-based Surveillance with Africa CDC) aims to improve event-based surveillance by utilizing [epitweetr](https://www.ecdc.europa.eu/en/publications-data/epitweetr-tool), the R-based tool developed by European CDC, and applying NLP techniques for African CDC. 

Event-based surveillance[^1] is one of two main public health surveillances; event-based surveillance and indicator-based surveillance. Both approachs intend to detect potential disease events from sources, but event-based surveillance is based on unofficial and unstructured sources such as media or social media whereas indicator-based surveillance is based on official and structured sources such as reports from public health providers or medical examination. In this project, we focus on event-based surveillance and try to improve it by detecting public health threats on tweetr data. 

The European Centre for Disease Prevention and Control (ECDC) developed an amazing early warning tool, named epitweetr, using data from Twitter, which collects, geolocates and aggregates tweets generating signals and email alerts.[^2] Epitweetr already provides more than 100 languages to detect public health threats. As our target language, Sesotho, is not one of them, we trained our own word embedding, updated the tool, and created an API for those who also want to use a minor language with epitweetr. 
[^1]: https://www.cdc.gov/globalhealth/healthprotection/gddopscenter/how.html 
[^2]: https://www.eurosurveillance.org/docserver/fulltext/eurosurveillance/27/39/eurosurv-27-39-5.pdf?expires=1671706916&id=id&accname=guest&checksum=E6DF591E6FBCCCE42CC0703C3E8A4AFE

# Prerequisites
Before you run epitweetr, you need to get **a Twitter account** as well as below-mentioned softwares. Please be aware of that you need to install the correct version of each software. For the further information about getting a Twitter account and the softwares, check out [Epitweetr vignette](https://cran.r-project.org/web/packages/epitweetr/vignettes/epitweetr-vignette.html).
- R version 3.6.3 or higher
- Java 1.8 eg. openjdk version “1.8” https://www.java.com/download/. In Mac, https://docs.oracle.com/javase/9/install/installation-jdk-and-jre-macos.htm
- Microsoft Visual C++ 2010 Redistributable Package (x64) https://www.microsoft.com/en-us/download/details.aspx?id=26999

# Installation
## Download and install Anaconda
First, you need to install Anaconda. If you are in Linux, use the lines below. If you're not, download Anaconda [here](https://www.anaconda.com/products/distribution).
```
wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-ppc64le.sh
bash https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-ppc64le.sh
```

## Create a conda environment 
After cloning the repo, run the below codes to create an environment named ```epit```. 
```
conda env create -f env.yml
conda activate epit
```
## Environment variables
From this step, make sure that you are in the ```epitweetr``` folder. In the folder, you will see the ```.env``` file which contains 3 variables: HTTPS_proxy, HADOOP_HOME, and DATA_PATH. HTTPS_proxy is to set your proxy server if you sit behind a firewall with proxy.  (generally, proxy servers look like this ```http://username:password@proxyAddress:port```). HADDOP_HOME is the path where your bianreis of your haddop is set after installing hadoop. DATA_PATH is the path where you install epitweetr and collect data, so use the path where you download this repository. Please modify the variables to your own first and continue to follow the instruction by executing the line.

```
Rscript setup_epit.R 
```
This script checks if JAVA_HOME envrionment is setup and the R environment knows the path. If you get an error, you need to set the JAVA_HOME variable for your OS, please see your specific OS instructions.


## Run epitweetr
```
python run_epit.py
```
Kindly remind you that you should be in the ```epitweetr``` folder to run this Python script. This script launches the epitweetr Shiny app by executing four parallel loops under ``` functions``` folder (main_loop, detect_loop, search_loop, and fs_loop). Each loop script contains two lines ```proxy <- Sys.getenv("HTTPS_proxy")
hadoop <- Sys.getenv("HTTPS_hadoop")``` in order to set the path of proxy and hadoop. If you do not have paths to set, set them as ```None```.

As a result of this line, you will see an address number (generally starting with https://127.) on your command prompt. Copy and past the address on your web-browser. Then you will see a epitweetr dashboard.

Epitweetr requires you to have an account in order to collect data. Please feel free to choose a Twitter account or a Twitter developer account. Once the account has been created, put the account information on the dashboard. If you need more information, please check [Epitweetr vignette](https://cran.r-project.org/web/packages/epitweetr/vignettes/epitweetr-vignette.html).

## Build up API
```
Rscript run_api.R
```
Following the collection of data, you can use the ```run_api.R``` script to build up an API. Simply open another command prompt, activate the conda environment, and run above line. This builds an API with endpoints decided in ```endpoint.r``` using Plumber, An API Generator for R. As a result, you will get a local API address. Paste it into your web-browser to view the API on Swagger. 

Here is the instruction of using the API for those who are not familiar with Swagger. You can also see sample screenshots in ```sample payload```.

0. It has four endpoints: top_words, top_entities, create_maps, and trend_line. 
1. Choose one endpoint and click "Try it out" on the right side, several parameters will be displayed to modify such as topic, country name, number, starting date and ending date.
2. Type a name of a disease (for this, please see the ```topics.xlsx``` file which contains a list of disease names), and set other parameters as you want.
3. Each endpoint will display tweets that mention the disease.  
 - ```top_words``` represents top words 
 - ```top_entities``` represents context, 
 - ```create_maps``` displays distributions of tweets
 - ```trend_line``` represents the trend in tweet numbers.

This is an example of the JSON payload in the create_map endpoint with "African Region" and "COVID-19". 

![image](https://user-images.githubusercontent.com/49271495/212721572-bf5dd134-21b1-4df7-90f3-43f35c6b3d6c.png)




# Sesotho Word Embedding for epitweetr
In order to detect public health threats in Lesotho region, we need to make epitweetr understand thier language, Sesotho. As epitweetr is developed with fasttext word embeddings, we also trained an word embedding in Sesotho via the fasttext model. 

## Dataset
When it comes to train a minor language with a lack of source, finding a proper dataset to train is challenging. We mainly used NCHLT Sesotho Text Corpora provided by [SADiLaR](repo.sadilar.org), which is a 10 Mb sized collection of text documents classified by genre. Below you can see the example of the dataset. 
![image](https://user-images.githubusercontent.com/49271495/212697419-c56a9744-b124-49ef-8de5-5acec83b8860.png)

## How we trained a fasttext word embedding in Sesotho language
We used the SADiLaR data for training our embedding and you can find the dataset in the folder under the ```fasttext/data``` folder. We did unsupervised learning as the dataset is not labeled, and used the cbow model to train following the kind advice of the provider of the dataset that cbow would high likely perform better than skipgram. Based on the result of a gridSearch, we set the parameters like this: epoch=25, lr=0.1, minCount=2, dim=300. In order to evaluate the performance, we did the neighbor test as well as the analogy test. 

## Upload a fasttext word embedding
The trained word embedding is uploaded named ```cbow_300.vec.gz``` to be used. You can upload this embedding into the epitweetr dashboard, then epitweetr start to use the lanugage to collect twitter data. 

# Final notes
## Create a R package
The project could be improved by wrapping it in an R package. It is always a good idea to create a package for R functions that you have written, so that they can be easily reused in other projects.
