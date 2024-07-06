gene <- c("HSPA4", "HSPA5", "HSPA8", "HSPA9", "HSPA1A", "HSPA1B")
nucleotides <- c(54537,6491,4648,21646,2400,2517) #actually nucleotide lengths
aminoAcids <- c(840,654,493,679,641,641)

HSPs <-data.frame(gene,nucleotides, aminoAcids) #always fills in order, must correspond

HSPs #prints like a spreadsheet (like python pandas)

HSPs$gene #like lists you can pull certain stuff
HSPs$nucleotides

#lets search for a specific amino acid count
HSPs$aminoAcids[HSPs$gene == "HSPA8"]


#object classes
print(gene)
print(HSPs)

class(HSPs$gene)
class(HSPs$nucleotides)
class(HSPs$aminoAcids)

x <- 15 + 38
x
class(x)

z<- as.character(c(1,2,3,4,5,6)) #force to be a character
z
class(z) #also see from the quotation marks

y <- as.character(c(9,8,8,7,6,5,4))
z+y #error because you cant add characters

z2 <- c(1,2,3,4,5,6)
y2 <- c(9,8,7,6,5,4)
z2+y2 # all numbers so it works


class(HSPs)

#convert
y <- as.numeric(y)
y
class(y)




