#loading in file
#Excel files can be loaded with this package "xlsx"
install.packages("openxlsx")
library("openxlsx")
x=openXL(file="Aureila.csv)
d=read.table (file="Aureila.csv", sep=",", header=T, stringsAsFactors = F)
d
head(d)
str(d)
