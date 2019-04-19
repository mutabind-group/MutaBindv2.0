# MutaBindv2.0

## Files:
  #### SkempiS_WithModelFeatures.txt is training set used for developing MutaBindS.
  ###### Forward (“SkempiS.F”) includes 2504 destabilizing and 712 stabilizing single mutations with 94 neutral mutations. 
  ###### Reverse ("SkempiS.R") includes 712 destabilizing and 2504 stabilizing single mutations with 94 neutral mutations.
  
  #### SkempiM_WithModelFeatures.txt is training set used for developing MutaBindM.
  ###### Forward (“SkempiM.F”) includes 1075 destabilizing and 290 stabilizing multiple mutations with 6 neutral mutations. 
  ###### Reverse ("SkempiM.R") includes 290 destabilizing and 1075 stabilizing multiple mutations with 6 neutral mutations.

  #### SkempiS_4191.txt is single mutation training set used in MutaBindv2.0.  !!! update
  ###### Forward (“SkempiS.F”) includes 2504 destabilizing and 712 stabilizing single mutations with 94 neutral mutations. 
  ###### Reverse ("SkempiS.R") includes 881 stabilizing single mutations.
  
  #### SkempiM_1752.txt is multiple mutations training set used in MutaBindv2.0.  !!! update
  ###### Forward (“SkempiM.F”) includes 1075 destabilizing and 290 stabilizing multiple mutations with 6 neutral mutations. 
  ###### Reverse ("SkempiM.R") includes 381 stabilizing single mutations.
  
  #### 1.O.2+1.O.2.R.txt is training set used in develop method MutaBindS to test on 2.D.1.
  ###### Forward (“SkempiS.F”) includes 1218 destabilizing and 322 stabilizing single mutations with 22 neutral mutations. 
  ###### Reverse ("SkempiS.R") includes 354 stabilizing single mutations.
  
  #### 2.D.1.txt is single mutations training set used in MutaBindv2.0 that not in MutaBindv1.0.
  ###### Mutations in this file all come from “SkempiS.F”, includes 1286 destabilizing and 390 stabilizing single mutations with 72 neutral mutations. 
  
  #### SkempiM.F_Foldx.txt is the data set from SkempiM used to test FoldX.
  ###### Mutations in this file all come from “SkempiS.F”, includes 1075 destabilizing and 290 stabilizing multiple mutations with 6 neutral mutations. 
  
  #### SkempiS_CV.txt is the training and test set used in MutaBindS for crossvalidation.
  ###### Forward (“SkempiS.F”) includes 2504 destabilizing and 712 stabilizing single mutations with 94 neutral mutations. 
  ###### Reverse ("SkempiS.R") includes 881 stabilizing single mutations.
  
  #### SkempiM_CV.txt is the training and test set used in MutaBindM for crossvalidation.
  ###### Forward (“SkempiM.F”) includes 1075 destabilizing and 290 stabilizing multiple mutations with 6 neutral mutations. 
  ###### Reverse ("SkempiM.R") includes 381 stabilizing single mutations.



## Terms in the files:
  #### PDB id: The PDB entry of the complex.
  #### Partner1: Protein chains constituting one of the interaction partner. 
  #### Partner2: Protein chains constituting the other one of the interaction partner. 
  #### Mutated Chain: Protein chain with mutation.
  #### Mutation(SkempiS_WithModelFeatures.txt): The first character is one letter amino acid code for the wild-type residue, the second to penultimate characters indicate residue number, and the final character indicates the mutant amino acid.
  #### Mutation(SkempiM_WithModelFeatures.txt): The first character is one letter amino acid code for the wild-type residue, the second character is the mutated chain, the third to penultimate characters indicate residue number, and the final character indicates the mutant amino acid.
  #### DDGexp: Experimental changes of binding affinity upon mutations (in kcal/mol).
  #### label_dataset: 'forward' means the dataset SkempiS.F/SkempiM.F(wt->mut), 'reverse' means the dataset SkempiS.R/SkempiM.R(mut->wt).
  #### BeAtMuSiC: Using BeAtMuSiC to predict changes of binding affinity upon mutations (in kcal/mol).
  #### FoldX_bind: Using FoldX to predict changes of binding affinity upon mutations (in kcal/mol).
  #### MutaBind: Using MutaBind to predict changes of binding affinity upon mutations (in kcal/mol).
  #### MutaBindS(2.D.1.txt): Build model on "1.O.2+1.O.2.R" and then test on 2.D.1.
  #### MutaBindS(SkempiS_CV.txt): Training and test on SkempiS.
  #### MutaBindS_CV4: Leave-one-complex-out on SkempiS.
  #### MutaBindS_CV5: Leave-one-binding-site-out on SkempiS.
  #### MutaBindM: Training and test on SkempiS.
  #### MutaBindM: Leave-one-complex-out on SkempiM.
  #### MutaBindM: Leave-one-binding-site-out on SkempiM.
  
  

## Code:
  #### BuildModel.R is the script for building model.
  #### Table1.R is the script for Table1 in the paper.
  #### Produce2.D.1.R is the script for producing MutaBind and MutaBindS in 2.D.1.txt.
  #### CV.R is the script for producing predicted values for each pdb(type).
  #### Produce.CV.py is the script for merge the predicted values.
