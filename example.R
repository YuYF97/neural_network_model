library(openxlsx)
library(pROC)
library(rmda)
library(ggplot2)
library(neuralnet)

nnet <- readRDS('prediction_model.rds')

data <- read.xlsx('file_path_of_data')

data$pre <- neuralnet::compute(nnet, data)$net.result[,2]
roc <- roc(data$HERR2, data$pre)