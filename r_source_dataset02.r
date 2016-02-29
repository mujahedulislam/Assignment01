################################
# --------Assignment01-------- # 
# Example R Dataset: "USArrests"
# Md Mujahedul Islam 
# 28 February 2016
# Hertie School of Governance
################################


#---------------------------------------------------------------------#
#Setting directory to ensure that it works for my collaborator as well#
#---------------------------------------------------------------------#
getwd()
try(setwd("C:/Users/User/Documents/GitHub/Assignment01"), silent = TRUE)
getwd()


#-------------------------------------------------------------#
#Clearing all and loading packages I need for the Assignment01#
#-------------------------------------------------------------#
rm(list = ls()) #just to clear all
## if not done before, install:
# install.packages("dplyr")
# install.packages("magrittr")
# install.packages("readstata13")
# install.packages("ggplot2")
# install.packages("reshape")
# install.packages("plyr")
load <- c("dplyr", "magrittr", "readstata13", "ggplot2", "reshape", "plyr") 
# shortcut to load packages I need
loaded <- lapply(load, require, character.only = T)
rm(load, loaded)


#-----------------------------------------------------------#
#Scanning the dataset to getting an idea of the overall data#
#-----------------------------------------------------------#
data(USArrests) # to load the data
names(USArrests) # to see names of variables 
dim(USArrests) # to see how big the data frame, for instance, it has 50 rows, 4 variables
arrange(USArrests, murder) # to arrage data to see at a glance which state has highest murder rate
attributes(USArrests) # to see variable names, the class of the object, and the row names
attributes(USArrests)$row.names # to see the row names


#------------------------------------------#
#Renaming all the variables for consistency#
#------------------------------------------#
USArrests<-rename(USArrests,c(Assault="assault", Murder="murder", UrbanPop="urbanpop", Rape="rape"))
USArrests$states <- row.names(USArrests) #creating "states" variable
USArrests <- USArrests[,c(5,1:4)] #ordering 'states' variable in the first and other as it is. 


#------------------------------------------------------#
#loop function for finding "mean" for all the variables#
#------------------------------------------------------#
for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    mean() %>%
    round(digits = 3) %>%
    paste(names(USArrests)[i], ., '\n') %>% # the . directs the 
    cat()
}


#--------------------------------------------------------#
#loop function for finding "median" for all the variables#
#--------------------------------------------------------#
for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    median() %>%
    round(digits = 3) %>%
    paste(names(USArrests)[i], ., '\n') %>% # the . directs the 
    cat()
}


#----------------------------------------------------#
#loop function for finding "range" for all the variables#
#----------------------------------------------------#
for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    range() %>%
    round(digits = 3) %>%
    paste(names(USArrests)[i], ., '\n') %>% # the . directs the 
    cat()
}


#--------------------------------------------------------------------------------------#
#Checking "mean" one by one for all the variables to see whether looping command worked#
#--------------------------------------------------------------------------------------#
mean(USArrests$murder, na.rm = TRUE)
mean(USArrests$assault, na.rm = TRUE)
mean(USArrests$urbanpop, na.rm = TRUE)
mean(USArrests$rape, na.rm = TRUE)


#----------------------------------------------------------------------------------------#
#Checking "median" one by one for all the variables to see whether looping command worked#
#----------------------------------------------------------------------------------------#
median(USArrests$murder, na.rm = TRUE)
median(USArrests$assault, na.rm = TRUE)
median(USArrests$urbanpop, na.rm = TRUE)
median(USArrests$rape, na.rm = TRUE)


#---------------------------------------------------------------------------------------#
#Checking "range" one by one for all the variables to see whether looping command worked#
#---------------------------------------------------------------------------------------#
range(USArrests$murder)
range(USArrests$assault)
range(USArrests$urbanpop)
range(USArrests$rape)


#----------------------------#
#Summary of all the variables#
#----------------------------#
summary(USArrests$murder, assault, urbanpop, rape)
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


#---------------------------------------------------------------------#
# Colomn chart using ggplot to show rate in the United States in 1973 #
#---------------------------------------------------------------------#

ggplot(USArrests) +
  geom_bar(aes(y = rape, x = reorder(states, -rape)), 
           stat = "identity") +
  ylab("Rape arrests (per 100,000)") +
  xlab("States") +
  ggtitle("Rape rate in the United States in 1973") +
  theme_bw() +
  coord_flip()


#---------------------------------------------------------------------#
# Histogram using ggplot to demonstrate the frequency of the % of the #
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



#-------------------Extra----------------------#
#----------------------------------------------#
#Creating same barchart without ggplot packages#
#----------------------------------------------#
states = row.names(USArrests)
barplot(USArrests$murder, names.arg = states, las = 2, ylab = "Murder rate per 100,000 in different states", 
        main = "Murder rate in the United States in 1973")


#----------------------------------------------------------------------#
#Histogram without ggplot package showing assault accross all US States#
#----------------------------------------------------------------------#
hist(USArrests$assault,
     main = 'Violent Assault by USA States (per 100,000) in 1973',
     xlab = 'numeric	 Assault arrests (per 100,000')


# Citation()
# R Core Team (2015). R: A language and environment for statistical
# computing. R Foundation for Statistical Computing, Vienna, Austria. URL
# https://www.R-project.org/.
