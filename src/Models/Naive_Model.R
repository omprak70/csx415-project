library(dplyr)

source('./src/LoadData/LoadData.R')
source('./munge/ProcessData.R')

#Build a Naive Model to predict Erosion Potential
#Take the mean
ErPot_Naive <- mean(TrgData$ErosionPotential)
