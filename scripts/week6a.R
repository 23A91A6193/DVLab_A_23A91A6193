
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


#labeled hexbin plot
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  labs(title='Hexagon Binning:Diamond Structure',x='carat',y='price')+
  theme_minimal()

# Control Hexagon Density
ggplot(diamonds,aes(carat,price))+
  geom_hex(bins=40)+
  scale_fill_gradient(low="lightgreen",high="red")+
  theme_minimal()

# Color Meaning
# Light-> Fewer Diamonds
# Dark -> dense Region

#Professional Palette (Virdis)
ggplot(diamonds,aes(carat,price))+geom_hex(bins=35)+scale_fill_viridis_c()+
  theme_minimal()
#add legend title

ggplot(diamonds,aes(carat,price))+geom_hex(bins=20)+
  scale_fill_viridis_c(name="Count")+
  labs(title = "Density Structure of Diamonds",x="Carat",y="Price")+
  theme_minimal()

#Faceted Hexbin
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  scale_fill_viridis_c()+
  facet_wrap(~cut)+
  theme_minimal()

#Log Scale Hexbin
ggplot(diamonds,aes(carat,price))+
  geom_hex()+
  scale_fill_viridis_c()+
  scale_y_log10()+
  theme_minimal()

#2d Density Alternative
ggplot(diamonds, aes(carat, price)) +
  geom_density_2d() +
  scale_y_log10() +
  theme_minimal()
