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

# Neighbourhood number in new 158 system
hood <- c(71, 73, 78, 58, 171, 95, 123, 167, 25, 110, 173, 88, 54, 37, 136,
              98, 79, 158, 97, 160, 6, 74, 7, 151, 36, 134, 84, 168, 124, 59,
              39, 2, 48, 31, 159, 72, 92, 81, 144, 86, 120, 122, 129, 126, 147,
              63, 90, 85, 34, 8, 66, 70, 87, 16, 155, 57, 170, 69, 166, 50, 154,
              20, 32, 1, 111, 116, 121, 113, 108, 68, 130, 35, 30, 83, 46, 163,
              164, 100, 174, 99, 22, 140, 40, 43, 139, 135, 53, 67, 118, 47, 64,
              27, 172, 89, 138, 106, 142, 18, 162, 11, 5, 41, 21, 62, 169, 109,
              55, 107, 105, 125, 52, 94, 44, 10, 96, 119, 165, 42, 61, 102, 24,
              148, 146, 128, 60, 161, 103, 13, 156, 38, 65, 80, 150, 141, 3,
              115, 143, 149, 145, 29, 49, 112, 157, 56, 152, 23, 101, 91, 19, 4,
              15, 12, 153, 33, 133, 114, 9, 28)

# Neighbourhood name in new 158 system
neighbourhood <- c("Cabbagetown-South St.James Town (71)", "Moss Park (73)",
                       "Kensington-Chinatown (78)", "Old East York (58)",
                       "Junction-Wallace Emerson (171)", "Annex (95)",
                       "Cliffcrest (123)", "Church-Wellesley (167)",
                       "Glenfield-Jane Heights (25)",
                       "Keelesdale-Eglinton West (110)", "North Toronto (173)",
                       "High Park North (88)", "O'Connor-Parkview (54)",
                       "Willowdale West (37)", "West Hill (136)",
                       "Rosedale-Moore Park (98)", "University (79)",
                       "Islington (158)", "Yonge-St.Clair (97)",
                       "Mimico-Queensway (160)",
                       "Kingsview Village-The Westway (6)",
                       "North St.James Town (74)",
                       "Willowridge-Martingrove-Richview (7)",
                       "Yonge-Doris (151)", "Newtonbrook West (36)",
                       "Highland Creek (134)", "Little Portugal (84)",
                       "Downtown Yonge East (168)", "Kennedy Park (124)",
                       "Danforth East York (59)", "Bedford Park-Nortown (39)",
                       "Mount Olive-Silverstone-Jamestown (2)",
                       "Hillcrest Village (48)","Yorkdale-Glen Park (31)",
                       "Etobicoke City Centre (159)", "Regent Park (72)",
                       "Corso Italia-Davenport (92)", "Trinity-Bellwoods (81)",
                       "Morningside Heights (144)", "Roncesvalles (86)",
                       "Clairlea-Birchmount (120)",
                       "Birchcliffe-Cliffside (122)", "Agincourt North (129)",
                       "Dorset Park (126)", "L'Amoreaux West (147)",
                       "The Beaches (63)", "Junction Area (90)",
                       "South Parkdale (85)", "Bathurst Manor (34)",
                       "Humber Heights-Westmount (8)", "Danforth (66)",
                       "South Riverdale (70)", "High Park-Swansea (87)",
                       "Stonegate-Queensway (16)", "Downsview (155)",
                       "Broadview North (57)", "Yonge-Bay Corridor (170)",
                       "Blake-Jones (69)",
                       "St Lawrence-East Bayfront-The Islands (166)",
                       "Newtonbrook East (50)",
                       "Oakdale-Beverley Heights (154)", "Alderwood (20)",
                       "Englemount-Lawrence (32)", "West Humber-Clairville (1)",                 
                       "Rockcliffe-Smythe (111)", "Steeles (116)",
                       "Oakridge (121)", "Weston (113)",
                       "Briar Hill-Belgravia (108)", "North Riverdale (68)",
                       "Milliken (130)", "Westminster-Branson (35)",
                       "Brookhaven-Amesbury (30)", "Dufferin Grove (83)",
                       "Pleasant View (46)", "Fort York-Liberty Village (163)",
                       "Wellington Place (164)", "Yonge-Eglinton (100)",
                       "South Eglinton-Davisville (174)",
                       "Mount Pleasant East (99)", "Humbermede (22)",
                       "Guildwood (140)", "St.Andrew-Windfields (40)",
                       "Victoria Village (43)", "Scarborough Village (139)",
                       "Morningside (135)", "Henry Farm (53)",
                       "Playter Estates-Danforth (67)",
                       "Tam O'Shanter-Sullivan (118)",
                       "Don Valley Village (47)", "Woodbine Corridor (64)",
                       "York University Heights (27)",
                       "Dovercourt Village (172)",
                       "Runnymede-Bloor West Village (89)",
                       "Eglinton East (138)", "Humewood-Cedarvale (106)",
                       "Woburn North (142)", "New Toronto (18)",
                       "West Queen West (162)",
                       "Eringate-Centennial-West Deane (11)",
                       "Elms-Old Rexdale (5)",
                       "Bridle Path-Sunnybrook-York Mills (41)",
                       "Humber Summit (21)", "East End-Danforth (62)",
                       "Bay-Cloverhill (169)", "Caledonia-Fairbank (109)",
                       "Thorncliffe Park (55)", "Oakwood Village (107)",
                       "Lawrence Park North (105)", "Ionview (125)",
                       "Bayview Village (52)", "Wychwood (94)",
                       "Flemingdon Park (44)", "Princess-Rosethorn (10)",
                       "Casa Loma (96)", "Wexford/Maryvale (119)",
                       "Harbourfront-CityPlace (165)", "Banbury-Don Mills (42)",
                       "Taylor-Massey (61)", "Forest Hill North (102)",
                       "Black Creek (24)", "East L'Amoreaux (148)",
                       "Malvern East (146)",
                       "Agincourt South-Malvern West (128)",
                       "Woodbine-Lumsden (60)", "Humber Bay Shores (161)",
                       "Lawrence Park South (103)", "Etobicoke West Mall (13)",
                       "Bendale-Glen Andrew (156)", "Lansing-Westgate (38)",
                       "Greenwood-Coxwell (65)", "Palmerston-Little Italy (80)",
                       "Fenside-Parkwoods (150)",
                       "Golfdale-Cedarbrae-Woburn (141)",
                       "Thistletown-Beaumond Heights (3)", "Mount Dennis (115)",
                       "West Rouge (143)", "Parkwoods-O'Connor Hills (149)",
                       "Malvern West (145)", "Maple Leaf (29)",
                       "Bayview Woods-Steeles (49)",
                       "Beechborough-Greenbrook (112)", "Bendale South (157)",
                       "Leaside-Bennington (56)", "East Willowdale (152)",
                       "Pelmo Park-Humberlea (23)", "Forest Hill South (101)",
                       "Weston-Pelham Park (91)", "Long Branch (19)",
                       "Rexdale-Kipling (4)", "Kingsway South (15)",
                       "Markland Wood (12)", "Avondale (153)",
                       "Clanton Park (33)", "Centennial Scarborough (133)",
                       "Lambton Baby Point (114)",
                       "Edenbridge-Humber Valley (9)", "Rustic (28)")

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
  hood_158 = sample(hood, size = 31944, replace = TRUE),
  neighbourhood_158 = sample(neighbourhood, size = 31944, replace = TRUE)
)


#### Save data ####
write_csv(simulated_pic,
      "C:/Users/owner/starter_folder/data/00-simulated_data/simulated_pic.csv")
