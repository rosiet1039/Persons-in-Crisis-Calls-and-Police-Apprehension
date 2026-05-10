#### Preamble ####
# Purpose: Downloads and saves the Persons in Crisis Calls for Service Attended
# and Neighbourhood Profiles data from Open Data Toronto
# Author: Rohan Alexander, Rosie Topp
# Date: 10 May 2026
# Contact: rosie.topp@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse', 'opendatatoronto', 'readxl', 'writexl',
#   'readr', and 'rio' packages must be installed

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(readxl)
library(writexl)
library(readr)
library(rio)

#### Download data ####
persons_in_crisis_package <-
  search_packages("Persons in Crisis Calls for Service Attended")

persons_in_crisis_resources <- persons_in_crisis_package |>
  list_package_resources()

persons_in_crisis_data <- persons_in_crisis_resources |>
  head(1) |>
  get_resource()

neighbourhood_package <-
  search_packages("Neighbourhood Profiles")

neighbourhood_resources <- neighbourhood_package |>
  list_package_resources()

neighbourhood_excel <- neighbourhood_resources |>
  head(1) |>
  get_resource()


#### Save data ####
write_csv(persons_in_crisis_data,
    "C:/Users/owner/starter_folder/data/01-raw_data/raw_persons_in_crisis.csv")

write_xlsx(neighbourhood_excel,
        "C:/Users/owner/starter_folder/data/01-raw_data/raw_neighbourhood.xlsx")

convert("C:/Users/owner/starter_folder/data/01-raw_data/raw_neighbourhood.xlsx",
        "C:/Users/owner/starter_folder/data/01-raw_data/raw_neighbourhood.csv")

