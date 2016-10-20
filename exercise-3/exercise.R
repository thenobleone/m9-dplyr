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
acura.chain <- filter(vehicles, make == 'Acura', year == 2015)
best.acura.chain <- select(filter (acura.chain, hwy == max(hwy)), model)


# Which Accura model has the best hwy MPG in 2015? (pipe operator)
best.acura.pipe <- filter(vehicles,make == 'Acura', year == 2015) %>% 
  filter(hwy == max(hwy)) %>% 
  select(model)

### Bonus ###

# Write 3 functions, one for each approach.  Then, 
# Test how long it takes to perform each one 1000 times
