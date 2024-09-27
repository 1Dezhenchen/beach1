#### Preamble ####
# Purpose: Simulates the cleaned data 
# Author:DEZHEN CHEN
# Date: 27 September 2024
# Contact: dezhen.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("toronto-beaches-observations")
package

# get all resources for this package
resources <- list_package_resources("toronto-beaches-observations")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data1 <- filter(datastore_resources, row_number()==1) %>% get_resource()
data1



#### Save data ####

# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(data1, "/Users/chendezhen/Documents/GitHub/beach/beach1/starter_folder-main 2/data/raw_data") 

