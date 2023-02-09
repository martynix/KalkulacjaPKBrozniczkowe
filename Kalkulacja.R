############# PROJEKT - ROWNANIA ROZNICZKOWE  #############
############# KALKULACJA PRZYSZLEGO GDP (PKB) #############

setwd("C:/Users/marty/Desktop/p rozniczkowe") 

#install.packages("deSolve", dependencies = TRUE)
#install.packages("tidyverse", dependencies = TRUE)
library(deSolve)
library(tidyverse)
library(readr)
library(plotrix)
library(RColorBrewer)
library(ggplot2)
library(dplyr)
library(plotly)
library(gganimate)
library(gifski)
library(av)
#import_roboto_condensed()
library(hrbrthemes)
hrbrthemes::update_geom_font_defaults()
options(scipen = 999) #wymuszenie niestosowania notacji naukowej

#dane pobrane z data.worldbank.org
current_gdp <- read_delim("current_gdp.csv",col_names = TRUE)
current_gdp <- as.data.frame(current_gdp)
row.names(current_gdp) <- current_gdp[,1]
current_gdp <- current_gdp[,-1]

gdp_rate <- read_delim("gdp_rate.csv",col_names = TRUE)
gdp_rate <- as.data.frame(gdp_rate)
row.names(gdp_rate) <- gdp_rate[,1]
gdp_rate <- gdp_rate[,-1]

#funkcja liczaca kalkulacje na nastepne lata
calculation <- function(year,gdp,growth_rate){
  growth_rate <- growth_rate * 0.01 #zamiana na procenty
  calc <- gdp[1] * growth_rate
  return(list(calc))
}

yr <- 0:10 #lata kalkulacji
g0 <- current_gdp["Poland","2021"] #poczatkowe gdp (pkb) W DOLARACH- wybrac kraj, rok zostawic
rat <- gdp_rate["Poland","2021"] #growth rate - - wybrac kraj, rok zostawic

future_gdp <- ode(y = g0, times = yr, func = calculation, parms = rat)

#plot(yr, future_gdp[,2], type="o")


my_colors = brewer.pal(8, "Set2") 

rok<-yr+2021
GDP<-future_gdp[,2]/1000000000000 #w trylionach

par(mar=c(4,4,2,2))
clplot(rok, GDP, main="GDP w trylionach od roku 2021", lwd=5, levels=c(0.5,1,1.5,2), col=my_colors, showcuts=T , bty="n")

future_gdp1 <- data.frame(future_gdp)
colnames(future_gdp1) <- c("rok","GDP")
ft<-future_gdp1$rok+2021
future_gdp1[,1]=ft
rt<-future_gdp1$GDP/1000000000000
future_gdp1[,2]=rt



p <- future_gdp1 %>%
  ggplot( aes(x=rok, y=GDP)) +
  geom_line(color="#FCA0D4") +
  ylab("GDP w trylionach") +
  theme_ipsum()
warnings()
#zamiana w interaktywny wykres
p <- ggplotly(p)
p



#interaktywny wykres-gif
interactive<-ggplot(future_gdp1, aes(rok, GDP, size = rok, color = GDP)) +
  geom_point() +
  scale_x_log10() +
  theme_bw() +
  # gganimate specific bits:
  labs(title = 'Rok: {frame_time}', x = 'rok', y = 'GDP (tryliony)') +
  transition_time(rok) +
  ease_aes('linear')

animate(interactive, duration = 10, fps = 20, width = 500, height = 500, renderer = gifski_renderer())
anim_save("GDP.gif")
