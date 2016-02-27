####################################
# R source to analyze dataset nottem
# Johannes Schulz-Knappe
# 27 February 2016
# Hertie School of Governance
####################################

# Setting the working directory
## Set your own directory when running the file!
getwd()
setwd('C:/Users/Johannes SK/Dropbox/Studium/Spring2016/CollaborativeResearch/Assignment01')

# Install packages
## if not already installed, then run:
# install.packages("weathermetrics")
# install.packages("ggplot2")
library(weathermetrics)
library(ggplot2)
?weathermetrics

# Integrating dataset into the environment
data("nottem")
nottem
?nottem

# Converting temperature from fahrenheit into degrees celsius
nottemTempC <- fahrenheit.to.celsius(nottem)
nottemTempC

'# Exploring vector Properties of nottemTempC
length(nottemTempC)
dim(nottemTempC)
# Converting vector into a matrix
Nottem <- as.matrix(nottemTempC)
View(Nottem)
dim(Nottem)
options(digits = 7)
?options
?rnorm
NottemTime <- ts(Nottem, start=c(1920,1), frequency=12)
NottemTime
ts.plot(NottemTime)
dim(NottemTime)
View(NottemTime)

time(NottemTime)
time(nottemTempC)'

# Data presentation 1 - Overall Time Series

# Plotting the time series
plot(nottemTempC, , col="red", ylab="Monthly Average in °C", main="Temperature Chart for Nottingham")

# Data presentation 2 - Monthly averages

# Calculate month from date:
nottemTempC$month <- with(nottem, factor(as.POSIXlt(Date)$mon, label=month.abb))

#--Calculate year from date:
nottemTempC$year <- with(nottemTempC, 1900 + as.POSIXlt(Date)$year)

#--Only use complete years:
middayweather <- subset(middayweather, year %in% 2007:2009)


install.packages(ggplot)
library(ggplot)
theme_set(theme_gray(base_size = 11))
ggplot(data=nottenTempC)

# Data presentation 3 - General Temperature Trend
ggplot2::ggplot(nottem, aes(nottem, ))


# See: http://www.sr.bham.ac.uk/~ajrs/R/r-gallery.html for more examples how to present temperature charts in R

citation()
# R Core Team (2015). R: A language and environment for statistical
# computing. R Foundation for Statistical Computing, Vienna, Austria. URL
# https://www.R-project.org/.

# Data Source: 
# Anderson, O. D. (1976) Time Series Analysis and Forecasting: The Box-Jenkins approach. Butterworths. Series R.