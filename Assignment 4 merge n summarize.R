##10/08/2019
##Lab 4: Summarizing and Merging

library("tidyverse")
load(file="fish_data.Rdata")
f=fish;rm(fish)
##mean pd
m.pd=tapply(f$parcel.density.m3, f$transect.id, mean) ## find the mean of ‘parcel.density.m3’ for each transect and assign the outcome to an object.
m.pd
m.df=as.data.frame(m.pd)##Convert the object to a data frame
m.df
colnames(m.df)="mean pd"##Rename the column with the density values to something more descriptive
m.df
transect <- rownames(m.df)
rownames(m.df)=NULL
bind=cbind(transect, m.df) ##Rename the column with the density values to something more descriptive
bind
##standard deviation pd
sd.pd=tapply(f$parcel.density.m3, f$transect.id, sd)
sd.pd
sd.df=as.data.frame(sd.pd)
sd.df
colnames(sd.df)="SD pd"
sd.df
transect=rownames(sd.df)
rownames(sd.df)=NULL
bind2=cbind(transect, sd.df)
bind2

##merging the two data frames together

pd.merge=merge(x=bind, y=bind2, by="transect")
pd.merge


##finding the count of observations for each transect for ‘parcel.density.m3’’.

count.pd=tapply(f$parcel.density.m3, f$transect.id, length)
count.df=as.data.frame(count.pd)
count.df
colnames(count.df)="count pd"
transect=rownames(count.df)
rownames(count.df)=NULL
bind3=cbind(transect, count.df)
bind3

##Using the merge function, combine the data frames with the mean and standard deviation to create one, new data frame that has three columns (mean density, sd density, count, and transect).

pd.merge.2=merge(x=pd.merge, y=bind3, by="transect")
pd.merge.2

##summarize and join

##mean

mpd=f%>% group_by(transect.id) %>% summarize(parcel.density.m3 = mean(parcel.density.m3, na.rm=T))
mpd
##Convert the object to a data frame

mpd.df= as.data.frame(mpd)
mpd.df

##Rename the column with the density values to something more descriptive.
colnames(mpd.df)[2]="group mean pd"
mpd.df
##Assign the row names of the data frame to be the values in a new field “transect”.
names(mpd.df)
colnames(mpd.df)[1]="transect"
mpd.df


##standard Deviation

sdpd=f%>% group_by(transect.id) %>% summarize(parcel.density.m3 = sd(parcel.density.m3, na.rm=T))
sdpd.df= as.data.frame(sdpd)
sdpd.df
colnames(sdpd.df)[2]="group sd pd"
sdpd.df
colnames(sdpd.df)[1]="transect"

##Using the join function (tidyverse package), combine the data frames with the mean and standard deviation to create one, new data frame that has three columns (mean density, sd density, transect)

pd.merge3=full_join(mpd.df, sdpd.df, by = "transect")
pd.merge3


##Find the count of observations using groupby and summarize

c.pd=f%>% group_by(transect.id) %>% summarize(parcel.density.m3 = length(parcel.density.m3))
c.pd
cpd.df= as.data.frame(c.pd)
cpd.df
colnames(cpd.df)[2]="group count pd"
colnames(cpd.df)[1]="transect"
cpd.df

##Using the join function, combine the data frames with the mean and standard deviation to create one, new data frame that has three columns (mean density, sd density, count, and transect).

pd.merge4=full_join(cpd.df, pd.merge3, by = "transect")
pd.merge4



##Free Style

##Select an 2 fields (e.g. area, depth, year, transect) in the fish_data.Rdata to group by. Find the minimum, lower 95%, median, mean, upper 95%, and maximum values for parcel.length.m.



##group by "area_fac"

freestyle1=tapply(X=f$parcel.length.m, INDEX= list(f$area_fac), FUN = fivenum)
freestyle1


##group by "depth"
freestyle2=tapply(X=f$parcel.length.m, INDEX= list(f$depth_fac), FUN = fivenum)
freestyle2

##group by "depth" and "area_fac" together
freestyle3=tapply(X=f$parcel.length.m, INDEX= list(f$depth_fac, f$area_fac), FUN = fivenum)
freestyle3
freestyle3[2,2]

getwd()






