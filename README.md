# MutaBindv2.0

## Files:
  #### SkempiS.txt is single mutation training set used in MutaBindv2.0.  
  ###### Forward (“SkempiS.F”) includes 2504 destabilizing and 712 stabilizing single mutations with 94 neutral mutations. 
  ###### Reverse ("SkempiS.R") includes 881 stabilizing single mutations.
  
  #### SkempiM.txt is multiple mutations training set used in MutaBindv2.0.  
  ###### Forward (“SkempiM.F”) includes 1075 destabilizing and 290 stabilizing multiple mutations with 6 neutral mutations. 
  ###### Reverse ("SkempiM.R") includes 381 stabilizing single mutations.
  
  #### 1.O.2+1.O.2.R.txt is training set used in develop method MutaBindS to test on 2.D.1.
  ###### Forward (“SkempiS.F”) includes 1218 destabilizing and 322 stabilizing single mutations with 22 neutral mutations. 
  ###### Reverse ("SkempiS.R") includes 354 stabilizing single mutations.
  
  #### 2.D.1.txt is single mutations training set used in MutaBindv2.0 that not in MutaBindv1.0.
  ###### Mutations in this file all come from “SkempiS.F”, includes 1286 destabilizing and 390 stabilizing single mutations with 72 neutral mutations. 
  
  #### SkempiM.F_Foldx.txt is the data set from SkempiM used to test FoldX.
  ###### Mutations in this file all come from “SkempiS.F”, includes 1075 destabilizing and 290 stabilizing multiple mutations with 6 neutral mutations. 
  
  
  
## Terms in the files:
  #### PDB id: The PDB entry of the complex.
  #### Partner1: Protein chains constituting one of the interaction partner. 
  #### Partner2: Protein chains constituting the other one of the interaction partner. 
  #### Mutated Chain: Protein chain with mutation.
  #### Mutation(s)_PDB: The location in this column is exactly the location in RCSB PDB file.
  #### Mutation(s)_cleaned: The location in this column is the location Skempi renumbering the RCSB PDB file.
  #### DDGexp: Experimental changes of binding affinity upon mutations (in kcal/mol).
  #### label_dataset: 'forward' means the dataset SkempiS.F/SkempiM.F(wt->mut), 'reverse' means the dataset SkempiS.R/SkempiM.R(mut->wt).
  #### BeAtMuSiC: Using BeAtMuSiC to predict changes of binding affinity upon mutations (in kcal/mol).
  #### FoldX_bind: Using FoldX to predict changes of binding affinity upon mutations (in kcal/mol).
  #### MutaBind: Using MutaBind to predict changes of binding affinity upon mutations (in kcal/mol).
  #### MutaBindS(2.D.1.txt): Build model on "1.O.2+1.O.2.R" and then test on 2.D.1.
  #### MutaBindS(SkempiS.txt): Training and test on SkempiS.
  #### MutaBindS_CV4: Leave-one-complex-out on SkempiS.
  #### MutaBindS_CV5: Leave-one-binding-site-out on SkempiS.
  #### MutaBindM: Training and test on SkempiS.
  #### MutaBindM: Leave-one-complex-out on SkempiM.
  #### MutaBindM: Leave-one-binding-site-out on SkempiM.
  
  

## Code:
  #### BuildModel.R is the script for building model.
  #### Produce2.D.1.R is the script for producing MutaBind and MutaBindS in 2.D.1.txt.
  #### CV.R is the script for producing predicted values for each pdb(type).
  #### Produce.CV.py is the script for merge the predicted values.
