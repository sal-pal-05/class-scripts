##10/07/2019

#exam 2= importing, summarizing, merging and reshaping

#Reshaping Data

getwd()
load(file="fish_data.Rdata")


f=fish
rm(fish)
names(f)
fs=f[c("transect.id", "parcel.id","area_fac","parcel.density.m3","parcel.length.m","depth_fac")]
head(fs)


##How to rename a field(or column)

library(tidyverse)
fs=rename(.data=fs, tid=transect.id)
names(fs)#"transect.id" is now "tid"

fs=rename(.data=fs, area=area_fac) ##in "fs" dataset, rename the "area_fac"="area
fs=rename(.data=fs, pid=parcel.id)
fs=rename(.data=fs, pden=parcel.density.m3)
fs=rename(.data=fs, dep=depth_fac)
fs=rename(.data=fs, plen=parcel.length.m)

names(fs)


##another way to rename columns
names(fs)[1]=c("tid")
names(fs)[1:3]=c('transect','a','z')

##reshaping data
##using the "melt" function(reshape2) to change your data frame from wide to long format.

library(reshape2)
fs.melt=melt(data=fs, id.vars=c("tid","pid","area","dep"), 
             measure.vars=c("plen","pden"))
##"id.vars"= categories we want to keep as columns (the ones we do NOT want transposed)

head(fs.melt)



##if data was in long format and we want to turn in=t back to wide format
##using"dcast" function (part of reshape2)

fs.cast=dcast(fs.melt, formula= tid~variable, value.var =c("numbers"), fun.aggregate=mean)
##"formula"= what headers you want to use to go wide

head(fs.cast)
names(fs)

##using "spread" and "gather" (tidyverse)
#gather is like "melt" long to wide

fs.gather=fs %>% group_by(tid, area, dep, pid) %>%
gather(key= "variable",value="value",plen, pden)

##"key" is what you wanna name the column, that the identifying info is gonna go into
###name of column w pd/pl in it
head(fs.gather)

## TBD=spread
fs.spread=fs.gather %>% spread(variable, value=)


##more melt
fs.m=melt(data=fs, id.vars=c("tid","area","dep"), 
             measure.vars=c("plen","pden"),value.names=c("data"))
head(fs.m)
str(fs.m)


##removing duplicates----

head(fs)
o1=fs[1,]
o2=fs[1,]
o3=fs[1,]
o4=fs[2:10,]

##bind these individual objects back together using "rbind" function

o=rbind(o1,o2,o3,o4)
o ##first 3 rows are duplicate observations

no.dups=o[!duplicated(o),] ##subset of o not duplicated(!)
no.dups
##pulling out the duplicates
dups=o[duplicated(o),]
dups##pulls out all the values that were duplicated

## "complete.cases" function
##returns lines were nothing is missing (no NAs allowed) only data with values will be displayed

##data with NAs

fs[2,]=NA
fs[4,]=NA

fs.complete=complete.cases(fs)
head(fs.complete)



fs.complete=fs[complete.cases(fs),]
head(fs.complete)

##sorting data----
attach(mtcars)



#sort by "mpg" and "cyl"

##using "order"
nd=mtcars[order(mpg),]
nd

##using the "arrange" function
nd.arrange=arrange(.data=mtcars, mpg) ##ascending order
nd.arrange

nd.arrange.desc##descending order


nd.m.c=arrange(.data=mtcars, mpg, cyl) #ascending

nd.m.c




