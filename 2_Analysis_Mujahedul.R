#######################################################################
# MPP-E1180: Introduction to Collaborative Social Science Data Analysis
# Assignment01
# Analysis of R example dataset "USArrests"
# Md Mujahedul Islam 
# Updated 04 March 2016
# Hertie School of Governance
#######################################################################


#---------------------------------------------------------------#
# Loading packages I need for the Assignment01                  #
#---------------------------------------------------------------#

## if not done before, install:
# install.packages("plyr")
# install.packages("dplyr")
# install.packages("magrittr")
# install.packages("readstata13")
# install.packages("ggplot2")
# install.packages("reshape")
# install.packages("repmis")

load <- c("plyr", "dplyr", "magrittr", "readstata13", 
          "ggplot2", "reshape", "repmis") 
# shortcut to load packages I need

loaded <- lapply(load, require, character.only = T)
rm(load, loaded)


#-----------------------------------------------------------------------#
# Setting directory to ensure that it works for my collaborator as well #
#-----------------------------------------------------------------------#

# Create list of commonly used working directories (update, if needed!)
possible_dir <- c('C:/Users/Johannes SK/Dropbox/Studium/Spring2016/CollaborativeResearch/Assignment01',
                  'C:/Users/User/Documents/GitHub/Assignment01')

# Set to first valid directory in the possible_dir vector
repmis::set_valid_wd(possible_dir)


#-------------------------------------------------------------#
# Scanning the dataset to getting an idea of the overall data #
#-------------------------------------------------------------#

data(USArrests)  # to load the data
names(USArrests)  # to see names of variables 
dim(USArrests)  # to see how big the data frame is
arrange(USArrests, Murder) 
# to arrage data to see at a glance which state has highest murder rate
attributes(USArrests)  
# to see variable names, the class of the object, and the row names


#--------------------------------------------#
# Renaming all the variables for consistency #
#--------------------------------------------#

USArrests <- rename(USArrests, c(Assault  = "assault", 
                                 Murder   = "murder", 
                                 UrbanPop = "urbanpop", 
                                 Rape     = "rape"))
USArrests$states <- row.names(USArrests)  # creating "states" variable
USArrests <- USArrests[, c(5,1:4)]
# ordering 'states' variable in the first and other as it is. 


#--------------------------------------------------------#
# Loop function for finding "mean" for all the variables #
#--------------------------------------------------------#

for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    mean() %>%
    round(digits = 3) %>%
    paste(names(USArrests)[i], ., '\n') %>%
    cat()
}


#----------------------------------------------------------#
# Loop function for finding "median" for all the variables #
#----------------------------------------------------------#

for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    median() %>%
    round(digits = 3) %>%
    paste(names(USArrests)[i], ., '\n') %>%
    cat()
}


#---------------------------------------------------------#
# Loop function for finding "range" for all the variables #
#---------------------------------------------------------#

for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    range() %>%
    round(digits = 3) %>%
    paste(names(USArrests)[i], ., '\n') %>% # the . directs the 
    cat()
}


#---------------------------------------------------------#
# Checking "mean" one by one for all the variables to see # 
# whether looping command worked                          #
#---------------------------------------------------------#

mean(USArrests$murder, na.rm = TRUE)
mean(USArrests$assault, na.rm = TRUE)
mean(USArrests$urbanpop, na.rm = TRUE)
mean(USArrests$rape, na.rm = TRUE)


#-----------------------------------------------------------#
# Checking "median" one by one for all the variables to see #
# whether looping command worked                            #
#-----------------,-----------------------------------------#

median(USArrests$murder, na.rm = TRUE)
median(USArrests$assault, na.rm = TRUE)
median(USArrests$urbanpop, na.rm = TRUE)
median(USArrests$rape, na.rm = TRUE)


#----------------------------------------------------------#
# Checking "range" one by one for all the variables to see #
# whether looping command worked                           #
#----------------------------------------------------------#

range(USArrests$murder)
range(USArrests$assault)
range(USArrests$urbanpop)
range(USArrests$rape)


#------------------------------#
# Summary of all the variables #
#------------------------------#

summary(USArrests)


#------------------------------------------------------------#
# Barplot using ggplot to show murder rate in the US in 1973 #
#------------------------------------------------------------#

ggplot(USArrests) +
  geom_bar(aes(y = murder, x = reorder(states, -murder)), 
           stat = "identity") +
  ylab("Murder Rate per 100,000") +
  xlab("State") +
  ggtitle("Murder Rate in the United States in 1973") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90))


#--------------------------------------------------------------------------#
# Column chart using ggplot to show rape rate in the United States in 1973 #
#--------------------------------------------------------------------------#

ggplot(USArrests) +
  geom_bar(aes(y = rape, x = reorder(states, -rape)), 
           stat = "identity") +
  ylab("Rape arrests (per 100,000)") +
  xlab("States") +
  ggtitle("Rape rate in the United States in 1973") +
  theme_bw() +
  coord_flip()


#---------------------------------------------------------------------#
# Histogram using ggplot to demonstrate the percentage of the         #
# population living in urban areas in 1973                            #
#---------------------------------------------------------------------#

ggplot(USArrests) +
  geom_histogram(aes(x = urbanpop),
                 colour = "black",
                 fill = "transparent",
                 binwidth = 2) +
  ylab("Frequency") +
  xlab("Population in % living in urban areas") +
  theme_bw()


#--------------------------------------------------------------------------#
# Extra: Creating murder rate barchart without ggplot packages, not sorted #
#--------------------------------------------------------------------------#

states <- row.names(USArrests)
barplot(USArrests$murder, 
        names.arg = states, 
        las = 2, 
        ylab = "Murder rate per 100,000 in different states", 
        main = "Murder rate in the United States in 1973")


#--------------------------------------------------#
# Histogram without ggplot package showing assault #
# distribution accross all US States               #
#--------------------------------------------------#

hist(USArrests$assault,
     main = 'Violent Assault by USA States (per 100,000) in 1973',
     xlab = 'numeric	 Assault arrests (per 100,000)')

# Comparing former Confederate States to the rest
USArrests$dixie <- USArrests$states
USArrests$dixie <- 0
USArrests$dixie[which(USArrests$states=="Florida")] <- 1 #former Confederate State
USArrests$dixie[which(USArrests$states=="Georgia")] <- 1 #former Confederate State
USArrests$dixie[which(USArrests$states=="North Carolina")] <- 1 #former Confederate State
USArrests$dixie[which(USArrests$states=="South Carolina")] <- 1 #former Confederate State
USArrests$dixie[which(USArrests$states=="Mississippi")] <- 1 #former Confederate State
USArrests$dixie[which(USArrests$states=="Alabama")] <- 1 #former Confederate State
USArrests$dixie[which(USArrests$states=="Texas")] <- 1 #former Confederate State
USArrests$dixie[which(USArrests$states=="Virginia")] <- 1 #former Confederate State
USArrests$dixie[which(USArrests$states=="Arkansas")] <- 1 #former Confederate State
USArrests$dixie[which(USArrests$states=="Tennessee")] <- 1 #former Confederate State
USArrests$dixie[which(USArrests$states=="Louisiana")] <- 1 #former Confederate State

# Descriptive Statistics: Dixie
par(mfrow=c(1,2))
hist(USArrests$murder[USArrests$dixie==0],
     main="Rate North",
     col=(c("firebrick1")),
     xlab="Murder Arrests/100 000", ylab="Frequency")
hist(USArrests$murder[USArrests$dixie==1],
     main="Rate South",
     col=(c("mediumspringgreen")),
     xlab="Murder Arrests/100 000", ylab="Frequency")
hist(USArrests$assault[USArrests$dixie==0],
     main="Rate North",
     col=(c("firebrick1")),
     xlab="Assault Arrests/100 000", ylab="Frequency")
hist(USArrests$assault[USArrests$dixie==1],
     main="Rate South",
     col=(c("mediumspringgreen")),
     xlab="Assault Arrests/100 000", ylab="Frequency")
hist(USArrests$rape[USArrests$dixie==0],
     main="Rate North",
     col=(c("firebrick1")),
     xlab="Rape Arrests/100 000", ylab="Frequency")
hist(USArrests$rape[USArrests$dixie==1],
     main="Rate South",
     col=(c("mediumspringgreen")),
     xlab="Rape Arrests/100 000", ylab="Frequency")
par(mfrow=c(1,1))
list(Mmean <- tapply(USArrests$murder, USArrests$dixie, mean))
list(Amean <- tapply(USArrests$assault, USArrests$dixie, mean))
list(Rmean <- tapply(USArrests$rape, USArrests$dixie, mean))
rm(Mmean, Amean, Rmean)

# Citation
# R Core Team (2015). R: A language and environment for statistical
# computing. R Foundation for Statistical Computing, Vienna, Austria. URL
# https://www.R-project.org/.
