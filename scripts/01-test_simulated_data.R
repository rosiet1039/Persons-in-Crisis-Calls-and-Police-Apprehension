#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Persons in Crisis
#   Calls for Service Attended data
# Author: Rosie Topp, Rohan Alexander
# Date: 10 May 2026
# Contact: rosie.topp@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The 'tidyverse' package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the
#   'persons_in_crisis_calls' rproj


#### Workspace setup ####
library(tidyverse)

simulated_pic <- read_csv(
  "C:/Users/owner/starter_folder/data/00-simulated_data/simulated_pic.csv")

# Test if the data was successfully loaded
if (exists("simulated_pic")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 151 rows
if (nrow(simulated_pic) == 31944) {
  message("Test Passed: The dataset has 31944 rows.")
} else {
  stop("Test Failed: The dataset does not have 31944 rows.")
}

# Check if the dataset has 8 columns
if (ncol(simulated_pic) == 8) {
  message("Test Passed: The dataset has 8 columns.")
} else {
  stop("Test Failed: The dataset does not have 8 columns.")
}

# Check if the 'event_month' column contains only valid months
valid_month <- c(
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

if (all(simulated_pic$event_month %in% valid_month)) {
  message("Test Passed: The 'event_month' column contains only valid months.")
} else {
  stop("Test Failed: The 'event_month' column contains invalid month.")
}

# Check if the 'event_dow' column contains only valid days of the week
valid_dow <- c("Sunday",
               "Monday",
               "Tuesday",
               "Wednesday",
               "Thursday",
               "Friday",
               "Saturday")

if (all(simulated_pic$event_dow %in% valid_dow)) {
  message("Test Passed: The 'event_dow' column contains only valid dow")
} else {
  stop("Test Failed: The 'event_dow' column contains invalid dow")
}

# Check if the 'event_type' column contains only valid PIC event types
valid_type <- c("Suicide-related", "Person in Crisis", "Overdose")

if (all(simulated_pic$event_type %in% valid_type)) {
  message("Test Passed: The 'event_type' column contains only valid types")
} else {
  stop("Test Failed: The 'event_type' column contains invalid type")
}

# Check if the 'division' column contains only valid TPS divisions
valid_division <- c("D11", "D12", "D13", "D14", "D22", "D23", "D31", "D32",
                  "D33", "D41", "D42", "D43", "D51", "D52", "D53", "D54", "D55")

if (all(simulated_pic$division %in% valid_division)) {
  message("Test Passed: The 'event_type' column contains only valid divisions")
} else {
  stop("Test Failed: The 'event_type' column contains invalid division")
}

# Check if the 'hood_140' column contains only valid neighbourhood numbers
valid_hood <- 1:140

if (all(simulated_pic$hood_140 %in% valid_hood)) {
  message("Test Passed: The 'hood_140' column contains only valid neighbourhood
          numbers")
} else {
  stop("Test Failed: The 'hood_140' column contains invalid neighbourhood
       number")
}

# Check if there are any missing values in the dataset
if (all(!is.na(simulated_pic))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'event_month', 'event_dow', 'division',
#   and 'hood_140' columns
if (all(simulated_pic$event_month != "" & simulated_pic$event_dow != ""
        & simulated_pic$division != "" & simulated_pic$hood_140 != "")) {
  message("Test Passed: There are no empty strings in 'event_month', 'event_dow', 'division',
   'hood_140'.")
} else {
  stop("Test Failed: There are empty strings in one or more columns.")
}

# Check if the dataset contains at least two distinct rows
if (n_distinct(simulated_pic) >= 2) {
  message("Test Passed: The dataset contains at least two unique rows")
} else {
  stop("Test Failed: The dataset contains less than two unique rows")
}
