file_path <- "inst/extdata/cpi.txt"

bls_cpi <- read.table(file_path, header = TRUE, sep = "\t",
                   stringsAsFactors = FALSE)

save(bls_cpi, file = "data/bls_cpi.RData")
