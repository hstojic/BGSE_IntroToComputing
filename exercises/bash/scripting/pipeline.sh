#!/bin/bash

# 1. execute your script download.sh
bash download.sh

# 2. output from download.sh should be a compressed file called
#    data.tar.gz
#  - decompress the data.tar.gz file 
YOUR-CODE

# 3. combine all the files in the "data" folder into a big file,
# - file that combines all of them should be named "results"
touch results
for f in YOUR-CODE
do
    echo $f

    # - remove the header row from each file,
    #   and add only the first 30 rows from it
    #   there are multiple ways to do this, tip: try a combination
    #   of tail and cat commands
    # - in each iteration you will add output to the "results" file
    YOUR-CODE >> results
done

# 4. we will use only the first 2 columns from the "results" file 
# - filter the "results" file with only the first 2 columns
#   the end result should look as follows:
#   
#   27-Oct-16,115.39
#   26-Oct-16,114.31
#   and so on
# 
# - name the resulting file "resultsFinal" and place in the same folder 
#   as pipeline.sh 
cut YOUR-CODE results > resultsFinal

# - finally, clean the iterim files, delete data folder, compressed 
#   data folder and results file
rm -r data* results

# 5. we will now produce some figures with R, using the data produced above, 
#    note you will need to have ggplot2 package installed
#    in R execute following: install.packages("ggplot2")
Rscript genFigure.R resultsFinal











