#lists and data frames (common in bioinformatics packages)

HSPA1A <- list(gene = "HSPA1a", amino.acids = 641, nucleotides = 2400)
#a protein
print(HSPA1A) #when you print, the labels show

HSPA1A$amino.acids #jsut pull what is stored under amino acids
HSPA1A$nucleotides

#combiene 3 lists into a data frame
gene <- c("HSPA4", "HSPA5", "HSPA8", "HSPA9", "HSPA1A", "HSPA1B")
nucleotides <- c(54537,6491,4648,21646,2400,2517) #actually nucleotide lengths
aminoAcids <- c(840,654,493,679,641,641)

HSPs <-data.frame(gene,nucleotides, aminoAcids) #always fills in order, must correspond

HSPs #prints like a spreadsheet (like python pandas)

HSPs$gene #like lists you can pull certain stuff
HSPs$nucleotides

#lets search for a specific amino acid count
HSPs$aminoAcids[HSPs$gene == "HSPA8"]

#double click to view datafram like a spreadsheet
