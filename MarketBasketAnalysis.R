install.packages("arules")
library(arules)

groceries <- read.transactions("groceries.csv", sep = ",")
summary(groceries)
inspect(groceries[1:5])
itemFrequency(groceries[, 1:3])
itemFrequencyPlot(groceries, support = 0.1)
itemFrequencyPlot(groceries, topN = 20)
image(sample(groceries, 100))

# Association rule applied

groceryrules <- apriori(groceries, parameter = list(support =
                                                      0.006, confidence = 0.25, minlen = 2))
groceryrules
inspect(groceryrules[1:463])
 #taking best 5 rules

inspect(sort(groceryrules, by = "lift")[1:5])

#finding how famous is an item before marketing that item
berryrules <- subset(groceryrules, items %in% "berries")
berryrules
inspect(berryrules)


#examining baby product
babyrules <- subset(groceryrules, items %in% "cat food")
babyrules
inspect(babyrules)
#this is an interesting fact