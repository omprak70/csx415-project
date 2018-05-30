# Read Data
TData <- FlowImbalanceTestData.LP.HP.p125
TData$ErosionRisk <- factor(TData$ErosionRisk)

#Shuffle Data
SData <- TData[sample(nrow(TData)),]

#Split Shuffled Data into training data, validation data & test data
TrgData <- SData[1:(0.6*nrow(SData)),]
ValData <- SData[(0.6*nrow(SData)):(0.8*nrow(SData)),]
TstData <- SData[(0.8*nrow(SData)):nrow(SData),]
