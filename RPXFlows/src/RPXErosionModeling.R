# Read Data
getwd()
setwd("C:/Users/ompra/Documents/UCBCourses/DataScience/project/RPXFlows/data")
library(openxlsx)
TData <- read.xlsx("ModelDataSet.xlsx")
nRows <- nrow(TData)
head(TData)
tail(TData)
str(TData)
summary(TData)

#Shuffle Data
SData <- TData[sample(nrow(TData)),]
head(SData)
tail(SData)
str(SData)
summary(SData)

#Split Shuffled Data into training data, validation data & test data
TrgData <- SData[1:(0.6*nrow(SData)),]
ValData <- SData[(0.6*nrow(SData)):(0.8*nrow(SData)),]
TstData <- SData[(0.8*nrow(SData)):nrow(SData),]

#Build histogram of response variable - Erosion Potential
ggplot(data=TrgData,aes(x=ErosionPotential)) +
   geom_histogram(binwidth=0.1,fill="Magenta",color="Black")

#Build histograms of the five predictors
ggplot(data=TrgData,aes(x=MeanProcFlow)) +
  geom_histogram(binwidth=20,fill="Blue",color="Black")

ggplot(data=TrgData,aes(x=StDevProcFlow)) +
  geom_histogram(binwidth=2,fill="Green",color="Black")

ggplot(data=TrgData,aes(x=MeanMotFlow)) +
  geom_histogram(binwidth=20,fill="Blue",color="Black")

ggplot(data=TrgData,aes(x=StDevMotFlow)) +
  geom_histogram(binwidth=2,fill="Green",color="Black")

ggplot(data=TrgData,aes(x=numRPX)) +
  geom_histogram(binwidth=1,fill="Brown",color="Black")

#Build a Naive Model to predict Erosion Potential
#Take the mean
ErPot_Naive = mean(TrgData$ErosionPotential)
TrgData$NaiveResponse = c(rep(ErPot_Naive,nrow(TrgData)))
head(TrgData)

#Check mean absolute deviation if the model is good
TrgData$AbsDeviationNaive = abs(TrgData$ErosionPotential - TrgData$NaiveResponse)
MeanAbsDeviationNaive = mean(TrgData$AbsDeviationNaive)

#Plot actual response and naive model response vs each of the 5 input variables
library(ggplot2)

ggplot(data = TrgData) +
  geom_point(aes(x = MeanProcFlow, y = NaiveResponse),size=5,color="DarkGreen") +
  geom_point(aes(x = MeanProcFlow, y = ErosionPotential)) + 
  xlab("Process Flow across RPXs - Mean Flow (GPM)") +
  ylab("Erosion Potential")
  
ggplot(data = TrgData) +
  geom_point(aes(x = StDevProcFlow, y = NaiveResponse),size=5,color="DarkGreen") +
  geom_point(aes(x = StDevProcFlow, y = ErosionPotential)) + 
  xlab("Process Flow across RPXs - Standard Deviation (GPM)") +
  ylab("Erosion Potential")

ggplot(data = TrgData) +
  geom_point(aes(x = MeanMotFlow, y = NaiveResponse),size=5,color="DarkGreen") +
  geom_point(aes(x = MeanMotFlow, y = ErosionPotential)) + 
  xlab("Motive Flow across RPXs - Mean Flow (GPM)") +
  ylab("Erosion Potential")

ggplot(data = TrgData) +
  geom_point(aes(x = StDevMotFlow, y = NaiveResponse),size=5,color="DarkGreen") +
  geom_point(aes(x = StDevMotFlow, y = ErosionPotential)) + 
  xlab("Motive Flow across RPXs - Standard Deviation (GPM)") +
  ylab("Erosion Potential")

ggplot(data = TrgData) +
  geom_point(aes(x = numRPX, y = NaiveResponse),size=5,color="DarkGreen") +
  geom_point(aes(x = numRPX, y = ErosionPotential)) + 
  xlab("number of RPXs running") +
  ylab("Erosion Potential")

#Build a Linear Model
LinearModel <- lm(ErosionPotential ~ MeanProcFlow + StDevProcFlow + 
                    StDevMotFlow + numRPX, data=TrgData)
summary(LinearModel)
Coeffs <- coefficients(LinearModel)

#Check mean absolute deviation to see if model is good
TrgData$LinearResponse <- Coeffs[1] + Coeffs[2]*TrgData$MeanProcFlow +
  Coeffs[3]*TrgData$StDevProcFlow + Coeffs[4]*TrgData$StDevMotFlow +
  Coeffs[5]*TrgData$numRPX
TrgData$AbsDeviationLinear = abs(TrgData$ErosionPotential - TrgData$LinearResponse)
MeanAbsDeviationLinear = mean(TrgData$AbsDeviationLinear)

#Build a Regression Tree
library(rpart)
RegTree <- rpart(ErosionPotential ~ MeanProcFlow + StDevProcFlow + MeanMotFlow +
               StDevMotFlow + numRPX, method="anova", data=TrgData)
printcp(RegTree)
plotcp(RegTree)
summary(RegTree)

#Check mean absolute deviation to see if model is good
InputDF <- data.frame(TrgData[,1:5])
TrgData$RegTreeResponse <- predict(RegTree,InputDF)
TrgData$AbsDeviationRegTree = abs(TrgData$ErosionPotential - TrgData$RegTreeResponse)
MeanAbsDeviationRegTree = mean(TrgData$AbsDeviationRegTree)