
#simple operations
##this is how R does addition
12+6
##sybtractin
12-6

##this is how we store data as variables. Store days of the week
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

#lets find the 5th entry in our stored collection
days[5]

#range
days[1:3]

#end of week
days[5:7]

#lets pull out specific days
days[c(1,3,5,7)]

# subset our days and crete weekdays
weekdays <- days[1:5]
print(weekdays)
