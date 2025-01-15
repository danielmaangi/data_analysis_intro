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
# https://www.kaggle.com/datasets/juicobowley/drake-lyrics
# https://www.kaggle.com/datasets/austinkennell/excel-portfolio-project

# Notes:
#   - This script is intended for beginners with little to no prior experience in data analytics.
#   - Feel free to modify and adapt the code to your specific needs.

# Let's get started!

# ============================================================================
# 03-01: Data Import
# ============================================================================

# R provides powerful tools for importing data from various sources:
# We will focus on the readr package

## Importing CSV Files
##----------------------------------------------------------------------------
library(readr) # From tidyverse
drake_data <- readr::read_csv("data/drake_data.csv")
dim(drake_data)

## Importing text files
##-----------------------------------------------------------------------------
library(readr) # From tidyverse
drake_lyrics <- readr::read_delim("data/drake_data.csv", delim = "\t")
dim(drake_data)

















