#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

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

