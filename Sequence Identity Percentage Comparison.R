#This code will compare two sequences and return a percentage identity. The intended use of this code is to check whether sequences from the same template are the same. 
#Install the necessary packages
install.packages("BiocManager")
BiocManager::install("Biostrings")
library(Biostrings)
library(tidyverse)
BiocManager::install("pwalign")

#Set working directory (but this doesn't need to be used unless you're pulling from files)
#setwd("/Users/alyssaplayer/Desktop")
#sequences <- read.csv("seq.csv", check.names = F)
#head(sequences)

#Copy and paste samples here, if you want to change to AA string, you can replace DNAString with AAString
s1 <- DNAString("CGGGGAGGCCTGGTAACGCCTGGAGGAACTTTGACACTCACCTGCACAGCCTCTGGATTCTCCCTCAATAAGTATCTAATGGGCTGGGTCCGCCAGGCTCCAGGGAAGGGACTGGAGTGTATCGGATACATGGATATTGATCGTACCACATTCTACGCGAATTGGGCGAAAGGCCGATTCACCATCTCCAAAACCTCGACCACGGTGGATCTGAAAATGACCAGTCTGACAACCGAGGACACGGCCACCTATTTCTGTGCCAGAGATGTCGGTGGCGCTGCTTATGGTTATGCCTTTCAGATTTGGGGCCCAGGCACCCTGGTCACCGTCTCCTCAGGGCAACCTAAGGCTCCATCAGTC")
s2 <- DNAString("GAGCAGCTGGTGGAGTCTGGAGGGGGTCTGGTCACGCTTGGGGGATCCCTGAAACTCTCCTGCAAAGCCTCTGGAATCGACTTCAGTAGCTATGGCATTAGCTGGGTCCGCCAGGCTCCAGGGAAGGGGCTGGAGTGGATCGGATGCATTTATCCTGATTATACTAGGACAGACTACGCGAGCTGGGTGAATGGCCGATTCACCATCTCCCTCGACAACGCCCAGAACACGGTGTTTCTGCAAATGACCAGTCTGACAGCCGCGGACACGGCCACCTATTTCTGTGCAAGAGTCGATAGTAGTGGCTGGGGCCTCACTCGGTTGGATCTCTGGGGCCAGGGCACCCTGGTCACCGTCTCCTCA")

# Perform pairwise alignment with default scoring
palign1 <- pairwiseAlignment(s1, s2)
pid(palign1)

# Perform pairwise alignment with a more reasonable substitution matrix
palign2 <- pairwiseAlignment(
  s1, s2,
  substitutionMatrix = nucleotideSubstitutionMatrix(match = 3, mismatch = -1, baseOnly = TRUE)
)
#prints out the percentage similarlity 
pid(palign2, type = "PID4")


