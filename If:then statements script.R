f=function () {
  x=1
  y=2
  z=3
  x+y+z+i
}

switchero.if.then=function (x) {
  if (x=="a")
  "camel"
  else if(x=="b")
    "bear"
  else if (x=="c")
    "alligator"
  else
    "moose"
}
a = 4
switchero.if.then(x=a)
switchero.if.then(x="a")

a=1; b=2; c=3
a=1; b=2; c=3;
a=1; b=2; c=5;


# class notes for 09/08/2019

a=c(2:14)
a
a[[3]] #pull out the 3rd number in the series, which is number 4
b=c("hello","cat","dog","pig","tacocat")
b[[5]]
b[5]

b[[4]] # pull out the 4th number in the series, which is number 4
b=list(b)
class(b)
typeof(b)
str(b)
m=matrix(data=1:12,nrow=4,ncol=3,
         dimnames=list(c("r1","r2","r3","r4"),c("c1","c2","c3")))
m
a.ray=array(data=1:24,dim=c(3,4,2))
array
a.ray
a.ray[2,3,2] #pull out number 12 from array >name of arary[row,column,data part]
a.ray[3,4,1]
a.ray
a.ray[[18]]
a.ray[[4]]

#data frames- most analagous to excel spreadsheets.

df=data.frame(a=c(1,2,3,4), b=c(1,2,3,4))
df.matrix=as.matrix(df) #convert DF to matirx with "as.matrix" command
df
df[3,2]
df[3,"b"]
df$b # $ pulls out values so pulling out all values for column "b"




#class 9/11/2019 time zones and indexing
load(file="fish_data.Rdata")
str(fish)
head(fish)
fish.e=fish[fish$area_fac=="East",]
unique(fish.e$area_fac)
e.lat=fish[fish$area_fac=="East",] $parcel.start.lat
dim(e.lat)
e.lat=fish[fish$area_fac=="East",] $parcel.start.lat[6] # the last part is the same s ",2" give me the 6th value in whatever column youre in
e.lat[6]
str(e.lat)
e.lat=fish[fish$area_fac=="East"& fish$depth_fac=="Shallow",] 
unique(fish.e$depth_fac)
fish_not_east=fish[fish$area_fac!="East"& fish$depth_fac!= "Shallow",]
unique(fish_not_east)

fish_lg_patch=fish[fish$parcel.length.m >= 20,]
summary(fish$parcel.length.m)

summary(fish_lg_patch$parcel.length.m)

fish_sm_patch=fish[fish$parcel.length.m <= 20,]
summary(fish_sm_patch$parcel.length.m)

v=c(1,1,2,0,3,2,0,1) # reated vector"v"
v
2%in%v #"in" is the number to the left present in v?
1<2 # R can do basic true false logic
1> c(0,1,2)  # R will unfoil each option individually, and tell you if each one is true  or false


c(1,2,3)==c(3,2,1) # still does each one and checks with corresponding one

c(1,2,3) %in% c(3,2,1) # are the numbers in the first character string preset in the 2nd one

#replacing Values


v # we want to remove the 0, which is in the 4th position
v[4]=5 # replaces the 0 in the 4th position to 5
v
v[c(1,3,5)]=c(1,1,1)
v
v[c(1,3,5)]
v
v[c(1,3,5)]= c(7,9,13) # replace the numbers in positions 1,3,5 (of vector v)with the numbers 7, 9 and 13

gc() # garbage collection- cleans up workspace

# how to find missing data or NAs
n=(c(NA,1:50)) #NA in the sequence
mean(n) # gonna give you NA as outpu bc blank value is present in sequence 1:50
mean(n, na.rm=T) # remove the NAs
n.a=n[which(is.na(n)),]
n.a

head(fish)

names(fish) #gives names of all columns

unique(fish$year)
fish$year[6]=NA # replaced the 6th value in "year" with NA
head(fish$year)

fish.no.na=fish[!is.na(fish$year),] # give me all the values from fish.na that do not have an NA

unique(fish.no.na$year) # show me the values in fish, under the column "year" that have no NA


#packages

install.packages("data.table")
install.packages(c("tidyverse","stringr","plyr","reshape2","grid","gridExtra","pastecs","lubridate"))  
packs=c("tidyverse","stringr","plyr","reshape2","grid","gridExtra","pastecs","lubridate")
n=length(packs)

for(i in 1:n){
  install.packages(packs[n])  # for loops, tells the computer to download each of the packages in the set"packs"we set the order of packages in the set "packs" earlier
}
packs[1]  #pull out the first package in te set of packages "packs"
packs[5] #pull out the 6th package in te set of packages "packs"

packs 

install.packages("devtools")
yes  
library(devtools)  
install_github("displayr/flipPlots")  


#updating packages  

update.packages(c("tidyverse","stringr","plyr","reshape2","grid","gridExtra","pastecs","lubridate")) 
1  

#Time Objects

getwd()

file=list.files(full.names=TRUE, pattern="ISIIS201405291242.txt")

d= read.table(file, sep="\t",skip=10, header=TRUE, fileEncoding="ISO-8859-1", stringsAsFactors=FALSE, quote="\"",check.names=FALSE, encoding="UTF-8",na.strings="9999.99")
date=scan(file,what="character", skip=1, nlines=1, quiet=TRUE)
date=date[2]
date
library(stringr)
date
mm=str_sub(string=date, start=1,end=2)
mm
yy=str_sub(date, 7, 8)
yy  
y=str_sub(date, -2, -1)
yy

dd=str_sub(date, 4, 5)
dd
head(d$Time) # time is also seen as a character string.






#study notes fro test 1


datafr=data.frame(a=c(1,2,3,4,5),b=c(6,7,8,9,5))
datafr
df=data.frame(a=c(1,2,3,4), b=c(1,2,3,4))
#converting a data frame )"datafr" to a matrix with one command
datafr.matrix=as.matrix(datafr)
datafr.matrix
datafr[4,1]
datafr[4,"a"]
datafr$b
unique(fish$area_fac)
unique(fish$area_fac=="East")
eastfish=fish[fish$area_fac=="East",]
eastfish
unique(eastfish$area_fac)
eastfish=fish[fish$area_fac=="East",]







#Vectors Contd....

v=c(1,1,2,0,3,2,0,1) # created vector"v"
v
2%in%v #"in" is the number to the left present in v?
1<2 # R can do basic true false logic
1> c(0,1,2)  # R will unfoil each option individually, and tell you if each one is true  or false
c(1,2,3)==c(3,2,1) # still does each one and checks with corresponding one

c(1,2,3) %in% c(3,2,1) # are the numbers in the first character string preset in the 2nd one


v # we want to remove the 0, which is in the 4th position
v[4]=5 # replaces the 0 in the 4th position to 5
vv
v[c(1,3,5)]=c(1,1,1)
v
v[c(1,3,5)]
v
v[c(1,3,5)]= c(7,9,13) # replace the numbers in positions 1,3,5 (of vector v)with the numbers 7, 9 and 13

vect=c(1,1,1,1,1,1,1,1)

vect[2]=0
vect
vect[c(1,3,5)]=c(7,8,9)
vect


unique(fish$year)
fish$year[6]=NA # replaced the 6th value in "year" with NA
head(fish$year)

fish.no.na=fish[!is.na(fish$year),] # give me all the values from fish.na that do not have an NA

unique(fish.no.na$year) # show me the values in fish, under the column "year" that have no NA

fish$year[8]=NA


ptch=fish[fish$parcel.type=="patch",] # in the dataset fish, find all the rows under the column"parcel.type" that have "patch"





dt=data.table(a=c(2,3,4,5,6),b=c(2,3,4,5,6))
install.packages("data.table")

library(data.table)
dt=data.table(a=c(2,3,4,5,6),b=c(2,3,4,5,6))
dt.matrix=as.matrix(dt)
dt.matrix
dt.matrix[4,1]


ptch=fish[fish$parcel.type=="patch"& fish$area_fac=="East",]
ptch


unique(fish$area_fac)
efish=fish[!fish$area_fac=="East",] # the exclamation point gives every other level other than "east" under the "area_fac" column
efish
c(1,2,3) %in% c(3,2,1)

'%candy%' = function (r,t){5*r+7*t}
2%candy%6

towfish=fish[fish$tow.depth=="w",]
towfish

patch1=fish[fish$parcel.type=="Patch",]
patch1
fish.depth=fish[fish$depth_fac=="Deep",]
type2=fish[fish$type_fac=="Patch",]
type2


class(fish$area_fac)
fish$area_fac=as.character(fish$area_fac)
class(fish$area_fac)
fish$area_fac=as.integer(fish$area_fac)
class(fish$area_fac)
fish$area_fac=as.factor(fish$area_fac)
class(fish$area_fac)

f=c(1:25)

f[6]

g=c("cat","dog","ant","toy")
g[[3]]
g[3]="zap"

g

#matrices
m=matrix(data=1:12, nrow=4, ncol=3)
m
m=matrix(data=1:12,nrow=4,ncol=3,
         dimnames=list(c("r1","r2","r3","r4"),c("c1","c2","c3")))



#arrays
a.ray=array(data=1:24,dim=c(3,4,2))
array
a.ray
a.ray[2,3,2] #pull out number 12 from array >name of arary[row,column,data part]
a.ray[3,4,1]
a.ray
a.ray[[18]]
a.ray[[4]]




# Class Notes 09/16/2019 TIME
setted


setwd("~/Desktop/R Local/class-scripts")
list.files(pattern=".txt", recursive = T) # recursive means to look withing any of the folders within the WD
list.files()

#read-in data from text file
file=list.files(full.names=TRUE, pattern=".txt") # remanimf the ISIIS201405.. file "file" for ease
d=read.table(file, sep="\t", skip=10, header=TRUE, fileEncoding="ISO-8859-1", stringsAsFactors=FALSE,quote="\"", check.names=FALSE, encoding="UTF-8", na.strings="9999.99") #"\t"= tab delimited, columns are separated by "tabs" and not commas
# skip=10 because real data starts on line 11, and upto 10=metadata(data about the file)
#header=TRUE means there are column names, FileEncoding =dont worry about it but INCLUDE IT
#stringsAsFactors= FALSE, means not to treat character strings as factors, because they could be numbers, characters etc.
# dont worry about quote, check.names, and encoding
#na.strings= 

d=read.table(file="ISIIS201405291242.txt", sep="\t", skip=10, header=TRUE, fileEncoding="ISO-8859-1", stringsAsFactors=FALSE,quote="\"", check.names=FALSE, encoding="UTF-8", na.strings="9999.99")
#"\t"= tab delimited, columns are separated by "tabs" and not commas
# skip=10 because real data starts on line 11, and upto 10=metadata(data about the file)
#header=TRUE means there are column names, FileEncoding =dont worry about it but INCLUDE IT
#stringsAsFactors= FALSE, means not to treat character strings as factors, because they could be numbers, characters etc.
# dont worry about quote, check.names, and encoding
# remove UTF-8 if the data isnt being read-in


d=read.table(file="ISIIS201405291242.txt", sep="\t", skip=10, header=TRUE, fileEncoding="ISO-8859-1", stringsAsFactors=FALSE,quote="\"", check.names=FALSE, encoding="UTF-8", na.strings="9999.99")

d

head(d)
tail(d, 10)
# create a proper date n time format
date=scan(file="ISIIS201405291242.txt", what="character", skip=1, nlines=1, quiet=TRUE)
# scan isis file and skip one line, look for character frtains and return one line
date #vector named "date" is created and data type is "character"
date=date[2] #indexing, saying only give us the 2nd part of the "date" vector
date #now, date only shows us the actual date and doesnt display "Date"  "05/29/14"

library("stringr") # first load the package you wanna use then you can use the package commands
mm=str_sub(string=date, start=1, end=2)
# look in character string"date" and we want the 1st and 2nd numbers which are"0 and 5" for "05" aka the month
mm
dd=str_sub(date, start=4, end=5) #day
dd
yy=str_sub(date, start=7, end=8) #year
yy
# so the "str_sub" basically tells R to sift through the "date" character string, and look for the start and end, value that you want to pick
#"05/29/14" has 8 values so to get mm, you will do start=1, end =2, for yy= start=7, end=8 etc.

dateNextDay=str_c(mm,as.character(as.numeric(dd)+1), yy, sep="/")
# make sure the "dd" is a numeric because youre adding "+1" to it, because you can only do math with a number and not a character

head(d)
str(d$Time)


d$hour=as.numeric(str_sub(d$Time, 1,2)) # making new field called"hour" in the data set "d"

d$minutes=as.numeric(str_sub(d$Time, 4,5))
# making new field called"minutes" in the data set "d"
d$seconds=as.numeric(str_sub(d$Time, 7,11)) # making new field called"seconds" in the data set "d"
head(d)


d$date=date
d$dateTime=str_c(d$date, d$Time, sep="")
d$dateTime=as.POSIXct(strptime(d$dateTime, format="%m/"))
d$constant=NULL







