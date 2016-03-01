#######################################################################
# MPP-E1180: Introduction to Collaborative Social Science Data Analysis
# Assignment01
# Analysis of R example dataset "nottem" 
# Johannes Schulz-Knappe
# Updated 01 March 2016
# Hertie School of Governance
#######################################################################


# Install packages

## if not done before, install:
# install.packages("weathermetrics")
# install.packages("ggplot2")
# install.packages("repmis")

library(weathermetrics)
library(ggplot2)
library(repmis)


# Set the working directory

# Create list of commonly used working directories (update, if needed!)
possible_dir <- c('C:/Users/Johannes SK/Dropbox/Studium/Spring2016/CollaborativeResearch/Assignment01',
                  'C:/Users/User/Documents/GitHub/Assignment01')

# Set to first valid directory in the possible_dir vector
repmis::set_valid_wd(possible_dir)


# Integrate dataset into the environment
data("nottem")


# Convert temperature from fahrenheit into degrees celsius
nottemC <- fahrenheit.to.celsius(nottem)


# Create a histogram that shows that the data is normally distributed
histogram <- nottemC
m <- mean(histogram)
std <- sqrt(var(histogram))
hist(histogram, density=100, breaks=49, col="grey", prob=TRUE,
     xlab = "Temperature in °C", 
     ylim = c(0, 0.13),
     ylab = "Frequency (% of entries in the dataset)",
     main = "Histogram to show the distribution of the Nottingham data", 
     cex.main=1)
curve(dnorm(x, mean=m, sd=std),
      col="black", lwd=1, add=TRUE, yaxt="n")


# Plot an overall time series of the data

plot(nottemC, 
     col  = "red", 
     xlab = "Year",
     ylab = "Monthly Average in °C", 
     main = "Temperature Chart for Nottingham, 1920 to 1939")


# Convert time series data into a data.frame

# Create vectors with all values for each month across the years
n <- c(0:19)
jan <- c(nottemC[c(1+12*n)])
feb <- c(nottemC[c(2+12*n)])
mar <- c(nottemC[c(3+12*n)])
apr <- c(nottemC[c(4+12*n)])
may <- c(nottemC[c(5+12*n)])
jun <- c(nottemC[c(6+12*n)])
jul <- c(nottemC[c(7+12*n)])
aug <- c(nottemC[c(8+12*n)])
sep <- c(nottemC[c(9+12*n)])
oct <- c(nottemC[c(10+12*n)])
nov <- c(nottemC[c(11+12*n)])
dec <- c(nottemC[c(12+12*n)])

# Create a vector containing the years
year <- c(1920:1939)

# Merge vectors into one dataframe
Nottem <- data.frame(year, jan, feb, mar, apr, may, jun, jul,
                     aug, sep, oct, nov, dec)

# Create character vector of labels to be used for the chart
m <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", 
       "Aug", "Sep", "Oct", "Nov", "Dec")

# Create a multiple boxplot chart showing average temperature variation
# over the years

boxplot(Nottem$jan, Nottem$feb, Nottem$mar, 
        Nottem$apr, Nottem$may, Nottem$jun, 
        Nottem$jul, Nottem$aug, Nottem$sep, 
        Nottem$oct, Nottem$nov, Nottem$dec,
  main = 'Temperature Variation in Nottingham, 1920 to 1939',
  sub  = 'The variation of the average temperature for each month',
  ylab = 'Temperature in °C') +
    axis(1, at=(1:12), labels=m,las=2)


# See: http://www.sr.bham.ac.uk/~ajrs/R/r-gallery.html 
# for more examples how to present temperature charts in R


# citation
# R Core Team (2015). R: A language and environment for statistical
# computing. R Foundation for Statistical Computing, Vienna, Austria. URL
# https://www.R-project.org/.
#
# Data Source: 
# Anderson, O. D. (1976) Time Series Analysis and Forecasting: The Box-Jenkins approach. Butterworths. Series R.
