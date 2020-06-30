#!/usr/bin/env Rscript
#
# hreyes June 2020
# get-DIRs-genes.R
###################################################################
# Overlap human genome features with Differentially Interacting
# Regions (obtained by using multiHiCCompare). 
###################################################################
#
############### import libraries and set options ##################
suppressMessages(library(GenomicRanges))
#
# input options
args = commandArgs(trailingOnly=TRUE)
#
####################################################################
########################## functions ###############################
# it's dangerous to go alone! take this.
#
####################### Add DIR index column #######################
add_DIR_index <- function(interactions) {
  # create index column
  interactions$DIR <- paste0("DIR_", rownames(interactions))
  return(interactions)
}
#
#################### create GRanges objects ########################
convert_to_granges <- function(pairs) {
  # select the columns and create GRanges object for each region in the pair
  pair1 <- makeGRangesFromDataFrame(pairs[,c("chr1", "start1", "end1", "DIR")],  
                           seqnames.field = "chr1", 
                           start.field = "start1",  
                           end.field = "end1", 
                           keep.extra.columns = TRUE)
  
  pair2 <- makeGRangesFromDataFrame(pairs[,c("chr2", "start2", "end2", "DIR")],  
                           seqnames.field = "chr2", 
                           start.field = "start2",  
                           end.field = "end2", 
                           keep.extra.columns = TRUE)
  
  pairs.gr <- list(pair1, pair2)
  names(pairs.gr) <- c("pair1", "pair2")
  
  return(pairs.gr)
}
#
########################## MAIN CODE ###############################
########################## read in data ############################
dirs.list <- readRDS(args[1])
#
############# Add index to keep track of interactions ##############
dirs.list <- lapply(dirs.list, add_DIR_index)
#
################ get two GRanges from each df ######################
dirs.list.gr <- lapply(dirs.list, convert_to_granges)


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
