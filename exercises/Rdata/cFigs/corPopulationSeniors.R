# ----------------------------------------------------------------------
# Information
# ----------------------------------------------------------------------

# This script produces figure that illustrates the relationship between
# percentage of seniors in each district and total population

# see "corPopulationSeniors" for how the final result should look like


# ----------------------------------------------------------------------
# Loading packages, data and defining parameters
# ----------------------------------------------------------------------

# house cleaning
rm(list = ls())

# load packages 
library('ggplot2')

# if interactive, during the development, set to TRUE
interactive <- FALSE
if (interactive) {
    # change the working directory to your own
    setwd("/home/hstojic/Teaching/BGSE_DS_ITC_2017/solutions/Rdata")
    districts <- c("Rugby", "Warwick", "Stratford-on-Avon")
} 

# Load in the list of districts passed from the bash, pipeline.sh 
# this is useful as we can define all the parameters in the topmost
# script (e.g. pipeline.sh) and we do not hard code anything (or very little)
# in the lower level scripts, we have a single place where parameters are
# defined. Note that arguments are passed as strings. 
args <- commandArgs(trailingOnly = TRUE)
if (!is.na(args[1])) {
    districts <- args
}

# font setup
fontSetup <- "Helvetica"
fontSize <- 10

# loading our processed data
load("dProcessed/procData.RData")

# set the name under which the figure will be saved
figurePathName <- "rFigs/corPopulationSeniors"
 

# ----------------------------------------------------------------------
# Preparing the data for the plots
# ----------------------------------------------------------------------

# ----
# 1. Subset the data frame
# ----

# We filter out the districts that are not listed in districts variable. 
agingFiltered <- YOUR-CODE

# check the result, it should return TRUE
all(unique(agingFiltered$District) %in% districts)

# you should get 
# [1] TRUE


# ----------------------------------------------------------------------
# Producing a figure
# ----------------------------------------------------------------------

# ----
# 2. Using ggplot2 package, write a code that will generate the figure 
# ----

# - use the "agingFiltered" data frame
# - you will find more comments interspersed within figure code

figure <- 
    ggplot(YOUR-CODE) + 

    # you need at least one layer to plot a figure with the ggplot
    # as a first layer we will plot the observations as points 
    YOUR-CODE +

    # add a linear model fit to the data  
    YOUR-CODE + 

    # to plot scatter plot separately for each district, you can use
    # "facet_wrap", this is one of the biggest advantages of ggplot over 
    # base graphics
    facet_wrap(YOUR-CODE) +

    # set the names for the x and y axis
    # set the limits of the y axis to 1 to 4.5, and set the breaks
    # to go from 1 to 4.5 in steps of 0.5 
    YOUR-CODE + 
    YOUR-CODE + 
    
    # you can use the "theme" to specify some details further
    YOUR-CODE 


# ----------------------------------------------------------------------
# Saving the figure
# ----------------------------------------------------------------------

# ----
# 3. Save it in png format
# ----

# - first set the filename and its extension - png
# - then call the png device with this filename and print the figure,
#   you might want to check height, width and resolution parameters 
# - do not forget to turn off the device 

saveFileName <- paste0(figurePathName, ".png")
YOUR-CODE 


# ----
# 4. save it in a PDF format
# ----

# - do the same as above, but now for pdf format, I recommend cairo_pdf 
#   device

saveFileName <- paste0(figurePathName, ".pdf")
YOUR-CODE


