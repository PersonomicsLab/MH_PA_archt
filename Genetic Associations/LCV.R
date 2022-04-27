library(data.table)

traits <- c("moderate", "overall_activity", "sedentary", "sleep_duration", "walking")

for (k in traits) {
#Start with data munged using the ldsc package
print("loading sumstats files")
trait1File="~/negaff.sumstats.gz"

trait2File=paste("~/",k,sep = "",".sumstats.gz")

#Load trait 1 data and calculate Zs
print("calculating Zs")
d1 = na.omit(read.table(gzfile(trait1File),header=TRUE,sep="\t",stringsAsFactors = FALSE))

#Load trait 2 data and calculate Zs
d2 = na.omit(read.table(gzfile(trait2File),header=TRUE,sep="\t",stringsAsFactors = FALSE))

#Load LD scores
print("loading LD scores")
ldscoresFile="~/eur_w_ld_chr/all.12.ldscore.txt.gz"
d3=read.table(ldscoresFile,header=TRUE,sep="\t",stringsAsFactors=FALSE)

#Merge
print("merging files")
m = merge(d3,d1,by="SNP")
data = merge(m,d2,by="SNP")

#Sort by position
data = data[order(data[,"CHR"],data[,"BP"]),]

### remove MHC region
data <- data[!(data$CHR == 6 & data$BP < 33054976 & data$BP > 29691116 ),]

#Flip sign of one z-score if opposite alleles-shouldn't occur with UKB data
#If not using munged data, will have to check that alleles match-not just whether they're opposite A1/A2
print("flipping Z-score signs")
mismatch = which(data$A1.x!=data$A1.y,arr.ind=TRUE)
data[mismatch,]$Z.y = data[mismatch,]$Z.y*-1
data[mismatch,]$A1.y = data[mismatch,]$A1.x
data[mismatch,]$A2.y = data[mismatch,]$A2.x

#Run LCV-need to setwd to directory containing LCV package
print("running LCV")
setwd("/home/[username]/LCV/R/")
source("/home/[username]/LCV/R/RunLCV.R")

LCV = RunLCV(data$L2,data$Z.x,data$Z.y)

tester <- as.data.frame(LCV)

sink(paste("~/",k,sep = "_","LCV.txt"))
print(tester)
sink()
}

