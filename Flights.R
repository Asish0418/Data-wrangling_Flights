install.packages("tidyverse")
install.packages("nycflights")
library("tidyverse")
install.packages("nycflights13")
library("nycflights13")
library("dplyr")

#Use of filter commands!
#1. Had an arrival delay of two or more hours
#2. Flew to Houston (IAH or HOU)
#3. Were operated by United, American, or Delta
#4. Departed in summer (July, August, and September)
#5. Departed between midnight and 6am (inclusive)
#6. Were delayed by at least an hour, but made up over 30 minutes in flight

filter(flights, arr_delay >= 120)

filter(flights, dest %in% c("HOU", "IAH"))

filter(flights, carrier %in% c("AA", "DL", "UA"))

filter(flights, month %in% c(7, 8, 9))

filter(flights, dep_time <= 600 | dep_time == 2400)

#As here inclusive is mentioned we have to include both midnight and 6 am case.
filter(flights, dep_delay >= 60, dep_delay - arr_delay > 30)

#Use of arrange commands!
#1. Sort flights to find the most delayed flights.
#2. Find the flights that left earliest.
#3. Sort flights to find the fastest flights.

arrange(flights, desc(dep_delay))
#We saw that the value 1301 minutes is the maximum delay for any flight, so the flights with dep_ delay value greater than 1000 can be considered as the most delayed flights.
filter(flights, dep_delay >= 1000)

arrange(flights, dep_time)
#We saw the value 1 hr is the minimum value for dep_time, so we can use this value for comparing the flights which will leave the earliest.
filter(flights, dep_delay <= 1)


arrange(flights, air_time)
#we saw that the value 20 minutes is the minimum value for the air_time column, so we can take 50 as a comparative value for the flights having the least air time.
filter(flights, air_time <= 50)

#We could have set the values for comparision differently as per our need to extract values or could’ve only sorted to see the order of the parameter as per our need.

#Use of select command!
#Select dep_time, dep_delay, arr_time, and arr_delay from flights using helper functions such as starts_withetc.

select(flights, starts_with('dep'), starts_with('arr'))

select(flights, ends_with("delay"), ends_with("time"))

select(flights, contains("_"))

select(flights, matches("_"))

#Use of mutate command!
#create a new variable using mutate - total_delay that is the sum of arr_delay and dep_delay

mutate(flights, total_delay = arr_delay + dep_delay)

#Use of summarise command!
#Find the average arrival delay (arr_delay) for each carrier

#To remove the NA values from the arr_delay column, we have to use filter function.
y <- filter(flights, !is.na(arr_delay))
y
#As it's mentioned here to take the average arr_delay for each carrier, we have to use group_by function and then have to summarise it.
x <- group_by(y, carrier)
summarise(x, average = mean(arr_delay))



