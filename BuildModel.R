rm(list=ls())
library(car)
library(randomForest)
setwd("C:/Users/ChenDouDou/Downloads/MutaBindv2.0-master/")     # can change

f <- read.table(file="SkempiS.txt", header = TRUE, sep = '\t')
rownames(f) <- paste(f$PDB.id,f$Partner1,f$Partner2,f$Mutated.Chain,f$Mutation.s._cleaned,f$label_dataset,sep = '_')                # for single mutation
# rownames(f) <- paste(f$PDB.id,f$Partner1,f$Partner2,f$Mutation.s._cleaned,f$label_dataset,sep = '_')                              # for multiple mutation
c(dim(f)[1],length(unique(f$PDB.id)))

label <- 'DDGexp~ddE_vdw+ddG_solv+ddG_fold+SA_com_wt+SA_part_wt+CS+N_cont_wt'  # model features of single mutation
# label <- 'DDGexp~ddE_vdw+ddG_solv+ddG_fold+SA_com_wt+SA_part_wt+CS+E_cont_wt'  # model features of multiple mutation

# Build Model, RF
set.seed(100)
model.rf <- randomForest(as.formula(label), data = f) 
f$ddG_pred_rf <- model.rf$predicted
cor.test(f$DDGexp,f$ddG_pred_rf)

# save model
save(model.rf,file = 'model.rf')










