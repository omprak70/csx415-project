library(dplyr)
library(caret)


source('./src/LoadData/LoadData.R')
source('./munge/ProcessData.R')

## Build basic linear model for Erosion Potential Response over Training Data
predictors <- TrgData %>% select(numRPX,PX1ProcFlow,PX2ProcFlow,PX3ProcFlow,
                                 PX4ProcFlow,PX5ProcFlow,PX6ProcFlow,PX7ProcFlow,
                                 PX8ProcFlow,PX9ProcFlow,PX10ProcFlow,PX11ProcFlow,
                                 PX12ProcFlow,PX1MotFlow,PX2MotFlow,PX3MotFlow,
                                 PX4MotFlow,PX5MotFlow,PX6MotFlow,PX7MotFlow,
                                 PX8MotFlow,PX9MotFlow,PX10MotFlow,PX11MotFlow,
                                 PX12MotFlow) %>% as.matrix()
output <- TrgData$ErosionPotential
ErPot_Linear <- train(predictors, output, method = "lm", metric="RMSE")
print(ErPot_Linear)

#Linear Model fit summary
ErPot_Linear_summary <- summary(ErPot_Linear)

#make predictions
factors <- c('numRPX','PX1ProcFlow','PX2ProcFlow','PX3ProcFlow','PX4ProcFlow',
             'PX5ProcFlow','PX6ProcFlow','PX7ProcFlow','PX8ProcFlow',
             'PX9ProcFlow','PX10ProcFlow','PX11ProcFlow','PX12ProcFlow',
             'PX1MotFlow','PX2MotFlow','PX3MotFlow','PX4MotFlow','PX5MotFlow',
             'PX6MotFlow','PX7MotFlow','PX8MotFlow','PX9MotFlow','PX10MotFlow',
             'PX11MotFlow','PX12MotFlow')
ErPot_Linear_Predictions <- predict(ErPot_Linear, TstData[factors])
head(TstData[factors])

#test
fl <- c(8,180,180,180,180,180,240,230,210,0,0,0,0,205,205,205,205,205,205,205,205,0,0,0,0)
fl
inxt <- matrix(fl, nrow=1)
inxt

#data.frame(x) %>% as.matrix()
colnames(inxt) <- c('numRPX','PX1ProcFlow','PX2ProcFlow','PX3ProcFlow','PX4ProcFlow',
                     'PX5ProcFlow','PX6ProcFlow','PX7ProcFlow','PX8ProcFlow',
                     'PX9ProcFlow','PX10ProcFlow','PX11ProcFlow','PX12ProcFlow',
                     'PX1MotFlow','PX2MotFlow','PX3MotFlow','PX4MotFlow','PX5MotFlow',
                     'PX6MotFlow','PX7MotFlow','PX8MotFlow','PX9MotFlow','PX10MotFlow',
                     'PX11MotFlow','PX12MotFlow')

prediction <- predict(ErPot_Linear, inxt)
prediction
