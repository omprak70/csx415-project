#' @title Erosion Risk Potential
#'
#' @param state input vector of VorTeq flows - comprising of 25 elements in the following order - # of RPXs running, process flow rate (gallons/min) through each of the 12 RPXs, motive flow rate (gallons/min) through each of the 12 RPXs
#' @return output containes erosion potential and qualitative erosion risk comment
#' @examples VorTeq_Linear(state) # Returns erosion potential predicted by a linear regression model
#' @examples VorTeq_Tree(state) # Returns erosion potential predicted by a decision tree model
#' @examples VorTeq_RF(state) # Returns erosion potential predicted by a random forest model
#'
#' @import dplyr
#' @import forecast
#' @md

#' @export
VorTeq_Linear <- function(x){
    input <- matrix(x, nrow=1)
    colnames(input) <- c('numRPX','PX1ProcFlow','PX2ProcFlow','PX3ProcFlow','PX4ProcFlow',
                         'PX5ProcFlow','PX6ProcFlow','PX7ProcFlow','PX8ProcFlow',
                         'PX9ProcFlow','PX10ProcFlow','PX11ProcFlow','PX12ProcFlow',
                         'PX1MotFlow','PX2MotFlow','PX3MotFlow','PX4MotFlow','PX5MotFlow',
                         'PX6MotFlow','PX7MotFlow','PX8MotFlow','PX9MotFlow','PX10MotFlow',
                         'PX11MotFlow','PX12MotFlow')
    Erosion_Potential <- forecast::forecast(ErPot_Linear, input)

    print(Erosion_Potential)
    if(Erosion_Potential>0.3){
      print("High Risk of Erosion")
    } else{
      print("Low Risk of Erosion")
    }
}

#' @export
VorTeq_Tree <- function(x){
  input <- matrix(x, nrow=1)
  colnames(input) <- c('numRPX','PX1ProcFlow','PX2ProcFlow','PX3ProcFlow','PX4ProcFlow',
                       'PX5ProcFlow','PX6ProcFlow','PX7ProcFlow','PX8ProcFlow',
                       'PX9ProcFlow','PX10ProcFlow','PX11ProcFlow','PX12ProcFlow',
                       'PX1MotFlow','PX2MotFlow','PX3MotFlow','PX4MotFlow','PX5MotFlow',
                       'PX6MotFlow','PX7MotFlow','PX8MotFlow','PX9MotFlow','PX10MotFlow',
                       'PX11MotFlow','PX12MotFlow')
  Erosion_Potential <- forecast::forecast(ErPot_Tree, input)

  print(Erosion_Potential)
  if(Erosion_Potential>0.3){
    print("High Risk of Erosion")
  } else{
    print("Low Risk of Erosion")
  }
}

#' @export
VorTeq_RF <- function(x){
  input <- matrix(x, nrow=1)
  colnames(input) <- c('numRPX','PX1ProcFlow','PX2ProcFlow','PX3ProcFlow','PX4ProcFlow',
                       'PX5ProcFlow','PX6ProcFlow','PX7ProcFlow','PX8ProcFlow',
                       'PX9ProcFlow','PX10ProcFlow','PX11ProcFlow','PX12ProcFlow',
                       'PX1MotFlow','PX2MotFlow','PX3MotFlow','PX4MotFlow','PX5MotFlow',
                       'PX6MotFlow','PX7MotFlow','PX8MotFlow','PX9MotFlow','PX10MotFlow',
                       'PX11MotFlow','PX12MotFlow')
  Erosion_Potential <- forecast::forecast(ErPot_RF, input)

  print(Erosion_Potential)
  if(Erosion_Potential>0.3){
    print("High Risk of Erosion")
  } else{
    print("Low Risk of Erosion")
  }
}
