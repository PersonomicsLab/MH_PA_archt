# LDSC of negative affect summary statistics
traits <- c( "mdd_meta.sumstats.gz", "SWB.sumstats.gz", "Neuroticism.sumstats.gz", "gad.sumstats.gz")
sample.prev <- c(.34, NA, NA, NA)
population.prev <- c(.16, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("mdd_meta", "SWB", "neur", "gad")
LDSCoutput_UKB_negative2 <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_negative2, file = "LDSCoutput_UKB_negative2.RData")

# LDSC of negative affect summary statistics + risk summary statistics
traits <- c("SWB.sumstats.gz", "Neuroticism.sumstats.gz", "mdd_meta.sumstats.gz", "gad.sumstats.gz", "risk2.sumstats.gz")
sample.prev <- c(NA, NA, .34, NA, NA)
population.prev <- c(NA, NA, .16, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("SWB", "neur", "mdd_meta", "gad", "risk")
LDSCoutput_UKB_negative2_risk <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_negative2_risk, file = "LDSCoutput_UKB_negative2_risk.RData")

# LDSC of physical activity summary statistics, to be used in CFA of these traits
traits <- c("moderate.sumstats.gz", "overall_activity.sumstats.gz", "sedentary.sumstats.gz", "sleep_duration.sumstats.gz", "walking.sumstats.gz")
sample.prev <- c(NA, NA, NA, NA, NA)
population.prev <- c(NA, NA, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("moderate", "overall", "sedentary", "sleep", "walking")
LDSCoutput_UKB_health <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_health, file = "LDSCoutput_UKB_health.RData")

# LDSC of negative affect summary statistics + activity summary statistics, to derive genetic correlations
traits <- c("SWB.sumstats.gz", "Neuroticism.sumstats.gz", "mdd_meta.sumstats.gz", "gad.sumstats.gz", "moderate.sumstats.gz", "overall_activity.sumstats.gz", "sedentary.sumstats.gz", "sleep_duration.sumstats.gz", "walking.sumstats.gz")
sample.prev <- c(NA, NA, .34, NA, NA, NA, NA, NA, NA)
population.prev <- c(NA, NA, .16, NA, NA, NA, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("SWB", "neur", "mdd_meta", "gad", "moderate", "overall", "sedentary", "sleep", "walking")
LDSCoutput_UKB_negative2_health <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_negative2_health, file = "LDSCoutput_UKB_negative2_health.RData")

# LDSC of negative affect summary statistics + activity summary statistics (controlling for sex and BMI), to derive genetic correlations
traits <- c("SWB.sumstats.gz", "Neuroticism.sumstats.gz", "mdd_meta.sumstats.gz", "gad.sumstats.gz", "moderate_sexBMI.sumstats.gz", "overall_activity_sexBMI.sumstats.gz", "sedentary_sexBMI.sumstats.gz", "sleep_duration_sexBMI.sumstats.gz", "walking_sexBMI.sumstats.gz")
sample.prev <- c(NA, NA, .34, NA, NA, NA, NA, NA, NA)
population.prev <- c(NA, NA, .16, NA, NA, NA, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("SWB", "neur", "mdd_meta", "gad", "moderate_sexBMI", "overall_sexBMI", "sedentary_sexBMI", "sleep_sexBMI", "walking_sexBMI")
LDSCoutput_UKB_negative2_health_sexBMI <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_negative2_health_sexBMI, file = "LDSCoutput_UKB_negative2_health_sexBMI.RData")

# LDSC of activity summary statistics (controlling for sex and BMI)
traits <- c("moderate_sexBMI.sumstats.gz", "overall_activity_sexBMI.sumstats.gz", "sedentary_sexBMI.sumstats.gz", "sleep_duration_sexBMI.sumstats.gz", "walking_sexBMI.sumstats.gz")
sample.prev <- c(NA, NA, NA, NA, NA)
population.prev <- c(NA, NA, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("moderate_sexBMI", "overall_sexBMI", "sedentary_sexBMI", "sleep_sexBMI", "walking_sexBMI")
LDSCoutput_UKB_health_sexBMI <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_health_sexBMI, file = "LDSCoutput_UKB_health_sexBMI.RData")

# LDSC of risk + physical activity summary statistics
traits <- c("risk2.sumstats.gz", "moderate.sumstats.gz", "overall_activity.sumstats.gz", "sedentary.sumstats.gz", "sleep_duration.sumstats.gz", "walking.sumstats.gz")
sample.prev <- c(NA, NA, NA, NA, NA, NA)
population.prev <- c(NA, NA, NA, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("risk", "moderate", "overall", "sedentary", "sleep", "walking")
LDSCoutput_UKB_risk_health <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_risk_health, file = "LDSCoutput_UKB_risk_health.RData")

# LDSC models of negative affect (including risk) + activity summary statistics, one at a time
traits <- c("SWB.sumstats.gz", "Neuroticism.sumstats.gz", "mdd_meta.sumstats.gz", "gad.sumstats.gz", "moderate.sumstats.gz", "BMI.sumstats.gz")
sample.prev <- c(NA, NA, .34, NA, NA, NA)
population.prev <- c(NA, NA, .16, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("SWB", "neur", "mdd_meta", "gad", "moderate", "BMI")
LDSCoutput_UKB_negative2_moderate_BMI <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_negative2_moderate_BMI, file = "LDSCoutput_UKB_negative2_moderate_BMI.RData")

traits <- c("SWB.sumstats.gz", "Neuroticism.sumstats.gz", "mdd_meta.sumstats.gz", "gad.sumstats.gz", "overall_activity.sumstats.gz", "BMI.sumstats.gz")
sample.prev <- c(NA, NA, .34, NA, NA, NA)
population.prev <- c(NA, NA, .16, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("SWB", "neur", "mdd_meta", "gad", "overall", "BMI")
LDSCoutput_UKB_negative2_overall_BMI <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_negative2_overall_BMI, file = "LDSCoutput_UKB_negative2_overall_BMI.RData")

traits <- c("SWB.sumstats.gz", "Neuroticism.sumstats.gz", "mdd_meta.sumstats.gz", "gad.sumstats.gz", "sedentary.sumstats.gz", "BMI.sumstats.gz")
sample.prev <- c(NA, NA, .34, NA, NA, NA)
population.prev <- c(NA, NA, .16, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("SWB", "neur", "mdd_meta", "gad", "sedentary", "BMI")
LDSCoutput_UKB_negative2_sedentary_BMI <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_negative2_sedentary_BMI, file = "LDSCoutput_UKB_negative2_sedentary_BMI.RData")

traits <- c("SWB.sumstats.gz", "Neuroticism.sumstats.gz", "mdd_meta.sumstats.gz", "gad.sumstats.gz", "sleep_duration.sumstats.gz", "BMI.sumstats.gz")
sample.prev <- c(NA, NA, .34, NA, NA, NA)
population.prev <- c(NA, NA, .16, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("SWB", "neur", "mdd_meta", "gad", "sleep", "BMI")
LDSCoutput_UKB_negative2_sleep_BMI <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_negative2_sleep_BMI, file = "LDSCoutput_UKB_negative2_sleep_BMI.RData")

traits <- c("SWB.sumstats.gz", "Neuroticism.sumstats.gz", "mdd_meta.sumstats.gz", "gad.sumstats.gz", "walking.sumstats.gz", "BMI.sumstats.gz")
sample.prev <- c(NA, NA, .34, NA, NA, NA)
population.prev <- c(NA, NA, .16, NA, NA, NA)
ld <- "eur_w_ld_chr/"
wld <- "eur_w_ld_chr/"
trait.names <- c("SWB", "neur", "mdd_meta", "gad", "walking", "BMI")
LDSCoutput_UKB_negative2_walking_BMI <- ldsc(traits=traits, sample.prev=sample.prev, population.prev=population.prev, ld=ld, wld=wld, trait.names=trait.names)
save(LDSCoutput_UKB_negative2_walking_BMI, file = "LDSCoutput_UKB_negative2_walking_BMI.RData")


