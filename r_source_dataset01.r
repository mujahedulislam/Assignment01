####################################
# R source to analyze dataset nottem
# Johannes Schulz-Knappe
# 27 February 2016
# Hertie School of Governance
####################################

# Setting the working directory
## Set your own directory when running the file!
getwd()
# setwd('C:/Users/Johannes SK/Dropbox/Studium/Spring2016/CollaborativeResearch/Assignment01')


# Install packages
## if not already installed, then run:
install.packages("weathermetrics")
install.packages("ggplot2")
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


# Beware, now the experimental part starts

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

# Creating variable month
month <- c(rep(1:12, 20))
month
Nottem <- 0
# Turning the dataset into a dataframe
Nottem <- as.matrix(nottemTempC)
View(nottemTempC)
Nottem_df <- data.frame(Nottem, month)
# The time series data does not allow me to simply add columns.
# I will have to create a completely new data.frame




# Data presentation 3 - General Temperature Trend



# See: http://www.sr.bham.ac.uk/~ajrs/R/r-gallery.html for more examples how to present temperature charts in R

citation()
# R Core Team (2015). R: A language and environment for statistical
# computing. R Foundation for Statistical Computing, Vienna, Austria. URL
# https://www.R-project.org/.

# Data Source: 
# Anderson, O. D. (1976) Time Series Analysis and Forecasting: The Box-Jenkins approach. Butterworths. Series R.