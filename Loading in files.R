#loading in file
#Excel files can be loaded with this package "xlsx"
install.packages("openxlsx")
library("openxlsx")
x=openXL(file="Aureila.csv")
d=read.table (file="Aureila.csv", sep=",", header=T, stringsAsFactors = F)
d
head(d)
str(d)


load (file="aurelia_15minCell_statareas.Rdata") # save files as R data sets, beuase it is easier and takes less space (than .csv)
str(a)
list.files("a")
#Aurelia text file
install.packages("data.table")
library(data.table)
d1= fread(input="aurelia_15minCell_statareas.txt", sep=",", header= T, stringsAsFactors=F)
head(d1)
d2=read.csv(file="aurelia_15minCell_statareas.txt", header=T, sep=",", stringsAsFactors=F)
head(d2)
d3=read.table(file="aurelia_15minCell_statareas.txt", sep=",", header= T, stringsAsFactors = F)
head(d3)
library(tidyverse) # helps you load multiple "tidyverse" packages at once
library(tidyv)
d4=read_csv(file="aurelia_15minCell_statareas.txt") # with "read_csv" you dont have to set header=T and stuff, it default sets the parameters for you
head(d4)
save(d4, file="aurelia_data.Rdata")
load(file="aurelia_data.Rdata")


#Excel Files
library(readxl)

e=read_xlsx(path="Aurelia_SEAMAP_2012-2018_30minCell.xlsx", sheet= 1, col_names=T )
head(e)


getwd()
list.files()
























