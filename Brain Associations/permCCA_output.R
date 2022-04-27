# visualze permuted CCA outputs

rm(list=ls())
#set wd
# loc = 3
prjdir = 'ukb_phyama'
subdir = 'stats'
dir = file.path(prjdir, subdir)
source('~/Scripts/R/setWD.R')
setWD(dir)

# get packages
library(tidyverse)


# get U/V etc from each ind model
otfile1 = file.path(path, 'posthocs', 'model_loadings.Rda')
otfile2 = file.path(path, 'posthocs', 'model_UVs.Rda')


if(file.exists(otfile1) & file.exists(otfile2)){
  # set paras
  dirs = list.dirs(path)
  nCV = 3 # select top 3 CVs for all models

  # iterate over dirs
  loadings = as.data.frame(matrix(nrow = 1, ncol = nCV+4))
  names(loadings) = c(paste0("CV", seq(nCV)), "vars", "idx", "md", "sample")
  uvs = as.data.frame(matrix(nrow = 1, ncol = 6))
  names(uvs) = c('idx', 'CV', 'U', 'V', 'md', 'sample')
  inputs = c("brain_org.csv", "psy_imp.csv", "phy_org.csv")
  nA = 28 # number of brain vars

  for(d in dirs){
    if(grepl('model',d)){
      smp = sub(".*//", "", d)
      files = list.files(d, pattern = '^model')

      for(f in files){
        tmp = readr::read_csv(file.path(d,f), col_names = F)
        f = str_replace(f, '-brain', '')
        mdname = strsplit(strsplit(f,'.csv')[[1]][1],'model_')[[1]][2]


        if(str_starts(mdname, 'mh')){
          nB = 7 # number of mental health vars
          inputU = read.table(file.path(d,inputs[1]), header = F)
          inputV = read.table(file.path(d,inputs[2]), header = F)
        }else if(str_starts(mdname, 'ph')){
          nB=21 # number of physical activity vars
          inputU = read.table(file.path(d,inputs[1]), header = F)
          inputV = read.table(file.path(d,inputs[3]), header = F)
        }

        U = tmp %>% select(seq(nCV)) %>%
          slice((2+nA+nB+1):nrow(.)) %>%
          slice(seq(0.5 * n()))
        loadingU = cor(U, inputU) %>% t() %>%
          as.data.frame() %>%
          rename(CV1 = X1, CV2 = X2, CV3 = X3) %>%
          mutate(vars = 'U', idx = seq(n()))

        V = tmp %>% select(seq(nCV)) %>%
          slice((2+nA+nB+1):nrow(.)) %>%
          slice(-seq(0.5 * n()))
        loadingV = cor(V, inputV) %>% t() %>%
          as.data.frame() %>%
          rename(CV1 = X1, CV2 = X2, CV3 = X3) %>%
          mutate(vars = 'V', idx = seq(n()))

        # concatenate U/V loadings & stack models
        dt = rbind(loadingU, loadingV) %>% mutate(md = mdname, sample = smp)
        loadings = rbind(loadings, dt)

        # concatenate U/V
        u = U %>% as.data.frame() %>%
          rename(CV1 = X1, CV2 = X2, CV3 = X3) %>%
          mutate(idx = seq(n())) %>%
          pivot_longer(cols = 1:3, names_to = 'CV') %>%
          rename(U = value)
        v = V %>% as.data.frame() %>%
          rename(CV1 = X1, CV2 = X2, CV3 = X3) %>%
          mutate(idx = seq(n())) %>%
          pivot_longer(cols = 1:3, names_to = 'CV') %>%
          rename(V = value)
        uv = u %>% full_join(., v) %>% mutate(md = mdname, sample = smp)
        uvs = rbind(uvs, uv)
        # print(paste0(mdname, " size of uvs: ", dim(uvs)))
      }
    }
  }
  # remove 1st empty row
  loadings = loadings[-1, ]
  uvs = uvs[-1, ]

  # save output
  save(file = otfile1, loadings)
  save(file = otfile2, uvs)
}else{
  print("loading saved file ..")
  load(otfile1)
  load(otfile2)
}
