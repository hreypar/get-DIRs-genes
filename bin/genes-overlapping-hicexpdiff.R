###################################################################
# hreyes december 2019
#
# genes-overlapping-hicexpdiff.R
#
# read in multihiccompare normalized data
# 
###################################################################
#setwd("/home/hreyes/Desktop/february20/genes-analysis-40kb/")

#################### import libraries and set options ####################
library(magrittr)
library(dplyr)
library(multiHiCcompare)
library(annotables)
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

####################obtain GRch38 gene symbols ###########################
# THIS SHOULD BE A DIFFERENT SCRIPT IN BIN
#
# get protein coding genes for chr 1 to 22 and X
# FIGURE OUT IF I ACTUALLY ONLY WANT PROTEIN CODING GENES... 
# I MIGHT BE INTERESTED IN ncRNAs AND/OR PSEUDOGENES
#
grch38 %>%
  subset(., biotype == "protein_coding") %>%
  subset(., chr %in% c(1:22, "X")) -> grch38_symbols

# transform X chr to make it compatible with hicexp format
grch38_symbols$chr[grch38_symbols$chr == "X"] <- 23
grch38_symbols$chr <- paste0("chr", grch38_symbols$chr)

grch38_symbols$strand <- ifelse(grch38_symbols$strand == -1, "-", "+")

# all genes granges
grch38_symbols.gr <- makeGRangesFromDataFrame(grch38_symbols,
                                              seqnames.field = "chr",
                                              start.field = "start",
                                              end.field = "end",
                                              strand.field = "strand",
                                              keep.extra.columns = TRUE)

########################## read in data ###################################
# load("data_hicexp_objects_cyclic_loess_glm/NC_cycnorm_glm.Rdata")

# read in a normalized and compared hiccompare hicexp dataset
# read in a grch38 gene data set (in granges format)



#################### select significant differences ######################

# use a cutoff to select significant differences
# convert significant differences to granges format


####### perform overlap between genes and significant differences #########


# maybe I need to inherit information from the interaction diffences (e.g. how significant?)
# in order to "rate" genes??? 




