# Before run the script, you need to create a directory named 'CrossValidation' under the current directory

setwd("C:/Users/ChenDouDou/Downloads/MutaBindv2.0-master/")
library('randomForest')
library('stringr')
rm(list=ls())

f<-read.csv(file='SkempiM_1752.txt',header = TRUE, sep = '\t')
# rownames(f) <- paste(f$PDB.id,f$Partner1,f$Partner2,f$Mutated.Chain,f$Mutation,f$label_dataset,sep = '_')  # SkempiS
rownames(f) <- paste(f$PDB.id,f$Partner1,f$Partner2,f$Mutation,f$label_dataset,sep = '_')  # SkempiM

# label <- 'DDGexp~dE_vdw_wt+dE_vdw_mut+dG_solv_mut+dG_solv_wt+dPro_mut+dPro_wt+SA_com_wt+SA_part_wt+CS+ddG_fold'         # model features of single mutation
label <- 'DDGexp~dE_vdw_wt+dE_vdw_mut+dG_solv_mut+dG_solv_wt+ddG_fold+CS+ddE_elec_.site.site.+ddrSA'                      # model features of multiple mutation

#### Leave-One-Complex-Out #####
pdblist <- unique(f$PDB.id)
for (pdb in pdblist) {
  train.f <- subset(f,f$PDB.id!=pdb)
  test.f  <- subset(f,f$PDB.id==pdb)
  ########################## Linear regression ##
  train.f.fit <- lm(as.formula(label),data=train.f)
  pred.test.f.L <- predict(train.f.fit,test.f)
  test.f$pred.test.f.L <- pred.test.f.L
  filetitle.L <- paste('CrossValidation/MLR_LOO_',pdb,'.txt',sep = '')
  write.table(pred.test.f.L,filetitle.L,quote = FALSE,row.names = TRUE,
              col.names = FALSE,sep = '\t')
  ########################## Random Forest ##
  set.seed(100)
  train.f.rf <- randomForest(as.formula(label), data = train.f)
  pred.test.f.R <- predict(train.f.rf,test.f)
  test.f$pred.test.f.R <- pred.test.f.R
  filetitle.R <- paste('CrossValidation/RF_LOO_',pdb,'.txt',sep = '')
  write.table(pred.test.f.R,filetitle.R,quote = FALSE,row.names = TRUE,
              col.names = FALSE,sep = '\t')
}


#### Leave-One-Type-Out ####
f$label_traintest <- rownames(f)
for (pdb in pdblist){
  test.f <- c()
  data_pdb <- f[f$PDB.id==pdb,]
  test.f <- rbind(test.f,data_pdb)
  for (sametype in strsplit(as.character(unique(data_pdb$Hold_out_proteins)),',')[[1]]){
    sametypepdb <- strsplit(sametype,'_')[[1]][1]
    if ((sametypepdb %in% pdblist) & (sametypepdb!=pdb)){
      test.f <- rbind(test.f,f[f$PDB.id==sametypepdb,])
    }else if (sametypepdb %in% c('TCR/pMHC','AB/AG','Pr/PI')){
      test.f <- rbind(test.f,f[str_detect(f$Hold_out_proteins,sametypepdb) & f$PDB.id != pdb,])
    }
  }
  train.f <- f[!f$label_traintest %in% test.f$label_traintest,]
  ########################## Linear regression ##
  train.f.lr <- lm(as.formula(label),data=train.f)
  pred.test.f.L <- predict(train.f.lr,data_pdb)
  filetitle.L <- paste('CrossValidation/MLR_LBSO_',pdb,'.txt',sep = '')
  write.table(pred.test.f.L,filetitle.L,quote = FALSE,row.names = TRUE,
              col.names = FALSE,sep = '\t')
  ########################## Random Forest ##
  set.seed(100)
  train.f.rf <- randomForest(as.formula(label), data = train.f)
  pred.test.f.R <- predict(train.f.rf,data_pdb)
  filetitle.R <- paste('CrossValidation/RF_LBSO_',pdb,'.txt',sep = '')
  write.table(pred.test.f.R,filetitle.R,quote = FALSE,row.names = TRUE,
              col.names = FALSE,sep = '\t')
}
