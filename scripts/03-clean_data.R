#### Preamble ####
# Purpose: Cleans the raw Persons in Crisis Calls for Service Attended and
#   Neighbourhood Profiles data from Open Data Toronto
# Author: Rohan Alexander, Rosie Topp
# Date: 10 May 2026
# Contact: rosie.topp@mail.utoronto.ca
# License: MIT
# Pre-requisites:
#   - The 'tidyverse' package must be installed
#   - 02-download_data.R must have been run
# Any other information needed? Make sure you are in the
#   'persons_in_crisis_calls' rproj

#### Workspace setup ####
library(tidyverse)
library(readr)

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
         apprehension_made, hood_140) |>
  filter(hood_140 != "NSA") |>
  tidyr::drop_na()

cleaned_neighbourhood <-
  raw_neighbourhood |>
  janitor::clean_names() |>
  select(5:last_col())
  

no_zeros <- 
  cleaned_persons_in_crisis |> mutate(hood_140 = sub("^0+", "", hood_140))

transposed_neigh <- as.data.frame(t(cleaned_neighbourhood))

colnames(transposed_neigh) <- transposed_neigh[1,]

transposed_neigh_cleaned <-
  transposed_neigh |>
  janitor::clean_names() |>
  select(neighbourhood_number, neither_english_nor_french, 	
         total_income_statistics_in_2015_for_the_population_aged_15_years_and_over_in_private_households,
         population_2016)

transposed_neigh_cleaned$neighbourhood_number <-
  parse_number(transposed_neigh_cleaned$neighbourhood_number)
transposed_neigh_cleaned$neither_english_nor_french <-
  parse_number(transposed_neigh_cleaned$neither_english_nor_french)
transposed_neigh_cleaned$total_income_statistics_in_2015_for_the_population_aged_15_years_and_over_in_private_households <-
  parse_number(transposed_neigh_cleaned$total_income_statistics_in_2015_for_the_population_aged_15_years_and_over_in_private_households)
transposed_neigh_cleaned$population_2016 <-
  parse_number(transposed_neigh_cleaned$population_2016)

#### Save data ####
write_csv(no_zeros,
"C:/Users/owner/starter_folder/data/02-analysis_data/persons_in_crisis_data.csv")

write_csv(transposed_neigh_cleaned,
  "C:/Users/owner/starter_folder/data/02-analysis_data/neighbourhood_data.csv")

