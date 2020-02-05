###################################################################
# hreyes december 2019
#
# genes-overlapping-hicexpdiff.R
#
# read in multihiccompare normalized data
# 
###################################################################
#setwd("~/Desktop/february20/get-diff-genes/")
#################### import libraries and set options ####################
#library(magrittr)
#library(dplyr)
library(multiHiCcompare)
#library(annotables)
#library(GenomicRanges)
#
options(scipen = 10)
#

# library(purrr)
# library(readr)
# library(data.table)
# library(edgeR)
# library(BiocParallel)
# library(HiCcompare)
# library(clusterProfiler)
# library(DOSE)
# library(ROntoTools)
# library(graph)

########################## read in data ###################################
# YOU GONNA HAVE TO DO THIS AGAIN AND PROPERLY USE saveRDS AND SO AND SO
#infile_path <- "data-hicexp-cyclicloess-glm//NC_cycnorm_glm.Rdata"

# read in a normalized and compared hiccompare hicexp dataset
norm_diff_hicexp <- readRDS(infile_path)



# read in a grch38 gene data set (in granges format)



#################### select significant differences ######################

# use a cutoff to select significant differences
# convert significant differences to granges format


####### perform overlap between genes and significant differences #########


# maybe I need to inherit information from the interaction diffences (e.g. how significant?)
# in order to "rate" genes??? 




