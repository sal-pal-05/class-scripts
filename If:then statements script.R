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





