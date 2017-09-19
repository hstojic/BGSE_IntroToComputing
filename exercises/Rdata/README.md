# Exercise

Folder content:  
- pipeline.sh  
- dRaw/processData.R  
- dProcessed/  
- cFigs/chosenArm.R   
- cFigs/explorationFeatSpace.R  
- cAnalysis/demographics.R  
- rFigs/  
- rTables/  
- README.md  


## Motivation

> "Your closest collaborator is you yourself six months from now" 
> 
> (some great wise person said)


As a first step in working with R we will do some cleaning of raw data, and put it into shape where we can more easily visualize it and potentially do some serious data analysis. We will use the Ageing Population file from the UK Open Data site [opendata.s3.amazonaws.com/aging-population-2008.csv](http://opendata.s3.amazonaws.com/aging-population-2008.csv). 

Couple of remarks. Note the structure of the folder; it's intentional, you should develop a template of a project directory that you will use in every project. This organization is one that I use, it allows for small gains in productivity, because every project will look the same and you will know where to find what. Do not underestimate these things, over the years you will spend a lot of time searching through folders, wondering where you have put certain analysis. Adopting a standardized organization of files will make your life easier and more productive.

Note that we will again have a master script, `pipeline.sh`, that will connect all the steps. Ideally, all of your outputs should be produced with executing a **single** command - in this case, `bash pipeline.sh`. This goes a long way to ensure **reproducibility** of your results. When you share the data with others - colleagues, collaborators, boss, or public - they can retrace the steps and get the same output far more easily, since there are no "manual" interventions along the processing pipeline. Reprodubility is the main reason for avoiding "point-and-click" interfaces.

Same as before, throughout the exercise you will use git version control. Initialize a git repo in this directory before you begin and commit the changes in the code as you go through the exercise. If you are using my course repository then git is already initialized and no need to initialize it in the current directory, you can simply start committing changes (you might want to do it on a new branch).


## Instructions 

In all files you will find more detailed comments and instructions, spots where you are expected to do something and insert some code will be marked as: YOUR-CODE. Recall to save your changes with the git version control system, after you are done with a chunk of code.

1. Complete the file `dRaw/processData.R`. You will write an R script that will clean the data file that `pipeline.sh` will download from the Internet. It will create a processed data file and place it into `dProcessed`. Note that raw data and processed data is kept separate, as a rule you would never want to overwrite the raw data and you should always record how did you go from raw to processed data.  
2. Complete the file `cAnalysis/demographics.R`. You will write a code that will do a small socio-demographic analysis and save the output in `rTables` folder.  
3. Complete files `cFigs/chosenArm.R` and `cFigs/explorationFeatSpace.R`. You will write a code that will produce two figures, each requiring some further processing and save the figures in `rFigs` folder. These scripts will require you to install some additional packages: 'ggplot2', 'dplyr' (loaded through `cFigs/graphicsUtils.R`).  
3. Finally, execute the file `pipeline.sh` by executing the following command in terminal, after you navigate to this directory:  `bash pipeline.sh`
