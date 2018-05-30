library(dplyr)

source('./src/LoadData/LoadData.R')
source('./munge/ProcessData.R')

#Build a Random Forest Model for Erosion Potential using Training Data
predictors <- TrgData %>% select(numRPX,PX1ProcFlow,PX2ProcFlow,PX3ProcFlow,
                                 PX4ProcFlow,PX5ProcFlow,PX6ProcFlow,
                                 PX7ProcFlow,PX8ProcFlow,PX9ProcFlow,
                                 PX10ProcFlow,PX11ProcFlow,PX12ProcFlow,
                                 PX1MotFlow,PX2MotFlow,PX3MotFlow,PX4MotFlow,
                                 PX5MotFlow,PX6MotFlow,PX7MotFlow,PX8MotFlow,
                                 PX9MotFlow,PX10MotFlow,PX11MotFlow,
                                 PX12MotFlow) %>% as.matrix()
output <- TrgData$ErosionPotential

# Train random forest model
ErPot_RF <- train(x = predictors,y = output,ntree = 25,method = "rf",metric = "RMSE")
print(ErPot_RF)
summary(ErPot_RF)

# plot the rmse for various possible training values
ggplot(ErPot_RF)

#look at prelimiary model fit indicators
#rf_fit_reg_summary <- summary(RF_Reg_model)

#make predictions
factors <- c('numRPX','PX1ProcFlow','PX2ProcFlow','PX3ProcFlow','PX4ProcFlow',
             'PX5ProcFlow','PX6ProcFlow','PX7ProcFlow','PX8ProcFlow',
             'PX9ProcFlow','PX10ProcFlow','PX11ProcFlow','PX12ProcFlow',
             'PX1MotFlow','PX2MotFlow','PX3MotFlow','PX4MotFlow','PX5MotFlow',
             'PX6MotFlow','PX7MotFlow','PX8MotFlow','PX9MotFlow','PX10MotFlow',
             'PX11MotFlow','PX12MotFlow')
ErPot_RF_Predictions <- predict(ErPot_RF, TstData[factors])
