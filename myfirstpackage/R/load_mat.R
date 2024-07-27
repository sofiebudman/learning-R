#' @export
load_mat <- function(infile){
  in.dt <- data.table::fread(infile, header = TRUE)
  in.dt <- in.dt[!duplicated(in.dt[, 1]), ]
  in.mat <- as.matrix(in.dt[, -1, with = FALSE])
  rownames(in.mat) <- unlist(in.dt[, 1, with = FALSE])
  in.mat
}
#takes in a file and convert it into a matrix with the proper column and row names based on the format of the in file
#put similar fuctions togehter
#@export makes the function avaible to other files, its a roxygen tag
#dont use library in R packages, instead use a double colon
