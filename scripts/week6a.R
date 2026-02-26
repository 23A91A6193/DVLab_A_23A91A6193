#Load and Understand the DataSet
data(diamonds)
data(package=.packages(all.available = TRUE))
library(ggplot2)
data("diamonds")
str(diamonds)
dim(diamonds)
?diamonds

#Very basic Scatter'

plot(diamonds$carat,diamonds$price)

#improved Scatter
plot(diamonds$carat,diamonds$price,col=rgb(0,0,1,0.1),pch=16,
     main = "Scatter Plot: Carat Vs Price")
#Hexbin Using base r
install.packages('hexbin')

library(hexbin)
hb<-hexbin(diamonds$carat,diamonds$price,xbins = 40)
plot(hb,main="Hexbin Plot")

#basic hexbin using ggplot2

ggplot(diamonds,aes(x=carat,y=price))+
  geom_hex()
#labeled hexbin