library(dplyr)

source('./src/LoadData/LoadData.R')
source('./munge/ProcessData.R')

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
summary(ErPot_Tree)
plot(ErPot_Tree)
cTreeVarImp = varImp(ErPot_Tree)
plot(cTreeVarImp)

#make predictions
factors <- c('numRPX','PX1ProcFlow','PX2ProcFlow','PX3ProcFlow','PX4ProcFlow',
             'PX5ProcFlow','PX6ProcFlow','PX7ProcFlow','PX8ProcFlow',
             'PX9ProcFlow','PX10ProcFlow','PX11ProcFlow','PX12ProcFlow',
             'PX1MotFlow','PX2MotFlow','PX3MotFlow','PX4MotFlow','PX5MotFlow',
             'PX6MotFlow','PX7MotFlow','PX8MotFlow','PX9MotFlow','PX10MotFlow',
             'PX11MotFlow','PX12MotFlow')
ErPot_Tree_Predictions <- predict(ErPot_Tree, TstData[factors])