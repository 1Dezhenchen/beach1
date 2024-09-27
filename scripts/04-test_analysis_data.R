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
# [...UPDATE THIS...]

#### Test data ####

# Check if windSpeed is numeric
is_numeric_windSpeed <- is.numeric(data$windSpeed)

# Check if waveAction is a categorical variable (factor or character)
is_categorical_waveAction <- is.factor(data$waveAction) | is.character(data$waveAction)

# Check if there are any NA values
no_na_values <- all(!is.na(data))

# Check if rainAmount is non-negative
rainAmount_non_negative <- all(data$rainAmount >= 0)

# Check if windSpeed is within the valid range (0 to 100)
windSpeed_in_range <- all(data$windSpeed >= 0 & data$windSpeed <= 100)

# Check if waveAction values are within the expected categories
expected_wave_actions <- c("high", "low", "moderate", "none")
valid_waveAction <- all(data$waveAction %in% expected_wave_actions)

# Check if waterClarity values are within the expected categories
expected_clarity <- c("Clear", "Muddy", "Cloudy")
valid_waterClarity <- all(data$waterClarity %in% expected_clarity)

#### Summary of test results ####
test_results <- list(
  is_numeric_windSpeed = is_numeric_windSpeed,
  is_categorical_waveAction = is_categorical_waveAction,
  no_na_values = no_na_values,
  rainAmount_non_negative = rainAmount_non_negative,
  windSpeed_in_range = windSpeed_in_range,
  valid_waveAction = valid_waveAction,
  valid_waterClarity = valid_waterClarity
)

# Output test results
test_results



