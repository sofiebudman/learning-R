library(ggplot2)
library(cowplot)
library(randomForest)

url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"

data <- read.csv(url, header=FALSE)

head(data)

#rename columns based on the UCI website

colnames(data) <- c(
  "age",
  "sex",# 0 = female, 1 = male
  "cp", # chest pain 
  # 1 = typical angina, 
  # 2 = atypical angina, 
  # 3 = non-anginal pain, 
  # 4 = asymptomatic
  "trestbps", # resting blood pressure (in mm Hg)
  "chol", # serum cholestoral in mg/dl
  "fbs",  # fasting blood sugar if less than 120 mg/dl, 1 = TRUE, 0 = FALSE
  "restecg", # resting electrocardiographic results
  # 1 = normal
  # 2 = having ST-T wave abnormality
  # 3 = showing probable or definite left ventricular hypertrophy
  "thalach", # maximum heart rate achieved
  "exang",   # exercise induced angina, 1 = yes, 0 = no
  "oldpeak", # ST depression induced by exercise relative to rest
  "slope", # the slope of the peak exercise ST segment 
  # 1 = upsloping 
  # 2 = flat 
  # 3 = downsloping 
  "ca", # number of major vessels (0-3) colored by fluoroscopy
  "thal", # this is short of thalium heart scan
  # 3 = normal (no cold spots)
  # 6 = fixed defect (cold spots during rest and exercise)
  # 7 = reversible defect (when cold spots only appear during exercise)
  "hd" # (the predicted attribute) - diagnosis of heart disease 
  # 0 if less than or equal to 50% diameter narrowing
  # 1 if greater than 50% diameter narrowing
)
head(data)
str(data)

#cleaning up
data[data == "?"] <- NA
data[data$sex == 0,]$sex <- "F"
data[data$sex == 1,]$sex <- "M"
#conert other columns into factors
data$sex <- as.factor(data$sex)
data$cp <- as.factor(data$cp)
data$fbs <- as.factor(data$fbs)
data$restecg <- as.factor(data$restecg)
data$exang <- as.factor(data$exang)
data$slope <- as.factor(data$slope)

data$ca <- as.integer(data$ca)
data$ca <- as.factor(data$ca)

data$thal <- as.integer(data$thal)
data$thal <- as.factor(data$thal)

data$hd <- ifelse(test = data$hd ==0, yes = "Healthy", no = "Unhealthy")
data$hd <- as.factor(data$hd)

str(data)

#seed for random number generatrir
set.seed(42)
data.imputed <- rfImpute(hd ~ ., data = data, iter=6)
#we want hd column to be predicted, we are using the data datset, create 6 random forests
#4-6 iterations is usually enough
#save the results as data.imputed
#prints out the OOB

#built model
model <- randomForest(hd ~ ., data = data.imputed, proximity = TRUE)
#want random forest to return a proximity matrix, use this later for clustering

model # see how well it performed
#OOB is the error estimate percenate
#it also prints out a confusion matrix (like two way table in math)


#plotting error rates
oob.error.data <- data.frame(
  Trees=rep(1:nrow(model$err.rate), times=3),
  Type=rep(c("OOB", "Healthy", "Unhealthy"), each=nrow(model$err.rate)),
  Error=c(model$err.rate[,"OOB"], 
          model$err.rate[,"Healthy"], 
          model$err.rate[,"Unhealthy"]))

ggplot(data=oob.error.data, aes(x=Trees, y=Error)) +
  geom_line(aes(color=Type))

#test error rate iwth more trees
model1 <- randomForest(hd ~ ., data = data.imputed, ntree = 1000, proximity = TRUE)
#error rate is worse, stabilizes right after 500

#consier optimal number of variables at each node









