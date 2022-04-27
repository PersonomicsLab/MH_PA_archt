require(GenomicSEM)
munge_UKB_negaff <- munge(c("negaff_factor_v1_GWAS_headers.txt"), hm3 = "w_hm3.snplist",trait.names=c("negaff"), N=571170, info.filter = 0.9, maf.filter = 0.01)

save(munge_UKB_negaff, file = "munge_UKB_negaff.Rdata")

