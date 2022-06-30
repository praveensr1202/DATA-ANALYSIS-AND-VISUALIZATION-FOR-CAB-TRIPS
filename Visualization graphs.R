library(ggplot2)
library(ggthemes)
library(lubridate)
library(dplyr)
library(tidyr)
library(DT)
library(scales)


apr_data <- read.delim(file="/Users/S.R.PRAVEEN/Desktop/Data Viz/uber-raw-data-apr14.csv",header=TRUE,sep=",")
attach(apr_data)
may_data <- read.delim(file="/Users/S.R.PRAVEEN/Desktop/Data Viz/uber-raw-data-may14.csv",header=TRUE,sep=",")
attach(may_data)
jun_data <- read.delim(file="/Users/S.R.PRAVEEN/Desktop/Data Viz/uber-raw-data-jun14.csv",header=TRUE,sep=",")
attach(jun_data)
jul_data <- read.delim(file="/Users/S.R.PRAVEEN/Desktop/Data Viz/uber-raw-data-jul14.csv",header=TRUE,sep=",")
attach(jul_data)
aug_data <- read.delim(file="/Users/S.R.PRAVEEN/Desktop/Data Viz/uber-raw-data-aug14.csv",header=TRUE,sep=",")
attach(aug_data)
sep_data <- read.delim(file="/Users/S.R.PRAVEEN/Desktop/Data Viz/uber-raw-data-sep14.csv",header=TRUE,sep=",")
attach(sep_data)

colors1 = c("#CC1011", "#665555", "#05a399", "#cfcaca", "#f5e840", "#0683c9", "#e075b0")
colors2 = c("#3edbf0", "#04009a", "#77acf1", "#c0fefc", "#e84545", "#f05945", "#007580")
colors3 = c("#a2b29f", "#194350", "#822659", "#ff75a0", "#fce38a", "#95e1d3", "#ff8882")

data_2014 <- rbind(apr_data, may_data, jun_data, jul_data, aug_data, sep_data)
data_2014

data_2014$Date.Time <- as.POSIXct(data_2014$Date.Time, format = "%m/%d/%Y %H:%M:%S")
data_2014$Date.Time

data_2014$Time <- format(as.POSIXct(data_2014$Date.Time, format = "%m/%d/%Y %H:%M:%S"), format="%H:%M:%S")
data_2014$Time

data_2014$Date.Time <- ymd_hms(data_2014$Date.Time)
data_2014$Date.Time

data_2014$day <- factor(day(data_2014$Date.Time))
data_2014$day

data_2014$month <- factor(month(data_2014$Date.Time, label = TRUE))
data_2014$month

data_2014$year <- factor(year(data_2014$Date.Time))
data_2014$year

data_2014$dayofweek <- factor(wday(data_2014$Date.Time, label = TRUE))
data_2014$dayofweek


data_2014$hour <- factor(hour(hms(data_2014$Time)))
data_2014$hour

data_2014$minute <- factor(minute(hms(data_2014$Time)))
data_2014$minute

data_2014$second <- factor(second(hms(data_2014$Time)))
data_2014$second

hour_data <- data_2014 %>% group_by(hour) %>% dplyr::summarize(Total = n()) 

month_hour <- data_2014 %>% group_by(month, hour) %>% dplyr::summarize(Total = n())

day_group <- data_2014 %>% group_by(day) %>% dplyr::summarize(Total = n()) 

day_month_group <- data_2014 %>% group_by(month, day) %>%  dplyr::summarize(Total = n())

month_group <- data_2014 %>% group_by(month) %>% dplyr::summarize(Total = n()) 

month_weekday <- data_2014 %>%  group_by(month, dayofweek) %>%  dplyr::summarize(Total = n())

day_and_hour <- data_2014 %>%  group_by(day, hour) %>%  dplyr::summarize(Total = n())

#Plotting the trips by the hours in a day
ggplot(hour_data, aes(hour, Total)) + 
  geom_bar( stat = "identity", fill = "steelblue", color = "red") +
  ggtitle("Trips Every Hour") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma)


#Plotting the trips by hour and month
ggplot(month_hour, aes(hour, Total, fill = month)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips by Hour and Month") +
  scale_y_continuous(labels = comma)

# Trips Every Day
ggplot(day_group, aes(day, Total)) + 
  geom_bar( stat = "identity", fill = "#f8a1d1", color = "#822659") +
  ggtitle("Trips Every Day") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma)

# Trips by Day and Month
ggplot(month_weekday, aes(month, Total, fill = dayofweek)) + 
  geom_bar( stat = "identity", position = "dodge") +
  ggtitle("Trips by Day and Month") +
  scale_y_continuous(labels = comma) +
  scale_fill_manual(values = colors3)


# Trips Every Month

ggplot(month_group, aes(month, Total, fill = month)) + 
  geom_bar( stat = "identity") +
  ggtitle("Trips Every Month") +
  theme(legend.position = "none") +
  scale_y_continuous(labels = comma) +
  scale_fill_manual(values = colors2)

#Plotting the number of trips by bases
ggplot(data_2014, aes(Base)) + 
  geom_bar(fill = "darkred") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases")

#Trips by bases and month
ggplot(data_2014, aes(Base, fill = month)) + 
  geom_bar(position = "dodge") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases and Month") +
  scale_fill_manual(values = colors1)

#Trips by bases and days of the week
ggplot(data_2014, aes(Base, fill = dayofweek)) + 
  geom_bar(position = "dodge") +
  scale_y_continuous(labels = comma) +
  ggtitle("Trips by Bases and DayofWeek") +
  scale_fill_manual(values = colors2)

#plotting Heatmap by Hour and Day
ggplot(day_and_hour, aes(day, hour, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Hour and Day")

#plotting Heatmap by Month and Day
ggplot(day_month_group, aes(day, month, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Month and Day")

#plotting Heatmap by Month and Day of week
ggplot(month_weekday, aes(dayofweek, month, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Month and Day of Week")


month_base <-  data_2014 %>%
  group_by(Base, month) %>%
  dplyr::summarize(Total = n()) 

day0fweek_bases <-  data_2014 %>%
  group_by(Base, dayofweek) %>%
  dplyr::summarize(Total = n()) 


#plotting Heatmap by Month and Bases
ggplot(month_base, aes(Base, month, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Month and Bases")

#plotting Heatmap by Bases and Day of week
ggplot(day0fweek_bases, aes(Base, dayofweek, fill = Total)) +
  geom_tile(color = "white") +
  ggtitle("Heat Map by Bases and Day of Week")


