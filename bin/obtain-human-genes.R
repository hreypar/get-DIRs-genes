###################################################################
# hreyes february 2020
#
# obtain-human-genes.R
#
# create a granges object with the human genes
# 
###################################################################
#setwd("~/Desktop/february20/get-diff-genes/")
#################### import libraries and set options ####################
library(annotables)
library(magrittr)
library(dplyr)
#
#
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