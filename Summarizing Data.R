


#Summarizing Data 
library("tidyverse")
install.packages("nutshell")
library("nutshell")

#DAta we will be using today
d= data("batting.2008")
d=batting.2008

#tapply------(tidyverse function) how do you want to summarize your data


#Find sum of all values
hr=tapply(X=d$HR, INDEX= list(d$teamID), FUN = sum)

#find quantile values
## fivenum gives you: min, lower quantile (hinge) median, upper quantile (hinge), and max value
hr.q=tapply(X=d$HR, INDEX= list(d$teamID), FUN = fivenum)

lg.q=tapply(X=(d$H/d$AB), INDEX= list(d$lgID), FUN = fivenum)
quantile(d$H/d$AB, na.rm=F)
#one category summary
summary(d[d$lgID=="AL",] $H/d[d$lgID=="AL",]$AB) #subsetting and pulling out "hits", and subsetting and pullong out"at bats" in one line of code


#using tapply to summarize over multiple categories
#2 category summary
bats=tapply(X=d$HR, INDEX=list(d$lgID, d$bats), FUN=mean)
#3 category summary
bats.team=tapply(X=d$HR, INDEX=list(d$lgID, d$teamID,d$bats), FUN=mean)
#only use tapply when trying to find the upper CI for 2 vectors

##aggregate function----

team.stats=aggregate(x=d [,c("AB", "H","BB","2B","HR")], by=list(d$teamID),FUN=sum)
str(team.stats)
team.stats

team.stats.sum=aggregate(x=d [,c("AB", "H","BB","2B","HR")], by=list(d$teamID),FUN=sum)
str(team.stats)


team.stats.mean=aggregate(x=d [,c("AB", "H","BB","2B","HR")], by=list(d$teamID),FUN=sum)
str(team.stats)
team.stats.mean


## tidyverse function  "summarize()"----
#pipe = string lines of code together in one line="%>%"="passes output from whats on the left to the right"(from data frame "d" to the next function ,"y")
team.sum = d %>%  group_by(teamID) %>% summarize (ABsum = sum(AB), ABmean=mean(AB),ABsd=sd(AB), ABcount=n())
head(team.sum) ##created 5 new columns in onle line of code, from a dataset
str(team.sum) #tidyverse creates a unique table type that is both a table, and a DF.

#added another column, "lgID"
lg.team.sum = d %>%  group_by(lgID,teamID) %>% summarize (ABsum = sum(AB), ABmean=mean(AB),ABsd=sd(AB), ABcount=n())
lg.team.sum


#rowsum----
#when you just want to add up the values in each row

rs=rowsum(d[c("AB","HR","2B","H","3B")], group=d$teamID)


#counting variables----
#using the "tabulate" function

HR.cnts=tabulate(d$HR)
HR.cnts

#labelling HR.cnts
#notes on "names" function--
m= matrix(nrow=4, ncol=3)
m
colnames(m)=c('one','two','three')
rownames(m)=c("apple","pear","orange","berry")
m

#labelling HR.cnts
names(HR.cnts)=0:(length(HR.cnts) -1) 
names(HR.cnts)
HR.cnts

##table function----
table(d$bats)
table(d[,c("bats","throws")]) #giving it different categories
HR.cnts

##Reshaping/Transposing Data----

n=matrix(1:10, nrow=5)
n
t(n)#columns have now become the rows, using transpose"t" function.

#"stack" and "unstack" functions to reshape data

names(d)
s=d[,c("teamID","lgID","HR","throws","AB")]
head(s)
s.un=unstack(x=s, form = teamID ~ HR)
s.un

s.un=unstack(x=s, form = HR ~ AB)
head(s.un)

#melt and cast---- using "reshape2" package
library(reshape2)

#data is in LONG format and we wanna put it in WIDE formate, using "cast"

s.wide= dcast(data = s, value.var= "HR", formula = "lgID" ~"teamID",fun.aggregate = mean)
s.wide


























































