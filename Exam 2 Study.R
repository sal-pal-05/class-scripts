## Exam 2 Study

load(file="fish_data.Rdata")
f=fish
rm(fish)
library(tidyverse)
m.pd=tapply(f$parcel.density.m3, f$transect.id, mean)
df.pd=as.data.frame(m.pd)
df.pd
names(df.pd)
colnames(df.pd)= "mean pd"
names(df.pd)
rownames(df.pd)
rownames(df.pd)=transect
transect
rownames(df.pd)=NULL
df1=cbind(transect, df.pd)
df1

sd.pd=tapply(f$parcel.density.m3, f$transect.id, FUN=sd)
df.sd=as.data.frame(sd.pd)
df.sd
colnames(df.sd)="mean SD"
rownames(df.sd)= transect
rownames(df.sd)=NULL
df2=cbind(transect, df.sd)
df2

##merge

pd_merge= merge(df1,df2,by="transect")
pd_merge

count.pd=tapply(f$parcel.density.m3, f$transect.id, FUN=length)
df.count=as.data.frame(count.pd)
colnames(df.count)= "observations"
df.count
transect=rownames(df.count)
rownames(df.count)=NULL
df3=cbind( transect,df.count)
df3


##merging all 3 dfs
final.merge=merge(pd_merge, df3, by="transect")
final.merge


##summarize and join

mean_pd=f%>% group_by(transect.id) %>% summarize(parcel.density.m3 = mean(parcel.density.m3, na.rm=T))
mean_pd_df=as.data.frame(mean_pd)
colnames(mean_pd_df)[2]="mean PD"
mean_pd_df
colnames(mean_pd_df)[1]="transect"

sd_pd=f%>% group_by(transect.id) %>% summarize(parcel.density.m3 = sd(parcel.density.m3, na.rm=T))
sd_pd_df=as.data.frame(sd_pd)
colnames(sd_pd_df)[2]="Mean SD"
colnames(sd_pd_df)[1]="transect"
sd_pd_df

pd_join=full_join(mean_pd_df, sd_pd_df, by = "transect")
pd_join

count_pd=f%>% group_by(transect.id) %>% summarize(parcel.density.m3 = length(parcel.density.m3))
c_pd_df=as.data.frame(count_pd)
colnames(c_pd_df)[2]="Counts PD"
colnames(c_pd_df)[1]="transect"
c_pd_df

pd_join1=full_join(pd_join,c_pd_df, by="transect")
pd_join1

##freestyle 1
free1=tapply(f$parcel.length.m, f$area_fac, fivenum)
free1

free2=tapply(f$parcel.length.m, f$depth_fac, fivenum)
free2


##both together in single line of code

free3=tapply(f$parcel.length.m, INDEX=list(f$depth_fac, f$area_fac),fivenum)
free3


##time

d=read.table(file="ISIIS201405291242.txt", sep="\t", skip=10, header=TRUE, fileEncoding="ISO-8859-1", stringsAsFactors=FALSE,quote="\"", check.names=FALSE, na.strings="9999.99")
head(d)
names(d)
date=scan(file="ISIIS201405291242.txt", what="character", skip=1, nlines=1, quiet=TRUE)
date

library("stringr")
mm=str_sub(string=date, start=1, end=2)
typeof(mm)
dd=str_sub(string=date, start=4, end=5)
typeof(dd)
dd=as.numeric(dd)
typeof(dd)
yy=str_sub(string=date, start=7, end=8)
typeof(yy)

dateNextDay=str_c(mm,as.character(dd+1), yy, sep="/")
date
dateNextDay
d$Time

str(d$Time)
d$hour=as.numeric(str_sub(d$Time, 1,2))
d$min=as.numeric(str_sub(d$Time, 4,5))
d$sec=as.numeric(str_sub(d$Time, 7,11))

d$date=date
date
d$date
d$dateTime=str_c(d$date, d$Time, sep="")
d$dateTime

e.lat=f[!f$area_fac=="East" & !f$depth_fac=="Shallow",]
e.lat
zz=data.frame(a=c(1,2,3,4,5), b=c(6,7,8,9,5))
dt.matrix=as.matrix(zz)
dt.matrix
dt.matrix[4,1]="66"
dt.matrix

c(1,2,3)%in%c(3,2,1)
"%sal%"=function (r,t){2*r+5*t}
2%sal%4

v=c(1,2,3,4,2,3,1,9,7)
c(1,2,3)==c(3,2,1)
1>c(1,0,2)
v[4]=55
v
v[c(2,4,6)]=c(22,12,24)
v
m=matrix(data=1:12, nrow=4, ncol=3, dimnames=list(c("r1","r2","r3","r4"),c("c1","c2","c3")))
m
a.ray=array(data=1:24, dim=c(3,4,2))
a.ray

zxc=a.ray[2,3,2];cxz=a.ray[2,3,1]
zxc;cxz






