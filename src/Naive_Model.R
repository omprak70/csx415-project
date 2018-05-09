setwd("C:/users/ompra/documents/UCBcourses/Datascience/csx415-Project")

library('ProjectTemplate')
load.project()

# Read Data
TData <- FlowImbalanceTestData.LP.HP.p125

#Shuffle Data
SData <- TData[sample(nrow(TData)),]

#Split Shuffled Data into training data, validation data & test data
TrgData <- SData[1:(0.6*nrow(SData)),]
ValData <- SData[(0.6*nrow(SData)):(0.8*nrow(SData)),]
TstData <- SData[(0.8*nrow(SData)):nrow(SData),]

#Build histogram of response variable - Erosion Potential
ggplot(data=TrgData,aes(x=ErosionPotential)) +
  geom_histogram(binwidth=0.02,fill="Magenta",color="Black")
ggsave(file.path('graphs', 'ResponseHistogram.pdf'))

#Build a Naive Model to predict Erosion Potential
#Take the mean
ErPot_Naive = mean(TrgData$ErosionPotential)
