#get the working directory
getwd()
setwd("C:/Users/OWNER/Documents/Rfolder")
# import the full dataset
full_data <- read.csv("WRFdata_May2018.csv")
# to confirm
full_data
# to view the full dataset
View(full_data)
# import the list of 310 rows created in excel
df_310 <- read.csv("df_310.csv")
# to confirm
df_310
# to view the 310 rows
View(df_310)

# ASSESSING DATA (310 rows)
# to show the top 6 rows
head(df_310)
# to show the bottom 6 rows
tail(df_310)
# to display the number of row
nrow(df_310)
# to display the number of column
ncol(df_310)
# to check the column names
colnames(df_310)
# to check the data structure info (310 rows)
str(df_310)
# to check the descriptive statistics of 310 rows)
summary(df_310)

# DEALING WITH MISSING VALUES

# to check if there is any missing value in the df
any(is.na(df_310))
# to check the actual number of missing value in the df
sum(is.na(df_310))
# to deal with the missing values using linear interpolation method
# Install and load imputeTS package
install.packages("imputeTS")
library(imputeTS)
df_310<-apply(df_310,2,function(x) na_interpolation(x,option='linear'))
View(df_310)
# to recheck for missing values
any(is.na(df_310))
sum(is.na(df_310))
# to write new data into csv
write.csv(df_310, file = "newdf_310.csv", row.names = FALSE)

# Assessing the individual column attributes, Checking for outliers and EDA 
# for the purpose of Assessing the individual column attributes, checking for outliers and EDA, only the recorded data of 10/05/2020 will be used.
newdf_310 <- read.csv("newdf_310.csv", header = TRUE, sep = ",",
                    colClasses = c("numeric", "character"))
# select only the first 13 columns of newdf_310
newdf_310_subset <- newdf_310[, 1:12] 
View(newdf_310_subset)
# to check the total number of row
nrow(newdf_310_subset)
# to display the total number of column
ncol(newdf_310_subset)
# to check for the 12 columns' name
colnames(newdf_310_subset)
# To find datatype of the variables
typeof(newdf_310_subset$XLAT)
typeof(newdf_310_subset$XLONG)
typeof(newdf_310_subset$TSK)
typeof(newdf_310_subset$PSFC)
typeof(newdf_310_subset$X.U10.)
typeof(newdf_310_subset$X.V10.)
typeof(newdf_310_subset$X.Q2.)
typeof(newdf_310_subset$RAINC)
typeof(newdf_310_subset$RAINNC)
typeof(newdf_310_subset$SNOW)
typeof(newdf_310_subset$TSLB)
typeof(newdf_310_subset$SMOIS)
# convert the datatype from "character" to "double" using "as.numeric" function (XLONG, PSFC,X.V10, RAINC, SNOW, SMOIS)
# to convert the datatype from "character" to "double" (XLONG)
newdf_310_subset$XLONG <- as.numeric(newdf_310_subset$XLONG)
# to confirm
class(newdf_310_subset$XLONG)
# to convert the datatype from "character" to "double" (PSFC)
newdf_310_subset$PSFC <- as.numeric(newdf_310_subset$PSFC)
# to confirm
class(newdf_310_subset$PSFC)
# to convert the datatype from "character" to "double" (X.V10)
newdf_310_subset$X.V10. <- as.numeric(newdf_310_subset$X.V10.)
# to confirm
class(newdf_310_subset$X.V10.)
# to convert the datatype from "character" to "double" (RAINC)
newdf_310_subset$RAINC <- as.numeric(newdf_310_subset$RAINC)
# to confirm
class(newdf_310_subset$RAINC)
# to convert the datatype from "character" to "double" (SNOW)
newdf_310_subset$SNOW <- as.numeric(newdf_310_subset$SNOW)
# to confirm
class(newdf_310_subset$SNOW)
# to convert the datatype from "character" to "double" (SMOIS)
newdf_310_subset$SMOIS <- as.numeric(newdf_310_subset$SMOIS)
# to confirm
class(newdf_310_subset$SMOIS)
















# Checking for outliers using the interquartile range (IQR) and replacing it using the median of non-outliers
colnames(newdf_310_subset)
library(outliers)
# for TSK
TSK <- newdf_310_subset$TSK

# calculate the interquartile range
q1 <- quantile(TSK, 0.25)
q3 <- quantile(TSK, 0.75)
iqr <- q3 - q1

# identify the outliers (using a threshold of 1.5 times the IQR)
outliers <- TSK < (q1 - 1.5*iqr) | TSK > (q3 + 1.5*iqr)

# print the outliers
TSK[outliers]

# for PSFC
PSFC <- newdf_310_subset$PSFC

# calculate the interquartile range
q1 <- quantile(PSFC, 0.25)
q3 <- quantile(PSFC, 0.75)
iqr <- q3 - q1

# identify the outliers (using a threshold of 1.5 times the IQR)
outliers <- PSFC < (q1 - 4.5*iqr) | PSFC > (q3 + 4.5*iqr)

# print the outliers
PSFC[outliers]

# for X.U10.
X.U10. <- newdf_310_subset$X.U10.

# calculate the interquartile range
q1 <- quantile(X.U10., 0.25)
q3 <- quantile(X.U10., 0.75)
iqr <- q3 - q1

# identify the outliers (using a threshold of 1.5 times the IQR)
outliers <- X.U10. < (q1 - 2.5*iqr) | X.U10. > (q3 + 2.5*iqr)

# print the outliers
X.U10.[outliers]


# for X.V10.
X.V10. <- newdf_310_subset$X.V10.

# calculate the interquartile range
q1 <- quantile(X.V10., 0.25)
q3 <- quantile(X.V10., 0.75)
iqr <- q3 - q1

# identify the outliers (using a threshold of 1.5 times the IQR)
outliers <- X.V10. < (q1 - 1.5*iqr) | X.V10. > (q3 + 1.5*iqr)

# print the outliers
X.V10.[outliers]


# for X.Q2.
X.Q2. <- newdf_310_subset$X.Q2.

# calculate the interquartile range
q1 <- quantile(X.Q2., 0.25)
q3 <- quantile(X.Q2., 0.75)
iqr <- q3 - q1

# identify the outliers (using a threshold of 1.5 times the IQR)
outliers <- X.Q2. < (q1 - 1.5*iqr) | X.Q2. > (q3 + 1.5*iqr)

# print the outliers
X.Q2.[outliers]

# for RAINC
RAINC <- newdf_310_subset$RAINC

# calculate the interquartile range
q1 <- quantile(RAINC, 0.25)
q3 <- quantile(RAINC, 0.75)
iqr <- q3 - q1

# identify the outliers (using a threshold of 1.5 times the IQR)
outliers <- RAINC < (q1 - 1.5*iqr) | RAINC > (q3 + 1.5*iqr)

# print the outliers
RAINC[outliers]

# for RAINNC
RAINNC <- newdf_310_subset$RAINNC

# calculate the interquartile range
q1 <- quantile(RAINNC, 0.25)
q3 <- quantile(RAINNC, 0.75)
iqr <- q3 - q1

# identify the outliers (using a threshold of 1.5 times the IQR)
outliers <- RAINNC < (q1 - 4.5*iqr) | RAINNC > (q3 + 4.5*iqr)

# print the outliers
RAINNC[outliers]

# replace the outlier with the median of the non-outlier values
RAINNC[outliers] <- median(RAINNC[!outliers])

# print the updated data
RAINNC

# for SNOW
SNOW <- newdf_310_subset$SNOW

# calculate the interquartile range
q1 <- quantile(SNOW, 0.25)
q3 <- quantile(SNOW, 0.75)
iqr <- q3 - q1

# identify the outliers (using a threshold of 1.5 times the IQR)
outliers <- SNOW < (q1 - 1.5*iqr) | SNOW > (q3 + 1.5*iqr)

# print the outliers
SNOW[outliers]


# for TSLB
TSLB <- newdf_310_subset$TSLB

# calculate the interquartile range
q1 <- quantile(TSLB, 0.25)
q3 <- quantile(TSLB, 0.75)
iqr <- q3 - q1

# identify the outliers (using a threshold of 1.5 times the IQR)
outliers <- TSLB < (q1 - 1.5*iqr) | TSLB > (q3 + 1.5*iqr)

# print the outliers
TSLB[outliers]

# for SMOIS
SMOIS <- newdf_310_subset$SMOIS

# calculate the interquartile range
q1 <- quantile(SMOIS, 0.25)
q3 <- quantile(SMOIS, 0.75)
iqr <- q3 - q1

# identify the outliers (using a threshold of 1.5 times the IQR)
outliers <- SMOIS < (q1 - 1.5*iqr) | SMOIS > (q3 + 1.5*iqr)

# print the outliers
SMOIS[outliers]



# Exploratory Data Analysis (EDA)
library('ggplot2')
library(Tmisc)

# plot bar chart
qplot(newdf_310_subset$XLAT, geom ="bar")

qplot(newdf_310_subset$XLONG, geom ="bar")

qplot(newdf_310_subset$TSK, geom ="bar")

qplot(newdf_310_subset$PSFC, geom ="bar")

qplot(newdf_310_subset$X.U10, geom ="bar")

qplot(newdf_310_subset$X.V10, geom ="bar")

qplot(newdf_310_subset$X.Q2, geom ="bar")

qplot(newdf_310_subset$RAINC, geom ="bar")

qplot(newdf_310_subset$RAINNC, geom ="bar")

qplot(newdf_310_subset$SNOW, geom ="bar")

qplot(newdf_310_subset$TSLB, geom ="bar")

qplot(newdf_310_subset$SMOIS, geom ="bar")

# Plot the relationship between surface temperature and surface presure
# Scatter plots of surface temperature, surface presure
ggplot(newdf_310_subset, aes(TSK,PSFC)) +geom_point()


# Plot the relationship between surface temperature and soil temperature
# Scatter plots of surface temperature, soil temperature
ggplot(newdf_310_subset, aes(TSK,TSLB)) +geom_point()


# Plot the relationship between surface temperature and soil moisture
# Scatter plots of surface temperature, soil moisture
ggplot(newdf_310_subset, aes(TSK,SMOIS)) +geom_point()


# Plot the relationship between soil temperature and soil moisture
# Scatter plots of soil temperature, soil moisture
ggplot(newdf_310_subset, aes(TSLB,SMOIS)) +geom_point()



# Plot the relationship between surface temperature and 2- meter specific humidity 
# Scatter plots of surface temperature, 2- meter specific humidity 
ggplot(newdf_310_subset, aes(TSK,X.Q2.)) +geom_point()

# Plot the relationship between surface temperature and X component of wind at 10m 
# Scatter plots of surface temperature, X component of wind at 10m 
ggplot(newdf_310_subset, aes(TSK,X.U10.)) +geom_point()


# Plot the relationship between surface temperature and Y component of wind at 10m 
# Scatter plots of surface temperature, Y component of wind at 10m
ggplot(newdf_310_subset, aes(TSK,X.V10.)) +geom_point()









# PHASE 2 OF THE ASSESSMENT

# import libraries
library (dplyr)
library (tidyverse)
# to read dataset
temp <- read.csv('TSK.csv')
#  to view the dataframe
View(temp)
# to display the structure of the dataframe
str(temp)
glimpse(temp)

# convert date column from character to datetime dtype
temp$Date <- as.POSIXct(temp$Date, format = '%d.%m.%Y.%H.%M')
# to confirm
temp$Date
glimpse(temp)
# COnvert to time series
ts_temp <- ts(data=temp$TSK, start=1, frequency = 8)
# to confirm
ts_temp
# Extract the time component of x
time(ts_temp)

# CHECK FOR STATIONARITY OF THE TIME SERIES (ADF, PACF, ACF)
# import libraries
library(tseries)
# to check for stationary using graphical method
plot(ts_temp)
#seasonal decomposition
plot(decompose(ts_temp))
# to check for stationary using adf
adf.test(ts_temp)  # p value is > 0.05, so the timeseries is non stationary
# to check for stationary using acf
acf(ts_temp)   # so many lines crossing the blue line.. non stationary
# to check for stationary using pacf
pacf(ts_temp)   # so many lines crossing the blue line.. non stationary

# to make it stationary, we should make use of first order difference method 
# Take first order difference to remove trend
diff_ts_temp <- diff(ts_temp, differences = 1)

# Plot the differenced time series
plot(diff_ts_temp, main = "Differenced Time Series")
plot(decompose(diff_ts_temp))
# to check for stationary again using adf
adf.test(diff_ts_temp)  # p value is < 0.05, so the timeseries is stationary

# split the dataset
train_end <- floor(0.8 * length(diff_ts_temp))
train_data <- diff_ts_temp[1:train_end]
test_data <- diff_ts_temp[(train_end+1):length(diff_ts_temp)]
# modelling using ARIMA
# install libraries
install.packages("forecast")
library(forecast)
# fit the ARIMA model using auto.arima function
arima_model <- auto.arima(train_data)
summary(arima_model)

# Forecast and Evaluate the ARIMA Model
# forecast
arima_forecast <- forecast(arima_model, h =length(test_data))
# evaluate
arima_accuracy <- accuracy(arima_forecast, test_data)
cat("ARIMA Model Accuracy:", arima_accuracy[, 'RMSE'])

# MACHINE LEARNING MODELS
# Linear Regression Model
# create a time variable
time <- 1:length(train_data)
# fit the model
linear_model <- lm(train_data ~ time)
# summary
summary(linear_model)
#  Forecast and Evaluate the Linear Regression Model
# forecast
time_test <- (length(train_data)+1):(length(train_data) + length(test_data))
linear_forecast <- predict(linear_model, newdata = data.frame(time = time_test))
# evaluate
linear_rmse <- sqrt(mean((test_data - linear_forecast)^2))
cat("Linear Regression Model Accuracy:", linear_rmse)

# Random Forest model
# Install and Load Necessary Packages
install.packages("randomForest")
library(randomForest)
# convert time series to a dataframe
train_df <- data.frame(value = train_data, time = 1:length(train_data))
# create lag features
train_df$lag1 <- lag(train_df$value, 1)
train_df$lag2 <- lag(train_df$value, 2)
train_df <- na.omit(train_df)
# Fit the Random Forest Model
random_forest_model <- randomForest(value ~ lag1 + lag2, data = train_df)
# summary
print(random_forest_model)
# Forecast and Evaluate the Random Forest Model
# create a function to forecast using the random forest model
rf_forecast <- function(model, newdata) {
  # prepare data
  newdata_df <- data.frame(value = newdata, time = 1:length(newdata))
  newdata_df$lag1 <- lag(newdata_df$value, 1)
  newdata_df$lag2 <- lag(newdata_df$value, 2)
  newdata_df <- na.omit(newdata_df)
  # forecast
  predict(model, newdata_df)
}
# forecast
rf_forecast_values <- rf_forecast(random_forest_model, test_data)
# evaluate
rf_rmse <- sqrt(mean((test_data[-(1:2)] - rf_forecast_values)^2))
cat("Random Forest Model Accuracy:", rf_rmse)

# Support Vector Regression (SVR)
# Install and Load Necessary Packages
install.packages("e1071")
library(e1071)
# Fit the SVR Model
svr_model <- svm(value ~ lag1 + lag2, data = train_df)
# summary
print(svr_model)

# Forecast and Evaluate the SVR Model
# forecast
svr_forecast_values <- predict(svr_model, train_df)
# evaluate
svr_rmse <- sqrt(mean((test_data[-(1:2)] - svr_forecast_values)^2))
cat("SVR Model Accuracy:", svr_rmse)


# Model Comparison and Selection
# After fitting and evaluating each model, it's essential to compare their performance to determine the
# best model for your specific application. In this step, we will visualise the forecast results and compare the RMSE values to select the best model.

# Visualizing Forecast Results
# determine the length of the test data
n_test <- length(test_data[-(1:2)])
# combine all forecasts
all_forecasts <- data.frame(
  time = time_test[-(1:2)],
  actual = test_data[-(1:2)],
  arima = arima_forecast$mean[1:n_test],
  linear = linear_forecast[1:n_test],
  random_forest = rf_forecast_values[1:n_test],
  svr = svr_forecast_values[1:n_test]
  )
# plot the actual data and forecasts
library(ggplot2)
ggplot(all_forecasts, aes(x = time)) + 
  geom_line(aes(y = actual, color = "Actual Data")) + 
  geom_line(aes(y = arima, color = "ARIMA")) +
  geom_line(aes(y = linear, color = "Linear Regression")) + 
  geom_line(aes(y = random_forest, color = "Random Forest")) + 
  geom_line(aes(y = svr, color = "SVR")) +
  labs(
    title = "Surface Temperature Forecast Comparison",
    x = "time",
    y = "TSK",
    color = "Model"
    ) + 
  theme_minimal()

