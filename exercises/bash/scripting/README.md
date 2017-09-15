# Exercise

Folder content:
- pipeline.sh 
- download.sh 
- genFigure.R 
- README.md


## Motivation

An advantage of shell is that it is a primary language of Unix OS, this means that it can connect various steps in your data analysis pipeline, where each step might rely on different programming language. Some more general languages (e.g.Python) would allow you to complete many tasks without having to resort to other languages, but you will often find that languages have specialties - python, for example, is very good for web scraping and text handling, while R is much better for statistics etc. This exercise will illustrate a pipeline where some data is downloaded through shell and some basic processing is done, then the results are passed to R to generate some figures based on the data.


## Instructions 

In all files you will find more detailed comments and instructions, spots where you are expected to do something and insert some code will be marked as: YOUR-CODE

1. Complete the file "download.sh". You will write a small shell program that downloads financial data from Yahoo Finance for specified number of stocks. 
2. Complete the file "pipeline.sh". You will write few lines of shell code that will do some further processing of the data downloaded from Yahoo.
3. Execute the file `pipeline.sh` by executing the following command in terminal, navigated to this directory:  `bash pipeline.sh`
