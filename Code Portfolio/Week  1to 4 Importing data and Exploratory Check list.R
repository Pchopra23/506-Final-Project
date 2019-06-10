### Importing data----

#reparing workspace ---
rm(list=ls())

#Set Working directory  ----
setwd(dir = "Directory path")

### Install Packages ----
install.packages("package name")
library("Package name")

#Read TXT files----
read.table("file name")

read.delim("File name.txt", sep="$") # when there is separator charcter used in our data

#Read in csv files ----
library(readr)
read.table("File name.csv",header = FALSE,sep = ",")
read.csv("File name.csv ",header = FALSE)

read.csv2("File name.csv", header= FALSE) #reads semicolon separated files 

#SKipping data from file while loading data ----

read_csv("filename.csv", skip = n)          # skips first n rows in the file
read_csv("filename.csv", comment = "#")     # skips all rows that start with '#"
read_csv("filename.csv", col_names = FALSE) # For the file does not have header 
read_csv("filename.csv", col_names = c("A", "B", "C",...))  # Adds columns names as "C", "B" "C" etc.
read_csv("filename.csv", na = ".")          #Specified "NA" to the missing values in the dataset

#Read data frpm XL file ----
library(readxl)
read_excel("filename")
readWorksheetFromFile("file name>",sheet = 1) # Read particular workshit from file

#Export Data -------

# Comma delimited file
write_csv(df, path, na = "NA") #append = FALSE, col_names = !append options in all to append new data to existing file
#delim defaults to " " for write_delim(), "," for write_excel_csv() and ";" for write_excel_csv2()

# File with arbitrary delimiter
write_delim(df, path, delim = " ", na = "NA")

# CSV for excel
write_excel_csv(df, path, na = "NA")

# String to file
write_file(df, path, append = FALSE)

# String vector to file, one element per line
write_lines(df,path, na = "NA", append = FALSE) #does not have col_names = !append option

# Object to RDS file
write_rds(df, path, compress = c("none", "gz","bz2", "xz"), ...)

# Tab delimited files
write_tsv(df, path, na = "NA", append = FALSE, col_names = !append)

#Vector ----

c(2, 3, 5)                          # Numeric 
c(TRUE, FALSE, TRUE, FALSE, FALSE)  # Logical Values
c("aa", "bb", "cc", "dd", "ee")     # Character values
length(c("aa", "bb", "cc", "dd"))   #number of members in a vector 


#Matrix ----
A = matrix( c(2, 4, 3, 1, 5, 7), # the data elements 
  nrow=2,              # number of rows 
  ncol=3,              # number of columns 
  byrow = TRUE)        # fill matrix by rows 

A                      # print the matrix 

#List ----

n = c(1, 7, 3) 
m = c("aa", "bb", "cc", "dd") 
b = c(TRUE, FALSE, TRUE, FALSE) 
a= list(n,m,b) 

a   # Print

# Exploring Data in data frame----

nrow(DF_name)  # Number of rows
ncol(mtcars)  # Number of col
head(DF_name) # Look for the first few rows
name(df_name) # Display column name
view(Df_name) # Display entire dataset 
str(Df_name)
summary(Df_name)
DF_name[1, 2]  # Dispaly 1 and 2 columns 


# Discriptive  Data ----
mean(df_name$colum_name) #AVerage 
max(df_name$colum_name) #Maximum among
unique(df_name$colum_name) # Checking unique values
quantile(df_name$colum_name, seq(0, 1, 0.1))

# Parsing Vector ----

str(parse_logical(c("TRUE", "FALSE", "NA")))   # Parse in logicals
str(parse_integer(c("1", "2", "3")))    # Parse in integers
str(parse_date(c("2010-01-01", "1979-10-14")))  #Parse in date format
parse_integer(c("1", "231", ".", "456"), na = ".") # Parse in integer with "NA" for missing values, 
#If parsing fails, you'll get a warning message 

parse_double() # Strict numeric parser
parse_number() # Flexible numeric parser
parse_character() # seems so simple that it shouldn't be necessary
parse_factor()  #create factors, the data structure that R uses to represent categorical variables with fixed and known values.
parse_datetime() # and parse_date(), and parse_time()  allow parse various date & time specifications


#Parse Numbers----
parse_double("1.23")  # For normal case where '.' is used for decimal point
parse_double("1,23", locale = locale(decimal_mark = ","))   #if',' is used for decimal point
parse_number() # It ignores non-numeric characters before and after the number
# for example parse_number("$100") spits [1] 100 and parse_number("It cost $123.45") spits [1] 123
parse_number("$123,456,789")  # Used in United Stats which ignores group separater ',' between the numbers
#> The out put is [1] 1.23e+08
parse_number("123.456.789", locale = locale(grouping_mark = "."))  # Used in many parts of Europe #> [1] 1.23e+08
parse_number("123'456'789", locale = locale(grouping_mark = "'")) # Used in Switzerland #> [1] 1.23e+08

#Parse Strings ----
charToRaw("Hadley") # ASCII encoding- The mapping from hexadecimal number to character

#Output  > [1] 48 61 64 6c 65 79; Each hexadecimal number represents a byte of information: 48 is H, 61 is a, and so on.

# parse Character----
parse_character(x1, locale = locale(encoding = "Latin1"))

parse_character(x2, locale = locale(encoding = "Shift-JIS"))

#  Parse Factors ----
fruit <- c("apple", "banana")
parse_factor(c("apple", "banana", "bananana"), levels = fruit)


#  Parse Dates, date-times, and times ---
parse_datetime("2012-08-15T0545") #Date time format 
# Output [1] "2012-08-15 05:45:00 UTC"
# If time is omitted, it will be set to midnight
parse_date("2010-10-01")
#> outout [1] "2010-10-01"


