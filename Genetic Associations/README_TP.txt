#### Summary Statistics File Names + Sources ####

## Physical Activity Phenotypes (Doherty et al., 2018; https://ora.ox.ac.uk/objects/uuid:ff479f44-bf35-48b9-9e67-e690a2937b22)

# Moderate Activity
	Original file name
		Doherty_moderate.csv.gz
	Txt file name
		Doherty_moderate.txt
	Munged file name
		moderate.sumstats.gz
# Overall Activity
	Original file name
		Doherty_overall_activity.csv.gz
	Txt file name
		Doherty_overall_activity.txt
	Munged file name
		overall.sumstats.gz
# Sedentary Activity
	Original file name
		Doherty_sedentary.csv.gz
	Txt file name
		Doherty_sedentary.txt
	Munged file name
		sedentary.sumstats.gz
# Sleep Duration
	Original file name
		Doherty_sleep_duration.csv.gz
	Txt file name
		Doherty_sleep_duration.txt
	Munged file name
		sleep_duration.sumstats.gz
# Walking
	Original file name
		Doherty_walking.csv.gz
	Txt file name
		Doherty_walking.txt
	Munged file name
		walking.sumstats.gz
		
## Mental Health Phenotypes

# Subjective Well-Being (Okbay et al., 2016; http://www.thessgac.org/data)
	Original file name
		SWB_Full.txt
	Munged file name
		SWB.sumstats.gz
		
# Major Depression (Levey et al., 2021; available through dbGaP)
	File names for summary statistics used in METAL meta-analysis
		PGC_UKB_depression_genome-wide.txt
		MDD.EUR.MVP.NatNeuro2021.gz --> MDD.EUR.MVP.NatNeuro2021_headers.txt
	Output file from meta-analysis
		MDD_MVP_PGC_UKB_eur_all.1.tbl
	Renamed output file name
		MDD_MVP_PGC_UKB_eur_all.1.txt
	Munged file name
		mdd_meta.sumstats.gz
		
# Neuroticism (Nagel et al., 2018; https://ctg.cncr.nl/software/summary_statistics/)
	Original file name
		sumstats_neuroticism_ctg_format.txt.gz
	Txt file name
		sumstats_neuroticism_ctg_format.txt
	Munged file name
		Neuroticism.sumstats.gz
		
# Generalized Anxiety (Levey et al., 2020; available through dbGaP)
	Original file name
		dbGAP_GAD2eur.txt
	Munged file name
		gad.sumstats.gz
		
# Risk-Taking (Karlsson Linnér et al., 2019; http://www.thessgac.org/data)
	Original file name
		RISK_GWAS_MA_UKB+replication.txt
	Munged file name
		risk2.sumstats.gz



#### ANALYSES ####

STEP 1: Meta-analyze MDD summary statistics

 ## Use METAL (Willer, Li, & Abecasis, 2010) to run the following script:
 meta_MDD.sh

STEP 2: Munge Summary Statistics to standardize and reformat to include necessary columns and remove duplicates

 ## R Script
 munge_all.R
 
 ## Shell Script
 munge_all.sh
 
 
STEP 3: Use LDSC to derive genetic correlations and covariances for use in Genomic SEM modeling

 ## see file: 'LDSC codes for resub.sh' with annotations
 ## this code is run in R with the GenomicSEM package
 

STEP 4: Use Genomic SEM to conduct Confirmatory Factor Analyses (CFA) on summary statistics for physical health and mental health, separately

 ## R Script
 CFA_models.R
 
 
STEP 5: Use sumstats() function in GenomicSEM to prepare for multivariate GWAS (i.e., ensure same reference allele, transform coefficients and SEs)

 ## R Script
 NA_sumstats.R
 
 # Shell Script
 NA_sumstats.sh
 
 # Output file
 GSEM_negaff_sumstats_v2.RData
 

STEP 6: Run multivariate GWAS on MH/negative affect summary statistics, using the formatted summary statistics from STEP 5, and the LDSC output from STEP 3

 ## R Script
 NA_GWAS.R
 
 ## Shell Script
 NA_GWAS.sh
 
 ## Output file
 negaff_factor_v1_GWAS.txt
 
 ## Munge summary statistics
 NA_munge.R
 NA_munge.sh
 
 Munged file name
 negaff.sumstats.gz (used in LCV below)
 
 
OTHER 

# Run Latent Causal Variable Analysis to explore potential causal relationships between the negative affect phenotype and each of the 5 physical activity phenotypes

 ## R Script
 LCV.R
