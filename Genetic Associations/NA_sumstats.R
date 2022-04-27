require(GenomicSEM)

prop <- c(NA, NA, NA, NA)

se.logit <- c(T,F,F,F)

files <- list("MDD_MVP_PGC_UKB_eur_all.1.txt", "SWB_Full.txt", "sumstats_neuroticism_ctg_format.txt", "dbGAP_GAD2eur.txt")

ref <- "reference.1000G.maf.0.005.txt"

OLS <- c(F,T,T,T)



GSEM_negaff_sumstats_v2 <- sumstats(files=files,ref=ref,trait.names=c("mdd_meta", "swb", "neuroticism", "gad"),se.logit=se.logit,OLS = OLS,linprob=NULL,prop=prop, info.filter=.6, maf.filter=0.01,keep.indel=FALSE,parallel=FALSE,cores=NULL)

save(GSEM_negaff_sumstats_v2, file="GSEM_negaff_sumstats_v2.RData")


