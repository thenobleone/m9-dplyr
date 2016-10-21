# Exercise 3: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

library(dplyr)
# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)

# You should have have access to the vehicles data.frame
View(vehicles)

# Which Accura model has the best hwy MPG in 2015? (without method chaining)
acuras <- filter(vehicles, make == 'Acura')
acruas.2015 <- filter (acuras, year == 2015)
best.acura.info <- filter(acruas.2015, hwy == max(hwy))
best.acura.model <- select(best.acura.info, model)

# Which Accura model has the best hwy MPG in 2015? (nesting functions)
best.acura.chain <- select(
  filter(
    filter(vehicles, make == 'Acura', year == 2015), hwy == max(hwy)
  ), model
)

# Which Accura model has the best hwy MPG in 2015? (pipe operator)
best.acura.pipe <- filter(vehicles,make == 'Acura', year == 2015) %>% 
  filter(hwy == max(hwy)) %>% 
  select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times

#Test: Best BMW, AVG MPG, 2010

#Without Chaining
BestBMW.WC <- function (){
  bmws.wc <- vehicles[vehicles$make == 'BMW' & vehicles$year == 2010,]
  bmws.wc$avg.mpg <- rowMeans(subset(bmws.wc, select = c(cty, hwy)), na.rm = TRUE)
  best.bmw.wc <- bmws.wc$model[which.max(bmws.wc$avg.mpg)]
  return (best.bmw.wc)
}

#Nesting
BestBMW.N <- function (){
  best.bmw.nest <- select (
    filter(
      mutate(
        filter(vehicles, make == 'BMW' & year == 2010), avg.mpg = (hwy + cty)/2
      ), avg.mpg == max(avg.mpg)
    ), model
  )
  return (best.bmw.nest)
}

#Pipes
BestBMW.P <- function (){
  best.bmw.pipe <- filter(vehicles, make == 'BMW' & year == 2010) %>% 
    mutate(avg.mpg = (hwy + cty)/2) %>% 
    filter(avg.mpg == max(avg.mpg)) %>% 
    select (model)
  return (best.bmw.pipe)
}


#RunTime
system.time(for (i in 1:1000) BestBMW.WC())
system.time(for (i in 1:1000) BestBMW.N())
system.time(for (i in 1:1000) BestBMW.P())
