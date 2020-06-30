#!/usr/bin/env Rscript
#
# hreyes June 2020
# obtain-human-genes.R
###################################################################
# create a granges object with the human genes
###################################################################
#
#################### import libraries and set options #############
library(annotables)
suppressMessages(library(dplyr))
#
#
###################### obtain gene symbols ########################
#my.biotypes = c("protein_coding", "miRNA")
my.biotypes = c("protein_coding")


# get protein coding genes for chromosomes 1 to 22 and X
grch38 %>%
  subset(., biotype %in% my.biotypes) %>%
  subset(., chr %in% c(1:22, "X")) -> grch38.genes

# remap chrX for compatibility with hicexp results
grch38.genes$chr[grch38.genes$chr == "X"] <- 23
grch38.genes$chr <- paste0("chr", grch38.genes$chr)

grch38.genes$strand <- ifelse(grch38.genes$strand == -1, "-", "+")

###################### convert to granges #########################
grch38.genes.gr <- makeGRangesFromDataFrame(grch38.genes,
                                              seqnames.field = "chr",
                                              start.field = "start",
                                              end.field = "end",
                                              strand.field = "strand",
                                              keep.extra.columns = TRUE)

#rm(my.biotypes, grch38.genes)
