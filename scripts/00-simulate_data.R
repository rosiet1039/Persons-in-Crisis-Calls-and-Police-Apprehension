#### Preamble ####
# Purpose: Simulates a dataset of Persons in Crisis calls that were attended by
# the Toronto Police Services
# Author: Rosie Topp, Rohan Alexander
# Date: 10 May 2026
# Contact: rosie.topp@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse' package must be installed
# Any other information needed? Make sure you are in the
#   'persons_in_crisis_calls' rproj

#### Workspace setup ####
library(tidyverse)
set.seed(1039)


#### Simulate data ####
# Event month
month <- c(
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
)

# Event day of the week
dow <- c("Sunday",
               "Monday",
               "Tuesday",
               "Wednesday",
               "Thursday",
               "Friday",
               "Saturday")

# Event type
type <- c("Suicide-related", "Person in Crisis", "Overdose")

# Division
division <- c("D11", "D12", "D13", "D14", "D22", "D23", "D31", "D32", "D33",
              "D41", "D42", "D43", "D51", "D52", "D53", "D54", "D55")

# Create a dataset by randomly assigning event dates, divisions, types, and
#   neighbourhoods

simulated_pic <- tibble(
  event_year = sample(c(2014, 2015), size = 31944, replace = TRUE),
  event_month = sample(month, size = 31944, replace = TRUE),
  event_dow = sample(dow, size = 31944, replace = TRUE),
  event_hour = sample(0:23, size = 31944, replace = TRUE),
  event_type = sample(type, size = 31944, replace = TRUE),
  division = sample(division, size = 31944, replace = TRUE),
  apprehension_made = sample(c("Yes", "No"), size = 31944,
                      prob = c(0.22, 0.78), # rough proportion of apprehensions
                      replace = TRUE),
  hood_140 = sample(1:140, size = 31944, replace = TRUE)
)


#### Save data ####
write_csv(simulated_pic,
      "C:/Users/owner/starter_folder/data/00-simulated_data/simulated_pic.csv")

