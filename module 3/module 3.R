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


















