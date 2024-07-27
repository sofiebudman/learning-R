library(modeldata)
data(credit_data)
#usign predictors home and seniority for an outcome called status
vars <- c("Home", "Seniority")
str(credit_data[,c(vars,"Status")])

#splitting data
set.seed(2411) #TODO:look into this
in_train <- sample(1:nrow(credit_data), size = 3000) #also this
train_data <- credit_data[in_train,]
test_data <- credit_data[-in_train,]

#classification trees
library(C50)
tree_mod <- C5.0(x = train_data[, vars], y = train_data$Status)
tree_mod

summary(tree_mod) 
plot(tree_mod) #plots the decision tree

#boosting the tree, this model is similar to something called Adaboost
tree_boost <- C5.0(x=train_data[,vars], y = train_data$Status, trials = 3)
summary(tree_boost)

#rule based model

rule_mod <- C5.0(x = train_data[, vars], y = train_data$Status, rules = TRUE)
rule_mod

summary(rule_mod)

#predictions
predict(rule_mod, newdata = test_data[1:3,vars])
predict(tree_boost, newdata = test_data[1:3, vars], type = "prob")

#cost sensitive models
#used to emphasize certain classes over other
cost_mat <- matrix(c(0,2,1,0),nrow =2)
rownames(cost_mat) <- colnames(cost_mat) <-c("bad", "good")
cost_mat
cost_mod <- C5.0(x = train_data[, vars], y = train_data$Status, 
                 costs = cost_mat)
summary(cost_mod)

table(predict(cost_mod, test_data[, vars]))
table(predict(tree_mod, test_data[, vars]))
