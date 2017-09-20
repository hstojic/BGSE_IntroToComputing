# ----------------------------------------------------------------------
# Information
# ----------------------------------------------------------------------

# This script produces figure that illustrates  
# percentage of seniors in each district

# see "seniorsPerDistrict.pdf" for how the final result should look like


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
} 

# font setup
fontSetup <- "Helvetica"
fontSize <- 10

# loading our processed data
load("dProcessed/procData.RData")

# set the name under which the figure will be saved
figurePathName <- "rFigs/seniorsPerDistrict"
 

# ----------------------------------------------------------------------
# Preparing the data for the plots
# ----------------------------------------------------------------------

# ----
# 1. Renaming the values in the District variable
# ----

# Use "unique" command to get the list of all district names in the dataset
YOUR-CODE

# Notice that some values, like "North Warwickshire" are quite long, this
# will not look good on a figure, so it would be good if we would shorten
# the names a bit. Change the following values in District variable:
# 
# "Stratford-on-Avon" -> "Strat. Avon"
# "Nuneaton & Bedworth" -> "Nun. Bedw."
# "North Warwickshire" -> "N. Warwick."

labels <- c(
    "Stratford-on-Avon" = "Strat. Avon",
    "Nuneaton & Bedworth" = "Nun. Bedw.",
    "North Warwickshire" = "N. Warwick."
)

# create a short for loop that would iterate over the labels vector
# check for those elements in the District variable (in the aging data frame)
# that have value on the left hand side (element names) and change it with 
# the value on the right hand side (elements in the labels vector)
for (i in names(labels)) {
    aging$District <- YOUR-CODE
}

# check the result using unique function

# you should get 
# [1] "Rugby" "Strat. Avon" "Nun. Bedw." "Warwick" "N. Warwick."


# ----
# 2. Compute the mean percentage of seniors in the whole dataset
# ----

meanSeniors <- YOUR-CODE


# ----------------------------------------------------------------------
# Producing a figure
# ----------------------------------------------------------------------

# ----
# 3. Using ggplot2 package, write a code that will generate the figure 
# ----

# - use the "aging" data frame
# - you will find more comments interspersed within figure code, 
#   ggplot figures consist of layers, each layer connected with + 
#   operator, e.g. layer that plots boxplots, layer that plots points etc

figure <- 
    ggplot(YOUR-CODE) + 

    # you need at least one layer to plot a figure with the ggplot
    # as a first layer we will plot the box plots of the distributions 
    # of observations for districts
    YOUR-CODE +
    
    # plot the points and apply the so called jitter - displace the 
    # position of points horizontally in random fashion
    YOUR-CODE +

    # set the names for the x and y axis
    # set the limits of the y axis to 0 to 50, and set the breaks
    # to go from 0 to 50 in steps of 5 
    scale_x_discrete(YOUR-CODE) + 
    scale_y_continuous(YOUR-CODE)  + 
    
    # create a horizontal illustrating the mean percentage of seniors
    # set it to the value you have computed above, "meanSeniors"
    geom_hline(YOUR-CODE) +
    
    # the figure already looks quite good, but you can use the "theme" to 
    # specify some details further, like color of the background etc
    # I use it to make the figures correspond more to Tufte's prescriptions
    # for good graphics (see https://www.edwardtufte.com/tufte/books_vdqi)
    theme(
        YOUR-CODE
    )


# ----------------------------------------------------------------------
# Saving the figure
# ----------------------------------------------------------------------

# ----
# 4. Save it in png format
# ----

# - first set the filename and its extension - png
# - then call the png device with this filename and print the figure,
#   you might want to check height, width and resolution parameters 
# - do not forget to turn off the device 

saveFileName <- paste0(figurePathName, ".png")
YOUR-CODE


# ----
# 5. save it in a PDF format
# ----

# - do the same as above, but now for pdf format, I recommend cairo_pdf 
#   device

saveFileName <- paste0(figurePathName, ".pdf")
YOUR-CODE
