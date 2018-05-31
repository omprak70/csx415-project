library(dplyr)
library(caret)
library(openxlsx)
library(devtools)

FlowImbalanceTestData.LP.HP.p125 <- read.xlsx('./data-raw/FlowImbalanceTestData.xlsx')

# Read Data
TData <- FlowImbalanceTestData.LP.HP.p125
TData$ErosionRisk <- factor(TData$ErosionRisk)

#Shuffle Data
SData <- TData[sample(nrow(TData)),]

#Split Shuffled Data into training data, validation data & test data
TrgData <- SData[1:(0.6*nrow(SData)),]
ValData <- SData[(0.6*nrow(SData)):(0.8*nrow(SData)),]
TstData <- SData[(0.8*nrow(SData)):nrow(SData),]

#Build a Regession Tree Model for Erosion Potential using Training Data
predictors <- TrgData %>% select(numRPX,PX1ProcFlow,PX2ProcFlow,PX3ProcFlow,
                                 PX4ProcFlow,PX5ProcFlow,PX6ProcFlow,PX7ProcFlow,
                                 PX8ProcFlow,PX9ProcFlow,PX10ProcFlow,PX11ProcFlow,
                                 PX12ProcFlow,PX1MotFlow,PX2MotFlow,PX3MotFlow,
                                 PX4MotFlow,PX5MotFlow,PX6MotFlow,PX7MotFlow,
                                 PX8MotFlow,PX9MotFlow,PX10MotFlow,PX11MotFlow,
                                 PX12MotFlow) %>% as.matrix()
output <- TrgData$ErosionPotential

ErPot_Tree <- train(predictors, output, method = "ctree2", metric="RMSE")

devtools::use_data(ErPot_Tree)
