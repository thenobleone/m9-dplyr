# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
greatest.avg.dep <- group_by(flights, month) %>% 
  summarise(avg = mean(dep_delay, na.rm = TRUE)) %>% 
  filter (avg == max(avg)) %>% 
  select (month)

# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
gad.df <- group_by(flights, month) %>% 
  summarise(gad.avg = mean(dep_delay, na.rm = TRUE)) %>% 
  plot()

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
greatest.airport.avg <- group_by(flights, dest) %>% 
  summarise(mean.delay = mean(arr_delay, na.rm = TRUE)) %>% 
  arrange(-mean.delay) %>% 
  filter(mean.delay == max(mean.delay, na.rm = TRUE)) %>% 
  select(dest)


### Bonus ###
# Which city was flown to with the highest average speed?
