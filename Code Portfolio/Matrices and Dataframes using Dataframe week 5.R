## Matrices and dataframes----

# 1. Cbind and  r bind Matrix ----
x <- 3:11
y <- 11:12
z<- 13:7

cbind(x, y , z) # Matrix where x,y z are columns
rbind(x,y,z) # Matrix where x,y z are rows

cbind(c(1, 2, 3, 4, 5),
      c("a", "b", "c", "d", "e")) ## Matrix with Character and numeric value 

matrix(data = 1:21, # Mtrix with 3 rows and 7 coumns  
       nrow = 3,
       ncol = 7)

#2. Matrix FUnctions: ----
  
head(Education) # Top few rows
tail(Education) # Last few rows
View(Education) # SHows whole dataset in new window
nrow(Education) # total number of rows
ncol(Education) # total number of columns
dim(Education) # total count of row and column
rownames(Education) # SHows row names
colnames(Education) # shows column names
names(Education) # show column names
summary(Education) # STatistical Summarization of dataset
str(Education) # STatistical information with more advacnce version

# Dataframe ----

#1. Columns ----
Education$Sex # Return Sex column from education dataset
Education$ARea <- c(9,4,5,6,8,9,3,5,7,9) # Add new column
names(Education)[6] <- "a"

#2 Slicing ----

#2.1 Slicing with [, ]

Education[1, ] # return one row witl all columns 
Education[,6 ] # return one columns witl all rows 
Education[1:3, c(1,3)] # return rows 1 to 3 and coumn only 1 and 3

#2.2 SLicing with SUbset

subset(x = Education,  ## Fetcing students data whose Age is less 10 abd School is DPS and GETOTAL greater than 10
       subset = Age < 10 &
         School_name == "DPS" &
         GEtotal >= 10)

Dummy <- subset(x = Education,
       subset = Age < 10 &
         School_name == "DPS" &
         GEtotal >= 10)

mean(Dummy$GEtotal)

# 2.3 with() ----

# There are two ways to calculate GEtotal scored by a male

max(Education$GEtotal[Education$Sex == "M"]) 

with(Education, max(GEtotal[Sex == "M"])) # with() function we don't need to write dataframe name multiple times



## Exercise Matrices and Dataframes using SChool_Score Database -----

Education <- data.frame(
  District_code = c(3,3,3,3,3,3,3,3,3,3),
  Sex = c("F", "F", "F", "M", "F", "F", "M", "F", "F", "F"),
  Age = c(7,8,9,10,6,9,10,8,7,4),
  School_name = c("DAV", "DPS", "Presidium", "national victor","DAV","DPS","Presidium","DPS", "Presidium", "national victor"),
  GEtotal = c(11, 15, 12, 50, 65, 30, 9, 13, 100, 90))


## 1. Combine the data into a single dataframe.-------
Education <- data.frame(
  District_code = c(3,3,3,3,3,3,3,3,3,3),
  Sex = c("F", "F", "F", "M", "F", "F", "M", "F", "F", "F"),
  Age = c(7,8,9,10,6,9,10,8,7,4),
  School_name = c("DAV", "DPS", "Presidium", "national victor","DAV","DPS","Presidium","DPS", "Presidium", "national victor"),
  GEtotal = c(11, 15, 12, 50, 65, 30, 9, 13, 100, 90),stringsAsFactors = FALSE)


## 2. Calculate median age------
median(Education$age)

## 3. What was the mean age of female and male ?------

mean(Education$age[Education$Sex == "F"])
mean(Education$age[Education$Sex == "M"])

## 4. GEtotal scored by a male ?-----

with(Education, max(GEtotal[Sex == "M"]))


# 7. Which SChool had the most number of GE total ?------

Education$School_name[Education$GEtotal == max(Education$GEtotal)]

## 6. What are the Age of the female pirates whose School_name is Presidium?-----

Education$Age[with(Education, Sex == "F" & School_name == "Presidium")]

## 7. What was the median  of GEtotal over the age of 7 for male students?-----
with(Education, (GEtotal[Age > 7 & Sex == "M"]))

## 8. Add a new column to the dataframe Good/Bad which shows Good whose score is more than 50 and bad whose score is less than 50.------

Education["Status"] <- NA
ifelse(Education$GEtotal<50,Education$Status <- "BAD", 
ifelse(Education$GEtotal==50,Education$Status <- "GOOD",
ifelse(Education$GEtotal>50,Education$Status <- "GOOD",NA)))





