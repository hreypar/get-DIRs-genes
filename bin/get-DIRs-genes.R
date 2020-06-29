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
#library(magrittr)
#library(dplyr)
#library(multiHiCcompare)
#library(annotables)
#library(GenomicRanges)
#
#options(scipen = 10)
#
suppressMessages(library(GenomicInteractions))
#
# input options
args = commandArgs(trailingOnly=TRUE)
########################## functions ###################################
# it's dangerous to go alone! take this.
#
####################### test empty function. ###########################
test <- function() {
  
}
#
#################### read in data ##################################
sigpairs.list <- readRDS(args[1])

test <- sigpairs.list[[1]]


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


