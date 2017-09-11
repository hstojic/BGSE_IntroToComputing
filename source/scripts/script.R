# tell R to receive arguments passed by the shell
options(echo=TRUE) 
args <- commandArgs(trailingOnly = TRUE)

# lets see what we have passed
print(args)

date <- as.Date(args[1])
par1 <- as.numeric(args[2])
par2 <- as.numeric(args[3])
name <- args[4]

# save some processing
x <- rnorm(1000, mean=par1, sd=par2)
pdf(paste(name,".pdf", sep=""))
plot(x)
title(main=as.character(date))
dev.off()

summary(x)