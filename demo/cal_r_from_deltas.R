## IMPORTANT: Please set code_root variable properly. 
## code_root should be set to the directory where the repository README file is located. 
## For more information, please read the repository README file
code_root="~/SAPHIRE/"

setwd(paste0(code_root, "demo"))

library(dplyr)
library(readr)

# assuming input/pars_est_run_main_analysis.txt exists

pars_est=read_tsv("../output/pars_est_run_main_analysis.txt") %>%
  mutate(r3=1/(1+(1-r12)/(exp(delta3)*r12)),
         r4=1/(1+(1-r3)/(exp(delta4)*r3)),
         r5=1/(1+(1-r4)/(exp(delta5)*r4)))

summary_95CI=pars_est %>%
  summarise(r12_95CI=paste0(round(quantile(r12,c(0.025)),2),"-",round(quantile(r12,c(0.975)),2)),
            r3_95CI=paste0(round(quantile(r3,c(0.025)),2),"-",round(quantile(r3,c(0.975)),2)),
            r4_95CI=paste0(round(quantile(r4,c(0.025)),2),"-",round(quantile(r4,c(0.975)),2)),
            r5_95CI=paste0(round(quantile(r5,c(0.025)),2),"-",round(quantile(r5,c(0.975)),2)))
