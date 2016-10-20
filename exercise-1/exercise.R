# Exercise 1: Data Frame Practice

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
<<<<<<< Updated upstream
require(fueleconomy)
=======
<<<<<<< .merge_file_uWBRuy
library(fueleconomy)
>>>>>>> Stashed changes

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
<<<<<<< Updated upstream
cars.1997 <- vehicles[vehicles$year == 1997,]
=======
cars.1997 <- vehicles[vehicles$year==1997,]
=======
require(fueleconomy)

# You should have have access to the `vehicles` data.frame
View(vehicles)

# Create a data.frame of vehicles from 1997
cars.1997 <- vehicles[vehicles$year == 1997,]
>>>>>>> .merge_file_vk7syA
>>>>>>> Stashed changes

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(cars.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
<<<<<<< Updated upstream
wd2.mpg20 <- vehicles[(vehicles$drive == '2-Wheel Drive' & vehicles$cty > 20),]
=======
<<<<<<< .merge_file_uWBRuy
two.wheel.20.mpg <- vehicles[vehicles$drive == '2-Wheel Drive' & vehicles$cty > 20,]
>>>>>>> Stashed changes

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.hwy <- wd2.mpg20$id[min(wd2.mpg20$cty),]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MakeYearFilter <- function (make, year){
  filtered <- vehicles[vehicles$make == make & vehicles]
}
=======
wd2.mpg20 <- vehicles[(vehicles$drive == '2-Wheel Drive' & vehicles$cty > 20),]

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
worst.hwy <- wd2.mpg20$id[min(wd2.mpg20$cty),]

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MakeYearFilter <- function (make, year){
  filtered <- vehicles[vehicles$make == make & vehicles]
}

>>>>>>> .merge_file_vk7syA


# What was the most efficient honda model of 1995?


