###################################################################
# hreyes december 2019
#
# genes-overlapping-hicexpdiff.R
#
# read in multihiccompare normalized data
# 
###################################################################
#setwd("~/Desktop/february20/get-diff-genes/")
############### import libraries and set options ##################
#library(magrittr)
#library(dplyr)
library(multiHiCcompare)
#library(annotables)
library(GenomicRanges)
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

#################### read in data ##################################
# YOU GONNA HAVE TO DO THIS AGAIN AND PROPERLY USE saveRDS AND SO AND SO
#infile_path <- "data-hicexp-cyclicloess-glm//NC_cycnorm_glm.Rdata"

# read in a normalized and compared hiccompare hicexp dataset
norm_diff_hicexp <- readRDS(infile_path)


# why do I want to convert to Granges? 
# WHAT IS THE OUTPUT HERE? A TEXT FILE AND AN RDS FILE. 
toGranges <- function(sig_regions) {
  makeGRangesFromDataFrame(sig_regions,
                           seqnames.field = "chr",
                           start.field = "start", 
                           end.field = "end", 
                           keep.extra.columns = TRUE)
}


# get significant pairs list  
# covert to GenomicInteractions object

# get human genes grch38 granges object (the other code in bin)
# get human transcription factors

# overlap features with GenomicInteractions object

# export and/or visualize this (different module?)  



######## THESE ARE ADDITIONALS YOU CAN SUPPLEMENT
# get human promoters (?) these are sensitive to condition
# get MCF10 cell lines TADs
########






























