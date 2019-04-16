setwd("C:/Users/ChenDouDou/Downloads/MutaBindv2.0-master/")
##### Table 1. Comparison of methods’ performances on single and multiple mutations #####
#### 2.D.1/MutaBind,BeatMuSiC,FoldX ####
rm(list = ls())
significant.cor.test <- function(x,y){
  if (is.na(cor(x,y))){
    print('One of x,y have NULL!')
  }else{
    if (cor.test(x,y)$p.value>0.01){
      return(0)
    }else{
      return(round(cor.test(x,y)$estimate,2))
    }
  }
}
test <- read.csv(file='2.D.1.txt',header = TRUE, sep = '\t')
test.p <- test[test$DDGexp>=0,]
test.n <- test[test$DDGexp<0,]
# All
significant.cor.test(test$DDGexp,test$MutaBind)
round(sqrt(mean((test$DDGexp-test$MutaBind)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  >= 0
significant.cor.test(test.p$DDGexp, test.p$MutaBind)
round(sqrt(mean((test.p$DDGexp-test.p$MutaBind)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  < 0
significant.cor.test(test.n$DDGexp, test.n$MutaBind)
round(sqrt(mean((test.n$DDGexp-test.n$MutaBind)^2, na.rm = TRUE)),2)
## 1O2+1O2R(MutaBindS)
# All
significant.cor.test(test$DDGexp,test$MutaBindS)
round(sqrt(mean((test$DDGexp-test$MutaBindS)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  >= 0
significant.cor.test(test.p$DDGexp, test.p$MutaBindS)
round(sqrt(mean((test.p$DDGexp-test.p$MutaBindS)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  < 0
significant.cor.test(test.n$DDGexp, test.n$MutaBindS)
round(sqrt(mean((test.n$DDGexp-test.n$MutaBindS)^2, na.rm = TRUE)),2)
## BeatMuSiC
# All
significant.cor.test(test$DDGexp,test$BeAtMuSiC)
round(sqrt(mean((test$DDGexp-test$BeAtMuSiC)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  >= 0
significant.cor.test(test.p$DDGexp, test.p$BeAtMuSiC)
round(sqrt(mean((test.p$DDGexp-test.p$BeAtMuSiC)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  < 0
significant.cor.test(test.n$DDGexp, test.n$BeAtMuSiC)
round(sqrt(mean((test.n$DDGexp-test.n$BeAtMuSiC)^2, na.rm = TRUE)),2)
## FoldX
# All
significant.cor.test(test$DDGexp,test$FoldX_bind)
round(sqrt(mean((test$DDGexp-test$FoldX_bind)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  >= 0
significant.cor.test(test.p$DDGexp, test.p$FoldX_bind)
round(sqrt(mean((test.p$DDGexp-test.p$FoldX_bind)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  < 0
significant.cor.test(test.n$DDGexp, test.n$FoldX_bind)
round(sqrt(mean((test.n$DDGexp-test.n$FoldX_bind)^2, na.rm = TRUE)),2)

#### SkempiM.F/FoldX ####
rm(list = ls())
significant.cor.test <- function(x,y){
  if (is.na(cor(x,y))){
    print('One of x,y have NULL!')
  }else{
    if (cor.test(x,y)$p.value>0.01){
      return(0)
    }else{
      return(round(cor.test(x,y)$estimate,2))
    }
  }
}
f <- read.csv(file='SkempiM.F_Foldx.txt', header = TRUE, sep = '\t')
f.p <- f[f$DDGexp>=0,]
f.n <- f[f$DDGexp<0,]
## FoldX
# All
significant.cor.test(f$DDGexp,f$FoldX_bind)
round(sqrt(mean((f$DDGexp-f$FoldX_bind)^2, na.rm = TRUE)),2)
#〖∆∆G〗_exp^  >= 0
significant.cor.test(f.p$DDGexp,f.p$FoldX_bind)
round(sqrt(mean((f.p$DDGexp-f.p$FoldX_bind)^2, na.rm = TRUE)),2)
#〖∆∆G〗_exp^  < 0
significant.cor.test(f.n$DDGexp,f.n$FoldX_bind)
round(sqrt(mean((f.n$DDGexp-f.n$FoldX_bind)^2, na.rm = TRUE)),2)

#### SkempiS/MutaBindS,MutaBindS(CV4),MutaBindS(CV5) ####
rm(list = ls())
significant.cor.test <- function(x,y){
  if (is.na(cor(x,y))){
    print('One of x,y have NULL!')
  }else{
    if (cor.test(x,y)$p.value>0.01){
      return(0)
    }else{
      return(round(cor.test(x,y)$estimate,2))
    }
  }
}
f <- read.csv(file='SkempiS_CV.txt',header = TRUE, sep = '\t')
f.p <- f[f$DDGexp>=0,]
f.n <- f[f$DDGexp<0,]
## MutaBindS
# All
significant.cor.test(f$DDGexp,f$MutaBindS)
round(sqrt(mean((f$DDGexp-f$MutaBindS)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  >= 0
significant.cor.test(f.p$DDGexp,f.p$MutaBindS)
round(sqrt(mean((f.p$DDGexp-f.p$MutaBindS)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  < 0
significant.cor.test(f.n$DDGexp,f.n$MutaBindS)
round(sqrt(mean((f.n$DDGexp-f.n$MutaBindS)^2, na.rm = TRUE)),2)
## MutaBindS(CV4)
# All
significant.cor.test(f$DDGexp,f$MutaBindS_CV4)
round(sqrt(mean((f$DDGexp-f$MutaBindS_CV4)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  >= 0
significant.cor.test(f.p$DDGexp,f.p$MutaBindS_CV4)
round(sqrt(mean((f.p$DDGexp-f.p$MutaBindS_CV4)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  < 0
significant.cor.test(f.n$DDGexp,f.n$MutaBindS_CV4)
round(sqrt(mean((f.n$DDGexp-f.n$MutaBindS_CV4)^2, na.rm = TRUE)),2)
## MutaBindS(CV5)
# All
significant.cor.test(f$DDGexp,f$MutaBindS_CV5)
round(sqrt(mean((f$DDGexp-f$MutaBindS_CV5)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  >= 0
significant.cor.test(f.p$DDGexp,f.p$MutaBindS_CV5)
round(sqrt(mean((f.p$DDGexp-f.p$MutaBindS_CV5)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  < 0
significant.cor.test(f.n$DDGexp,f.n$MutaBindS_CV5)
round(sqrt(mean((f.n$DDGexp-f.n$MutaBindS_CV5)^2, na.rm = TRUE)),2)

#### SkempiM/MutaBindM,MutaBindM(CV4),MutaBindM(CV5) ####
rm(list = ls())
significant.cor.test <- function(x,y){
  if (is.na(cor(x,y))){
    print('One of x,y have NULL!')
  }else{
    if (cor.test(x,y)$p.value>0.01){
      return(0)
    }else{
      return(round(cor.test(x,y)$estimate,2))
    }
  }
}
f <- read.csv(file='SkempiM_CV.txt',header = TRUE, sep = '\t')
f.p <- f[f$DDGexp>=0,]
f.n <- f[f$DDGexp<0,]
## MutaBindM
# All
significant.cor.test(f$DDGexp,f$MutaBindM)
round(sqrt(mean((f$DDGexp-f$MutaBindM)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  >= 0
significant.cor.test(f.p$DDGexp,f.p$MutaBindM)
round(sqrt(mean((f.p$DDGexp-f.p$MutaBindM)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  < 0
significant.cor.test(f.n$DDGexp,f.n$MutaBindM)
round(sqrt(mean((f.n$DDGexp-f.n$MutaBindM)^2, na.rm = TRUE)),2)
## MutaBindM(CV4)
# All
significant.cor.test(f$DDGexp,f$MutaBindM_CV4)
round(sqrt(mean((f$DDGexp-f$MutaBindM_CV4)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  >= 0
significant.cor.test(f.p$DDGexp,f.p$MutaBindM_CV4)
round(sqrt(mean((f.p$DDGexp-f.p$MutaBindM_CV4)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  < 0
significant.cor.test(f.n$DDGexp,f.n$MutaBindM_CV4)
round(sqrt(mean((f.n$DDGexp-f.n$MutaBindM_CV4)^2, na.rm = TRUE)),2)
## MutaBindM(CV5)
# All
significant.cor.test(f$DDGexp,f$MutaBindM_CV5)
round(sqrt(mean((f$DDGexp-f$MutaBindM_CV5)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  >= 0
significant.cor.test(f.p$DDGexp,f.p$MutaBindM_CV5)
round(sqrt(mean((f.p$DDGexp-f.p$MutaBindM_CV5)^2, na.rm = TRUE)),2)
# 〖∆∆G〗_exp^  < 0
significant.cor.test(f.n$DDGexp,f.n$MutaBindM_CV5)
round(sqrt(mean((f.n$DDGexp-f.n$MutaBindM_CV5)^2, na.rm = TRUE)),2)
