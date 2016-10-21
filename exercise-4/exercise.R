# Exercise 4: DPLYR and flights data

# Install the nycflights13 package and read it in.  Require the dplyr package
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# The data.frame flights should now be accessible to you.  View it, 
# and get some basic information about the number of rows/columns
View(flights)
colnames(flights)
dim(flights)

# Add a column that is the amount of time gained in the air (`arr_delay` - `dep_delay`)
flights <- mutate (flights, gained.time = arr_delay - dep_delay)

# Sort your data.frame desceding by the column you just created
flights <- arrange(flights, -gained.time)

# Try doing the last 2 steps in a single operation using the pipe operator
flights <- mutate(flights, gained.time = arr_delay - dep_delay) %>% arrange(-gained.time)

# Make a histogram of the amount of gain using the `hist` command
gt.hist <- hist(flights$gained.time,
                xlab = "Time Gained")

# On average, did flights gain or lose time?
mean(flights$gained.time, na.rm = TRUE)

# Create a data.frame that is of flights headed to seatac ('SEA'), 
seatac <- filter (flights, dest == 'SEA') 

# On average, did flights to seatac gain or loose time?
seatac.avg <- hist (seatac$gained.time,
                    xlab = "Time Gained")

mean(seatac$gained.time, na.rm = TRUE)

### Bonus ###
# Write a function that allows you to specify an origin, a destination, and a column of interest
# that returns a data.frame of flights from the origin to the destination and only the column of interest
## Hint: see slides on standard evaluation
FlightInfo <- function (start, end, interest){
  details <- flights %>% 
    filter(start == origin) %>% 
    filter(end == dest) %>% 
    select(origin, dest, get(interest))
}

# Retireve the air_time column for flights from JFK to SEA
NYtoSea.airtime <- FlightInfo('JFK', 'SEA', 'air_time')

# What was the average air time of those flights (in hours)?
mean(NYtoSea.airtime$air_time, na.rm = TRUE) / 60

# What was the min/max average air time for the JFK to SEA flights?
min(NYtoSea.airtime$air_time, na.rm = TRUE) / 60
max(NYtoSea.airtime$air_time, na.rm = TRUE) / 60
