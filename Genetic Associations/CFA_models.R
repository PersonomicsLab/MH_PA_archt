## These can be run individually, after loading GenomicSEM and the respective covstruc (i.e., LDSC output)

## CFA of mental health phenotypes, including risk
NA_risk_mod <-  "Neg =~ NA*neur + mdd_meta + gad + SWB + risk
                  Neg ~~ 1*Neg"
NA_risk_mod_SEM <- usermodel(covstruc = LDSCoutput_UKB_negative2_risk, model = NA_risk_mod, 
                                    CFIcalc = T, std.lv = T, imp_cov = F)

## CFA of mental health phenotypes, excluding risk
NA_mod <-  "Neg =~ NA*neur + mdd_meta + gad + SWB
                  Neg ~~ 1*Neg"
NA_mod_SEM <- usermodel(covstruc = LDSCoutput_UKB_negative2, model = NA_mod, 
                             CFIcalc = T, std.lv = T, imp_cov = F)

## CFA of physical health phenotypes
health_mod <-  "Phys =~ NA*moderate + overall + sedentary + sleep + walking
Phys ~~ 1*Phys"
health_mod_SEM <- usermodel(covstruc = LDSCoutput_UKB_health, model = health_mod, imp_cov = T, fix_resid = T, CFIcalc = T, std.lv = T)



## Models to derive p-values for LDSC (standardized estimates = genetic correlations)

rg_model_neg <- '
SWB ~~ neur
SWB ~~ mdd_meta
SWB ~~ gad
SWB ~~ risk
neur ~~ mdd_meta
neur ~~ gad
neur ~~ risk
mdd_meta ~~ gad
mdd_meta ~~ risk
gad ~~ risk'
rg_out_neg <- usermodel(LDSCoutput_UKB_negative2_risk, estimation="DWLS", model=rg_model_neg)

rg_model_health <- '
moderate ~~ overall
moderate ~~ sedentary
moderate ~~ sleep
moderate ~~ walking
overall ~~ sedentary
overall ~~ sleep
overall ~~ walking
sedentary ~~ sleep
sedentary ~~ walking
sleep ~~ walking'
rg_out_health <- usermodel(LDSCoutput_UKB_health, estimation="DWLS", model=rg_model_health)

rg_model_health_sexBMI <- '
moderate_sexBMI ~~ overall_sexBMI
moderate_sexBMI ~~ sedentary_sexBMI
moderate_sexBMI ~~ sleep_sexBMI
moderate_sexBMI ~~ walking_sexBMI
overall_sexBMI ~~ sedentary_sexBMI
overall_sexBMI ~~ sleep_sexBMI
overall_sexBMI ~~ walking_sexBMI
sedentary_sexBMI ~~ sleep_sexBMI
sedentary_sexBMI ~~ walking_sexBMI
sleep_sexBMI ~~ walking_sexBMI'
rg_out_health_sexBMI <- usermodel(LDSCoutput_UKB_health_sexBMI, estimation="DWLS", model=rg_model_health_sexBMI)

rg_model_risk_health <- '
risk ~~ moderate
risk ~~ overall
risk ~~ sedentary
risk ~~ sleep
risk ~~ walking'
rg_out_risk_health <- usermodel(LDSCoutput_UKB_risk_health, estimation="DWLS", model=rg_model_risk_health)


negative2_risk_moderate_mod <- 
  "Neg =~ NA*neur + SWB + mdd_meta + gad + risk
Mod_fac =~ moderate
Neg ~~ 1*Neg
Neg ~~ Mod_fac"
negative2_risk_moderate_mod_SEM <- usermodel(covstruc = LDSCoutput_UKB_negative2_risk_moderate, model = negative2_risk_moderate_mod, CFIcalc = T, std.lv = T, imp_cov = F)

negative2_risk_overall_mod <- 
  "Neg =~ NA*neur + SWB + mdd_meta + gad + risk
Over_fac =~ overall
Neg ~~ 1*Neg
Neg ~~ Over_fac"
negative2_risk_overall_mod_SEM <- usermodel(covstruc = LDSCoutput_UKB_negative2_risk_overall, model = negative2_risk_overall_mod, CFIcalc = T, std.lv = T, imp_cov = F)

negative2_risk_sedentary_mod <- 
  "Neg =~ NA*neur + SWB + mdd_meta + gad + risk
Sedent_fac =~ sedentary
Neg ~~ 1*Neg
Neg ~~ Sedent_fac"
negative2_risk_sedentary_mod_SEM <- usermodel(covstruc = LDSCoutput_UKB_negative2_risk_sedentary, model = negative2_risk_sedentary_mod, CFIcalc = T, std.lv = T, imp_cov = F)

negative2_risk_sleep_mod <- 
  "Neg =~ NA*neur + SWB + mdd_meta + gad + risk
Sleep_fac =~ sleep
Neg ~~ 1*Neg
Neg ~~ Sleep_fac"
negative2_risk_sleep_mod_SEM <- usermodel(covstruc = LDSCoutput_UKB_negative2_risk_sleep, model = negative2_risk_sleep_mod, CFIcalc = T, std.lv = T, imp_cov = F)

negative2_risk_walking_mod <- 
  "Neg =~ NA*neur + SWB + mdd_meta + gad + risk
Walk_fac =~ walking
Neg ~~ 1*Neg
Neg ~~ Walk_fac"
negative2_risk_walking_mod_SEM <- usermodel(covstruc = LDSCoutput_UKB_negative2_risk_walking, model = negative2_risk_walking_mod, CFIcalc = T, std.lv = T, imp_cov = F)
