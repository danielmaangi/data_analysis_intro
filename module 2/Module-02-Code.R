# Title: Introduction to Data Analytics Using R
# Module: Basics of R Syntax
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

# Notes:
#   - This script is intended for beginners with little to no prior experience in data analytics.
#   - Feel free to modify and adapt the code to your specific needs.

# Let's get started!

# ============================================================================
# 02-01: Variable Names
# ============================================================================
# Legal variable names:
myname <- "Luiz"
my_name <- "Luiz"
myName <- "Luiz"
MYNAME <- "Luiz"
myname2 <- "Luiz"
.myname <- "Luiz"

# Illegal variable names:
2myname <- "Luiz"
my-name <- "Luiz"
my name <- "Luiz"
_my_name <- "Luiz"
my_n@me <- "Luiz"
TRUE <- "Luiz"

# Variables are Case Sensitive
age <- 10
Age <- 20
AGE <- 30
age + Age + AGE

# ============================================================================
# 02-02: Data Types
# ============================================================================
# Numeric: Floating point
age <- 20.5
class(age)
# Numeric: integer
age <- 20L
class(age)
# complex variable
var <- 50i + 3
class(var)
# character/string
city <- "Greece"
class(city)
# logical/boolean
is_student <- TRUE
class(is_student)


# ============================================================================
# 02-03: Operators
# ============================================================================
#   - Assignment Operators
#   - Arithmetic Operators
#   - Comparison Operators
#   - Logical Operators
#   - Miscellaneous Operators.

# ============================================================================
# 02-03-01: Assignment Operators: To assign values to variables
# ============================================================================
# Local assignment
x <- 10 # Left Hand assignment
20 -> y # Right Hand Assignment
x;y

# Global Assignment
#---------------------------------------
add_xy <- function(){
  x <<- 50
  y <- 40
  print(x + y)
}

add_xy()
x;y

# When using the “<-” inside a function, it’s scope is
# limited to within the function. However, the “<<-” has
# the ability to assign values of variables outside the function .

# ============================================================================
# 02-03-02: Arithmetic Operators: Perform mathematical calculations
# ============================================================================

# Arithmetic Operations
a <- 11
b <- 5

a + b  # Addition
a - b  # Subtraction
a * b  # Multiplication
a / b  # Division
a ^ b  # Exponentiation
a %% b # Modulus (remainder)
a %/% b # Integer Division


# ============================================================================
# 02-03-03: Comparison Operators: Compare values and return logical results.
# ============================================================================
a > b  # Greater than
a < b  # Less than
a >= b # Greater than or equal to
a <= b # Less than or equal to
a == b # Equal to
a != b # Not equal to


# ============================================================================
# 02-03-04: Logical Operators: Combine conditional statements.
# ============================================================================
x <- TRUE
y <- FALSE

x & y  # AND (TRUE if both x and y are TRUE)
x | y  # OR (TRUE if either x or y is TRUE)
!x     # NOT (TRUE if x is FALSE)

# Note the inputs and respective outputs
c(TRUE, FALSE, TRUE) & c(FALSE, TRUE, TRUE)
c(TRUE, FALSE, TRUE) && c(FALSE, TRUE, TRUE)

# Scalar AND
TRUE && FALSE


# ============================================================================
# 02-04: Control flow: if..else statements
# ============================================================================
# The basic if statement evaluates a condition, and if the condition is TRUE,
# it executes the code block within the curly braces {}.

x <- 10
if (x > 5) {
  print("x is greater than 5")
}

# The if...else statement extends the if statement by providing an alternative
# code block to execute when the condition is FALSE.

x <- 3
if (x > 5) {
  print("x is greater than 5")
} else {
  print("x is not greater than 5")
}

# For more complex scenarios with multiple conditions, you can chain multiple
# if...else if blocks together.

x <- 7
if (x > 10) {
  print("x is greater than 10")
} else if (x > 5) {
  print("x is greater than 5 but not greater than 10")
} else {
  print("x is not greater than 5")
}


# You can also nest if...else statements within each other to create
# more detailed decision-making logic.

age <- 25
gender <- "Male"

if (age >= 20) {
  if (gender == "Female") {
    print("Age is greater than 20 and gender is Female")
  } else {
    print("Age is more than 20 but gender male")
  }
} else {
  print("Age is less 20")
}


# ============================================================================
# 02-06: Vectorized if...else: ifelse()
# ============================================================================

ages <- c(25, 30, 18, 42)

# Classify ages as "adult" or "minor"
adult_or_minor <- ifelse(ages >= 18, "adult", "minor")
print(adult_or_minor)

# more complex conditions
#---------------------------------------------------------------
# Define a numeric vector
numbers <- c(5, 10, 15, 20, 25)

# Apply vectorized if statement with multiple conditions
result <- ifelse(numbers < 10, "Less than 10",
                 ifelse(numbers <= 20, "Between 10 and 20",
                        "Greater than 20"))

print(result)



# ============================================================================
# 02-06: Data Structures
# ============================================================================
#   - Vectors: Atomic vectors and Lists
#   - Matrices
#   - Arrays
#   - Data Frames
#   - Factors

# ============================================================================
# 03-01: Vectors: The most basic data structure
# ============================================================================

# Atomic: Numeric vector
numeric_vector <- c(1, 2.5, 3.14, 4)
numeric_vector
class(numeric_vector)

# Atomic:Character vector
char_vector <- c("apple", "banana", "cherry")
char_vector
class(char_vector)

# Atomic:Logical vector
logical_vector <- c(TRUE, FALSE, TRUE)
logical_vector
class(logical_vector)


# List
my_list <- list(1, "hello", TRUE, c(2, 4, 6))
my_list
class(my_list)


# ============================================================================
# 03-02: Matrices: Two-dimensional arrays with rows and columns
# ============================================================================
# Create a 2x3 matrix
my_matrix <- matrix(c(1, 2, 3, 4, 5, 6),
                    nrow = 2,
                    ncol = 3)

my_matrix

# Accessing elements of the matrix
my_matrix[1, 2]  # Element at row 1, column 2



# ============================================================================
# 03-03: Arrays: Arrays are multi-dimensional extensions of matrices
# ============================================================================

# Create a 3-dimensional array (2x3x2)
# 4 (rows): Number of rows in each "slice."
# 3 (columns): Number of columns in each "slice."
# 2 (slices): Number of "slices" (or layers) in the array.

my_array <- array(1:24,
                  dim = c(4, 3, 2))


my_array

# Accessing elements
my_array[1, 2, 1]  # Element at dimension 1: 1, dimension 2: 2, dimension 3: 1


# ============================================================================
# 03-04: Dataframes: Tabular data structures, similar to spreadsheets
# ============================================================================
# most commonly used data structure in R for data analysis.

my_df <- data.frame(
  name = c("Alice", "Bob", "Charlie", NA_character_),
  age = c(25, 30, 28, NA_integer_),
  city = c("New York", "London", "Paris", NA_character_)
)

my_df # Print the data frame

# View the data frame
View(my_df)

# Accessing columns
my_df$name  # Access the "name" column
my_df[, 2]  # Access the second column ("age")





# ============================================================================
# 03-05: Factors: Factors are used to represent categorical data
# ============================================================================

# They are useful for grouping and analyzing data based on categories.

gender <- c("male", "female", "male", "female", "Other") # gender vector
gender
gender_factor <- factor(gender) # gender factors
gender_factor

# Accessing levels
levels(gender_factor)



# ============================================================================
# 04-00: Working with Data Structures --- Focus on vectors and data frames
# ============================================================================
# Indexing with []:
vec <- c(10, 20, 30, 40, 50)
vec[3]      # third element (30)
vec[c(1, 4)] # first and fourth elements (10, 40)
vec[2:4]    # the second to the fourth (20, 30, 40)


df <- data.frame(name = c("A", "B", "C"),
                 age = c(25, 30, 28))
df # Print
df$name     # Access the "name"
df[, 2]    # Access the second column, age
df[1, ]     # Access the first row

# Logical Indexing:
vec[vec > 30]        # greater than 30
df[df$age > 28, ]   # rows where age is greater than 28

# c)  subset() function:
subset(df, age > 28) # rows where age is greater than 28

# d) Modifying Data Structures
vec
vec[2] <- 25  # Modify the second element of the vector
vec

df
df$age[2] <- 35  # Modify the age of the second row
df

my_df_copy <- my_df

my_df_copy$age[4] <- 27.66667
my_df_copy

#======================================================
# RESOURCES: https://posit.co/resources/cheatsheets/
#====================================================
