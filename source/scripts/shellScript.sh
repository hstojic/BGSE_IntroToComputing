#!/bin/bash

# shell creates some variable
date=`date --date=-1day +%Y-%m-%d`

# then we run the R script and pass in the variables
Rscript script.R $date 10 40 training > log.txt