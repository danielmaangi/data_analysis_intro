# Title: Introduction to Data Analytics Using R
# Module: Data Import, Tidying and Transformation
# Author: Daniel Maangi
# Date: 2025-01-13
# Email: dmaangi@statbricks.com

# Overview: This script provides an introduction to the Basics of R syntax.

# Topics Covered:
#   - Variables, Vsriable Names, Variable Assignment
#   - Operators
#   - Control flow
#   - Data structures

# Prerequisites:
#   - R installed
#   - RStudio IDE installed

# Packages Used:
#   - usethis
#   - tidyverse
#   - data.table

# Datasets
# https://www.kaggle.com/datasets/kmldas/hr-employee-data-descriptive-analytics

# Notes:
#   - This script is intended for beginners with little to no prior experience in data analytics.
#   - Feel free to modify and adapt the code to your specific needs.

# Let's get started!

# ============================================================================
# 03-01: Data Import
# ============================================================================

# R provides powerful tools for importing data from various sources:
## Importing CSV Files
##----------------------------------------------------------------------------
library(readr) # From tidyverse
fit_data <- readr::read_csv("data/health_fitness_dataset.csv")
dim(fit_data)

# write / save in CSV fomart
write.csv(fit_data, "output/health_fitness_dataset_output.csv")
library(data.table)
fwrite(fit_data, "output/health_fitness_dataset_output.csv")

## Importing Excel files
##-----------------------------------------------------------------------------
library(readxl) # From tidyverse
employees <- read_excel("data/HR_Employee_Data.xlsx",
                        sheet = "HR_Employee_Data")
dim(employees)


# Write/ Save in XLSX format
library(openxlsx)
write.xlsx(employees, "output/employees_output.xlsx")
## Execution Time
library(tictoc) # convenient for measuring execution time
tic("Writing CSV with Base R: write.csv")
write.csv(fit_data, "output/health_fitness_dataset_output.csv")
toc()

tic("Writing CSV using data.table::fwrite()")
fwrite(fit_data, "output/health_fitness_dataset_output.csv")
toc()


cola <- read_excel("data/Cola.xlsx",
                   skip = 3)



# 1. Data manipulation
#====================================================================

# We will use the health_fitness_dataset for this session

# Importing the data
library(readr) #fast and convenient way to import data
fit_data <- readr::read_csv("data/health_fitness_dataset.csv")

## Understand the data
library(dplyr) # grammar for data manipulation
glimpse(fit_data)


# Filtering and Selecting Data
#------------------------------------------------------------
# Select the first 10 records of the dataset
first10 <- fit_data |> # %>%
  slice(1:10)

first100_120 <- fit_data |> # %>%
  slice(100:120)

# Find all records for participant with participant_id 5
library(dplyr)
participant_5_data <- fit_data %>%
  filter(participant_id == 5)

participants_5_10 <- fit_data %>%
  filter(participant_id %in% c(5, 10) &
         gender == "F") %>%
  select(participant_id, gender)


# Select only the date, activity_type, duration_minutes, and calories_burned columns:

activity_summary <- fit_data %>%
  select(date, activity_type, duration_minutes, calories_burned)

activity_summary

# Select only 3 columns (age, bmi, gender, date)
# filter where date is greater than 2024-01-10
age_bmi_gender <- fit_data %>%
  select(age, bmi, gender, date) %>%
  filter(date > '2024-01-10')

age_bmi_gender

# Find all records where activity_type is "Swimming" and intensity is "High":
high_intensity_swimming <- fit_data %>%
  filter(activity_type == "Swimming" & intensity == "High")

high_intensity_swimming %>%
  select(activity_type, intensity) %>%
  distinct()

# 2. Arranging and Mutating Data
#=========================================================================
# Sort the data by participant_id and then by date in descending order:
sorted_data <- fit_data %>%
  arrange(participant_id, desc(date))

# Create a new variable calories_per_minute by dividing calories_burned by duration_minutes:
fit_data <- fit_data %>%
  mutate(calories_per_minute = calories_burned / duration_minutes)


# Create a new variable bmi_category based on bmi values:
fit_data <- fit_data %>%
  mutate(bmi_category = case_when(
    bmi < 18.5 ~ "Underweight",
    bmi >= 18.5 & bmi < 25 ~ "Normal",
    bmi >= 25 & bmi < 30 ~ "Overweight",
    bmi >= 30 ~ "Obese"
  ))

## ------- Quick summaries
fit_data %>%
  group_by(bmi_category) %>%
  tally()

library(janitor)
fit_data %>%
  tabyl(bmi_category)


library(sjmisc)
frq(fit_data$bmi_category)




# 3. Grouping and Summarizing
# Calculate the average calories_burned for each activity_type:
fit_data %>%
  group_by(activity_type) %>%
  summarize(avg_calories = mean(calories_burned, na.rm = TRUE)) %>%
  arrange(desc(avg_calories))


# Calculate the total duration_minutes for each participant_id for each intensity level:
fit_data %>%
  group_by(participant_id, intensity) %>%
  summarize(total_minutes = sum(duration_minutes, na.rm = TRUE))


# Reshaping Data
# Convert the previous result to a wider fomart where intensity values are columns

fit_data %>%
  group_by(participant_id, intensity) %>%
  summarize(total_minutes = sum(duration_minutes, na.rm = TRUE)) %>%
  pivot_wider(names_from = intensity, values_from = total_minutes)

# Convert back to the longer fomart
fit_data %>%
  group_by(participant_id, intensity) %>%
  summarize(total_minutes = sum(duration_minutes, na.rm = TRUE)) %>%
  pivot_wider(names_from = intensity, values_from = total_minutes) %>%
  pivot_longer(cols = High : Medium) %>%
  rename(total_minutes = value,
         intensity = name)

# 5.  String Manipulation
library(stringr)
fit_data <- fit_data %>%
  mutate(activity_type_lower = str_to_lower(activity_type))

# Create a new variable activity_category based on activity_type, grouping
# similar activities together (e.g., "cardio" for "running", "swimming", "cycling"):
fit_data <- fit_data %>%
  mutate(activity_category = case_when(
    activity_type %in% c("running", "swimming", "cycling") ~ "cardio",
    activity_type %in% c("weight training", "hiit") ~ "strength_training",
    TRUE ~ "other"
  ))



# Assignment - To Present in the next class
#==========================================================================================
# Deliverable - A producible R code that generates data as in Clean 1 worksheet

# The dataset from an e-commerce that includes information on:
# - customer segments: Consumer: Individuals purchasing for personal use.
                     # Corporate: Businesses purchasing for operational needs.
                     # Home Office: Small businesses or individuals setting up a home office.
# - shipping modes: Refers to the mode of shipment chosen for the order.
                  # "First Class" suggests a premium shipping option.
                  # Other include "Standard Class," "Second Class," or "Same Day."
# - orderid: A unique identifier for each order. This is critical for tracking individual
            # transactions and ensuring there are no duplicates.
            # - sales: Represents the monetary value of each order

# hint: use  map_chr(~ paste(., collapse = "|"))  or
# apply(x[],
#      2, # 1 indicates rows, 2 indicates columns
#      function(x) paste(x, collapse = " >> "))






