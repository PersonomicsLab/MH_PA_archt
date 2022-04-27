#!/bin/bash

#SBATCH --job-name=make_sumstats_NA
#SBATCH --nodes=1-1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=20G
#SBATCH --output=make_sumstats_NA.out 
#SBATCH --error=make_sumstats_NA.err

## in log files, record the date (time) the job starts at and the hostname (node) that it is run on
date
hostname

## load R module
ml load r/3.4.4-python-2.7.15-java-11
## run Rscript
Rscript NA_sumstats.R   

## in log files, record time the job finishes
date
