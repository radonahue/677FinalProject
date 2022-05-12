library(openxlsx)
library(reshape)
library(car)
library(fitdistrplus)
library(ggplot2)
library(dplyr)

data<-read.xlsx("Illinois_rain_1960-1964.xlsx")
d<-na.omit(melt(data))

q<-qqPlot(d$value)
#This is the qqplot, which I feel like points to an exponential distribution?

t<-rexp(227, 3.0)
qqPlot(t)

#This looks similar to fake exponential data, so exponential is probably it.


mledist(d$value, "exp")
#getting lambda 




ggplot(data=d, aes(x=variable, y=value))+geom_boxplot()+stat_summary(fun=mean, geom="point", shape=23, size=4)
#Running a boxplot to make statements about yearly differences

d%>%group_by(variable)%>%summarise(count=n())
