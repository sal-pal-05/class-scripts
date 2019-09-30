#Loading In Files

library(data.table)
library(tidyverse)
library(readxl)

# aurelia Rdata File
load(file="LAB4/aurelia_15minCell_statareas.Rdata")


#aurelia.CSV
read.csv("LAB4/Aureila.csv")

#ENVREC.CSV
read.csv("LAB4/ENVREC.csv")

#aurelia Excel
read_excel("LAB4/Aurelia_SEAMAP_2012-2018_30minCell.xlsx")
