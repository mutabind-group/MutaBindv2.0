rm(list=ls())
library(car)
library(randomForest)
setwd("C:/Users/zhangning/Desktop/for anna/")     # can change
f <- read.table(file="SkempiS_WithModelFeatures.txt", header = TRUE, sep = '\t')
rownames(f) <- paste(f$PDB.id,f$Partner1,f$Partner2,f$Mutated.Chain,f$Mutation,f$label_dataset,sep = '_')                # for single mutation
# rownames(f) <- paste(f$PDB.id,f$Partner1,f$Partner2,f$Mutation,f$label_dataset,sep = '_')                              # for multiple mutation
c(dim(f)[1],length(unique(f$PDB.id)))

label <- 'DDGexp~dE_vdw_wt+dE_vdw_mut+dG_solv_mut+dG_solv_wt+dPro_mut+dPro_wt+SA_com_wt+SA_part_wt+CS+ddG_fold'         # model features of single mutation
# label <- 'DDGexp~dE_vdw_wt+dE_vdw_mut+dG_solv_mut+dG_solv_wt+ddG_fold+CS+ddE_elec_.site.site.+ddrSA'                      # model features of multiple mutation

# Build Model, MLR
model.mlr <- lm(as.formula(label), data = f)
summary(model.mlr)
cor.test(f$DDGexp, fitted(model.mlr))
f$ddG_pred_mlr <- fitted(model.mlr)
# Build Model, RF
set.seed(100)
model.rf <- randomForest(as.formula(label), data = f) 
f$ddG_pred_rf <- model.rf$predicted
cor.test(f$DDGexp,f$ddG_pred_rf)
# mean
f$MutaBindS <- (f$ddG_pred_mlr+f$ddG_pred_rf)/2
cor.test(f$DDGexp,f$MutaBindS)
sqrt(mean((f$DDGexp-f$MutaBindS)^2, na.rm = TRUE))   # RMSE

# save model
save(model.mlr,file = 'model.mlr')  
save(model.rf,file = 'model.rf')










