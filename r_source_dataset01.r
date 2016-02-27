####################################
# R source to analyze dataset nottem
# Johannes Schulz-Knappe
# 27 February 2016
# Hertie School of Governance
####################################

# Setting the working directory
# Set your own directory when running the file!
getwd()
setwd('C:/Users/Johannes SK/Dropbox/Studium/Spring2016/CollaborativeResearch/Assignment01')


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

'First attempt: Extending the existing Dataset
# Creating variable month
month <- c(rep(1:12, 20))
month
Nottem <- 0
# Turning the dataset into a dataframe
Nottem <- as.matrix(nottemTempC)
View(nottemTempC)
Nottem_df <- data.frame(Nottem, month)
# The time series data does not allow me to simply add columns.
# I will have to create a completely new data.frame'

# Creating a new dataframe
JanuaryTemp <- c(nottemTempC[c(1, 13, 25, 37, 49, 61, 73, 85, 97)])

n <- c(0:19)
JanuaryT <- c(nottemTempC[c(1+12*n)])
FebruaryT <- c(nottemTempC[c(2+12*n)])
MarchT <- c(nottemTempC[c(3+12*n)])
AprilT <- c(nottemTempC[c(4+12*n)])
MayT <- c(nottemTempC[c(5+12*n)])
JuneT <- c(nottemTempC[c(6+12*n)])
JulyT <- c(nottemTempC[c(7+12*n)])
AugustT <- c(nottemTempC[c(8+12*n)])
SeptemberT <- c(nottemTempC[c(9+12*n)])
OctoberT <- c(nottemTempC[c(10+12*n)])
NovemberT <- c(nottemTempC[c(11+12*n)])
DecemberT <- c(nottemTempC[c(12+12*n)])

Nottem <- data.frame(JanuaryT, FebruaryT, MarchT, AprilT, MayT, 
                     JuneT, JulyT, AugustT, SeptemberT, OctoberT,
                     NovemberT, DecemberT)
View(Nottem)


boxplot(Nottem$JanuaryT, Nottem$FebruaryT, Nottem$MarchT, 
        Nottem$AprilT, Nottem$MayT, Nottem$JuneT, 
        Nottem$JulyT, Nottem$AugustT, Nottem$SeptemberT, 
        Nottem$OctoberT, Nottem$NovemberT, Nottem$DecemberT,
  main = 'Monthly Averages from 1920 to 1940',
  ylab = 'Temperature in °C',
  
# FINALLY!!!

# Creating Factor for the months?

# Data presentation 3 - General Temperature Trend
# ...


# See: http://www.sr.bham.ac.uk/~ajrs/R/r-gallery.html for more examples how to present temperature charts in R

citation()
# R Core Team (2015). R: A language and environment for statistical
# computing. R Foundation for Statistical Computing, Vienna, Austria. URL
# https://www.R-project.org/.

# Data Source: 
# Anderson, O. D. (1976) Time Series Analysis and Forecasting: The Box-Jenkins approach. Butterworths. Series R.