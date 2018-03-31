install.packages("data.table")
library(data.table)
vegPlots = read.csv('/Users/bettyshen/Desktop/nvdimp_5plots.csv')
colnames(vegPlots) = c('plotNr', 'species')
#======try1=====#
vet1 = as.vector(vegPlots$plotNr)
vet2 = as.vector(vegPlots$species)
intersect(vet1,vet2)
Reduce(intersect,list(vet1,vet2))
I <- length(intersect(vegPlots$plotNr,vegPlots$species))
#======try2======#
myResp <- as.numeric(vegPlots[,1])
myResp
#======try3==success!====#

frame = dcast(setDT(vegPlots), species~plotNr, length) # convert to occurrence data with 0 and 1
                                                       #use "dcast" from data.table to reshape from 'long' to 'wide' format, specifying the fun.aggregate as length.
install.packages("clusteval")
library(clusteval)
cluster_similarity(vegPlots$plotNr=="4", vegPlots$plotNr=="5", similarity="jaccard", method="independence") #use cluster_similarity to calculate Jaccard index within different plot


