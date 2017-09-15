# load in the arguments 
args <- commandArgs(trailingOnly = TRUE)
if (!is.na(args[1])) {
    filename <- args[1]
}

# loading the package
library(ggplot2)

# load in the file
data <- read.csv("resultsFinal", header = FALSE)
data$Stock <- factor(rep(c("Apple", "Microsoft"), each = 30))
colnames(data) <- c("Date","Open", "Stock")
data$Date <- as.Date(data$Date, "%d-%b-%Y")

# create a small figure
cairo_pdf("plot.pdf")
ggplot(data = data, aes(x = Date, y = Open)) + geom_line(aes(colour = Stock))
dev.off()
