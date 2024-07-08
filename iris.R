# models and formulas

# example y ~ x1 + x2

dataset <- iris 

head(dataset) #gives you the top
tail(dataset) #bottoom

dataset #only works for smaller

nrow(dataset) #number of rows
ncol(dataset) #does not count the line number

#linear model
petals.lm <- lm(formula = Petal.Length ~ Petal.Width, data = dataset)

petals.lm

summary(petals.lm) #get statistical data
  #r^2 value is the correlation, the higher the r2, the stronger correlation
  #p value: how significant the correlation (want a one smaller than 0.05)

# charts and graphs
names(iris)
hist(iris$Sepal.Length) #shows frequency
#increase the number of bins in our histogram to see distribution
hist(iris$Sepal.Length,breaks = 25)
#add some labels
hist(iris$Sepal.Length,breaks = 25, xlab = "Sepal Length", main = "Sepal Length Frequency")

plot(iris$Sepal.Length ~ iris$Sepal.Width, xlab = "Sepal Length", ylab = "Sepal Width")

library(lattice)
#lets use the lattice dot plot

dotplot(Sepal.Width ~ Sepal.Length | Species, data = iris)
dotplot(Petal.Length ~ Petal.Width | Species, data = dataset)