###
# Setup
###
SEPARATOR      WHITESPACE
SCHEME         STDERR		
GENOMICCONTROL OFF
COLUMNCOUNTING LENIENT
AVERAGEFREQ    ON
MINMAXFREQ     ON



### PGC_UKB Depression 
MARKER MarkerName
ALLELE A1 A2
STDERR StdErrLogOR
EFFECT LogOR
PVALUE P
ADDFILTER Freq > 0.01
ADDFILTER Freq < 0.99
PROCESS /scratch/aalab/Sarah/UKB_phys_psych/PGC_UKB_depression_genome-wide_uppercase.txt ## UKB MDD summary statistics


### MVP_UKB Depression
MARKER rsid
ALLELE A1 A2
EFFECT EFFECT
STDERR SE
PVALUE P
ADDFILTER Freq > 0.01
ADDFILTER Freq < 0.99
PROCESS /scratch/aalab/Sarah/UKB_phys_psych/MDD.EUR.MVP.NatNeuro2021_headers.txt ## MVP MDD summary statistics


### Finish
OUTFILE MDD_MVP_PGC_UKB_eur_all. .tbl
ANALYZE HETEROGENEITY

QUIT

