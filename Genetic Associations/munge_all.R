require(GenomicSEM)
munge_UKB <- munge(c("Doherty_moderate.txt", "Doherty_moderate_sexBMI.txt","Doherty_overall_activity.txt", "Doherty_overall_activity_sexBMI.txt", "Doherty_sedentary.txt", "Doherty_sedentary_sexBMI.txt", "Doherty_sleep_duration.txt", "Doherty_sleep_duration_sexBMI.txt", "Doherty_walking3.txt", "Doherty_walking_sexBMI.txt", "RISK_GWAS_MA_UKB+replication.txt", "MDD_MVP_PGC_UKB_eur_all.1.txt", "SWB_Full.txt", "sumstats_neuroticism_ctg_format.txt", "dbGAP_GAD2eur.txt"), hm3 = "w_hm3.snplist",trait.names=c("moderate", "moderate_sexBMI", "overall_activity", "overall_activity_sexBMI", "sedentary", "sedentary_sexBMI", "sleep_duration", "sleep_duration_sexBMI", "walking", "walking_sexBMI", "risk2", "mdd_meta", "SWB","Neuroticism", "gad"), N=c(91105, 91105, 91105, 91105, 91105, 91105, 91105, 91105, 91105, 91105, 466571, 145018, 298420, 390278, 199611), info.filter = 0.9, maf.filter = 0.01)

save(munge_UKB, file = "munge_UKB.Rdata")

