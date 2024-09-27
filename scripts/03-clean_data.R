#### Preamble ####
# Purpose: Simulates the cleaned data 
# Author:DEZHEN CHEN
# Date: 27 September 2024
# Contact: dezhen.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

library(dplyr)

# Clean data: Remove NA values only for specific columns and handle outliers with reasonable limits
cleaned_data <- data1 %>%
  # Remove rows where key columns have NA values
  filter(!is.na(waterTemp) & !is.na(windSpeed) & !is.na(airTemp) & 
           !is.na(turbidity) & !is.na(rainAmount) & !is.na(waterFowl)) %>%
  # Remove rows with non-finite values (e.g., Inf, -Inf) for key numeric columns
  filter(is.finite(waterTemp) & is.finite(windSpeed) & is.finite(airTemp)) %>%
  # Filter water temperature (waterTemp) to be between 0°C and 40°C
  filter(waterTemp >= 0 & waterTemp <= 40) %>%
  # Filter wind speed (windSpeed) to be between 0 and 100 km/h
  filter(windSpeed >= 0 & windSpeed <= 100) %>%
  # Filter air temperature (airTemp) to be between -10°C and 40°C
  filter(airTemp >= -10 & airTemp <= 40)

any(is.na(cleaned_data))







#### Save data ####
write_csv(cleaned_data, "/Users/chendezhen/Documents/GitHub/beach/beach1/starter_folder-main 2/data/cleaned_data.csv")

