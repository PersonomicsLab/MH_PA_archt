require(GenomicSEM)
library(data.table)

load("GSEM_negaff_sumstats_v2.RData")
load("LDSCoutput_UKB_negative2.RData")

negaff_factor <- commonfactorGWAS(covstruc = LDSCoutput_UKB_negative2, SNPs = GSEM_negaff_sumstats_v2)
save(negaff_factor, file = "negaff_factor_v1_GWAS.RData")
write.table(negaff_factor, file="negaff_factor_v1_GWAS.txt", row.names=FALSE, quote=FALSE)

