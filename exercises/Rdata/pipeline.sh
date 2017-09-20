#!/bin/bash

# download the file and move it to the dRaw folder
wget http://opendata.s3.amazonaws.com/aging-population-2008.csv

# create dRaw/data folder if it doesnt exist, flag -p ensures the shell 
# doesn't stop the execution (otherwise if the folder already exists, it 
# will report an error and stop) and move the data there
mkdir -p dRaw/data
mv aging-population-2008.csv dRaw/data/rawData.csv


### Important!

# The following code be executed only after scripts "processData.R",
# "demographics.R", "chosenArms.R" and "explorationFeatSpace.R" are 
#  completed


### 1. Data cleaning 

# create dProcessed folder
mkdir -p dProcessed

# Call the R script that will process the data, create some
# useful variables etc. Finally, clean the directory. 
# We create also the log file that helps if there were errors in the execution
# (whenever you have print statements in R file, it will be printed out there)
Rscript dRaw/processData.R > log
rm -r dRaw/data 


### 2. Small data analysis 

# Call the R scripts that will create some summaries
mkdir -p rTables
Rscript cAnalysis/demographics.R > rTables/demographics


### 3. Basic figures 

# Create rFigs folder if it doesnt exist
mkdir -p rFigs

# Call the R scripts that will produce figure illustrating 
# percentage of seniors in each district
Rscript cFigs/seniorsPerDistrict.R > log

# Call the R scripts that will produce figure illustrating
# correlation between population size and percentage of seniors 
# This time we will pass variables/constants to R script that 
# will use them and modify the figure - variable DISTRICTS will determine
# for which districts we will plot the data. 
DISTRICTS="Rugby Warwick Stratford-on-Avon"
Rscript cFigs/corPopulationSeniors.R $DISTRICTS > log



