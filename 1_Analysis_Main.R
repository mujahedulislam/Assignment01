#######################################################################
# MPP-E1180: Introduction to Collaborative Social Science Data Analysis
# Assignment01
# Main R source for Assignment01
# Md Mujahedul Islam and Johannes Schulz-Knappe
# Updated 01 March 2016
# Hertie School of Governance
#######################################################################


# Set working directory

# Create list of commonly used working directories (update, if needed!)
possible_dir <- c('C:/Users/Johannes SK/Dropbox/Studium/Spring2016/CollaborativeResearch/Assignment01',
                  'C:/Users/User/Documents/GitHub/Assignment01')

# Set to first valid directory in the possible_dir vector
repmis::set_valid_wd(possible_dir)


# Run the two analysis files

# The first analysis is done with the R example dataset "USArrests"
# Check 2_Analysis_Mujahed.R for the script
source('2_Analysis_Mujahed.R')

# The second analysis is done with the R example dataset "nottem"
# Check 3_Analysis_Johannes.R for the script
source('3_Analysis_Johannes.R')


# Citation
# R Core Team (2015). R: A language and environment for statistical
# computing. R Foundation for Statistical Computing, Vienna, Austria. URL
# https://www.R-project.org/.
