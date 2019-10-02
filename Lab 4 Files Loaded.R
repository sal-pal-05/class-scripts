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

#09/30/2019 Class Notes
load(file="fish_data.Rdata")
f=fish

#subsetting
unique(f$depth_fac)
fd=f[f$depth_fac == "Deep",] #indexing by condition
unique(fd$depth_fac)# only shows "deep"

fd2=subset(x=f, depth_fac=="Deep") #indexing with "subset" function
fd2
library(dplyr)
fd3=filter(.data=f, depth_fac =="Deep") # indexing with "filter"(dplyr) function

fd4=subset(x=f, depth_fac=="Deep", select=c("transect.id", "area_fac"))

fd5=f[which(f$depth_fac=="Deep" & f$area_fac=="East" & f$yr_fac=="2014"),]

head(fd5)



#shallow tows
#east
#patches

fs=f[f$depth_fac == "Shallow",]
unique(fs)
fs2=subset(x=f, depth_fac=="Shallow")

fe=f[f$area_fac=="East",]
fe2=subset(x=f, area_fac=="East")


parc=f[f$parcel.type=="patch",]
parc2=subset(x=f, parcel.type=="patch")



#subset & then combine using rowbind "rbind" function

d1=f[which(f$depth_fac=="Deep" & f$area_fac=="East" ),]
d2=f[which(f$depth_fac=="Shallow" & f$area_fac=="West" ),]

nrow(d1)
nrow(d2)
nrow(d1) + nrow(d2)
n#combine d1 and d2 into a single data frame
d3=rbind(d1,d2)
nrow(d3)


#combine data frames with separate columns into a single data frame
c1=subset(x=f, depth_fac=="Deep", select=c("transect.id", "area_fac"))
c2=subset(x=f, depth_fac=="Deep", select=c("depth_fac", "parcel.length.m", "group"))
head(c1)
head(c2)

c3=cbind(c1,c2) # only use "cbind" if number of levels between each data frame is the same, so only use this (cbind) if the 2 datasets match up PERFECTLY
head(c3) # all 5 columns are combined together now.

#merging data frames, ensuring that observations from one df are connected with observations in the 2nd df correctly (merging two data tables together)

m1=subset(x=f, depth_fac=="Deep", select=c("transect.id", "area_fac"))
m1$seq=seq(1,nrow(m1),1) # making a new column to align data

m2=subset(x=f, depth_fac=="Deep", select=c("transect.id","depth_fac", "parcel.length.m", "group"))
m2$seq=seq(1,nrow(m2),1)# making nww column
head(m1)
head(m2) #"transect.id are present in both dfs m1 and m2 (unique identifier=transect id)

## merge

mt=merge(x=m1, y=m2, by = "seq")
nrow(m1) + nrow(m2)
nrow(mt)
head(mt)
nrow(mt)

##Join
library(dplyr)
mj=dplyr::right_join(x=m1, y=m2, by= "seq")

v=seq(5, 20, 0.5)
v
vc=cut(x=v, breaks=seq(5,20,1) , include.lowest=T)
vc








