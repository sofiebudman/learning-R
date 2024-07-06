#data structures
months <- array(c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), dim=c(3,4))
#multidimensional matrix

months

#simple collection function
months1<-c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
months1
months[2,3] #down 2 over 3

#look at a matrix

months2 <- matrix(data = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"), nrow = 3, ncol = 4)
months2
#with arrays you can have 3d datasets

#making a 3d array
array3d <- array(c(2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36), dim = c(3,3,2))
array3d
array3d[1,3,2] #rowm column, layer

# pull and an entire row or column for a 3d array
array3d[2, ,1]#row 2 all columns, layer 1
array3d[2, , ] #gets both layers results
