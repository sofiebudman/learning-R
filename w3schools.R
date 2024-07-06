name <- "John"
age <- 40
print(name)
age

for (x in 1:10){
  print(x)
}

#concatenate elements
text <- "awesome"
paste("R is", text)

text1 <- "R is"
text2 <- "awesome"
paste(text1,text2)

#mathmatical operations
num1 <-5
num2 <- 10
num1 + num2

#cannot + string and a number
#does not work num+text

#multiple variables
var1 <- var2 <- var3 <- "Orange"
var1
var2
var3

#datatypes
  #numeric: any number
  #integer: 1L, 55L, L declares it as an integer
  #complex: 9 +3i, imaginary part "i"
  #character (string) in " "
  #logical (boolean) - TRUE or FALSE
#use class() function to check the data type of a variable

#numeric
x <- 10.5
class(x)

#R numbers
  #3 main types are numeric, integer, complex
num <- 10.5 #numeric
int <- 10L #integer
com <- 1i # complext

#type conversion
  # convert with the folllwoing function
  #as.numeric()
  #as.integer()
  #as.complex()
int1 <- 1L
num1 <- 2

a <- as.numeric(int1)
b <- as.integer(num1)
int1
num1
class(a)
class(b)

# R Math
# operators for commmon mathematical operations
10 + 5

#built in math function
max(5,10,15)
min(5,10,15)
sqrt(16)
abs(-4.7)
ceiling(1.4)
floor(1.4)

#R Strings - single or double quotation
str <- "hello"
str

#/n is escape character
#do cat() for linebreaks to be the same as the code

#string length
str1 <- "Hello World!"
nchar(str1)

#check a string
grepl("H", str1)
grepl("Hello", str1)
