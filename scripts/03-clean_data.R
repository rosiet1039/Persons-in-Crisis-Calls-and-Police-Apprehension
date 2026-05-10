#### Preamble ####
# Purpose: Cleans the raw Persons in Crisis Calls for Service Attended and
#   Neighbourhood Profiles data from Open Data Toronto
# Author: Rohan Alexander, Rosie Topp
# Date: 10 May 2026
# Contact: rosie.topp@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install tidyverse packages

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_persons_in_crisis <-
  read_csv(
    "C:/Users/owner/starter_folder/data/01-raw_data/raw_persons_in_crisis.csv")

raw_neighbourhood <-
  read_csv(
    "C:/Users/owner/starter_folder/data/01-raw_data/raw_neighbourhood.csv")

cleaned_persons_in_crisis <-
  raw_persons_in_crisis |>
  janitor::clean_names() |>
  select(event_year, event_month, event_dow, event_hour, event_type, division,
         apprehension_made, hood_158, neighbourhood_158) |>
  filter(hood_158 != "NSA") |>
  tidyr::drop_na()

cleaned_neighbourhood <-
  raw_neighbourhood |>
  janitor::clean_names() |>
  tidyr::drop_na()

no_zeros <- 
  cleaned_persons_in_crisis |> mutate(hood_158 = sub("^0+", "", hood_158))

transposed_neigh <- as.data.frame(t(cleaned_neighbourhood))

colnames(transposed_neigh) <- transposed_neigh[1,]
transposed_neigh_sliced <- transposed_neigh[-1, ]

#### Save data ####
write_csv(no_zeros,
"C:/Users/owner/starter_folder/data/02-analysis_data/persons_in_crisis_data.csv")

write_csv(transposed_neigh_sliced,
          "C:/Users/owner/starter_folder/data/02-analysis_data/neighbourhood_data.csv")

