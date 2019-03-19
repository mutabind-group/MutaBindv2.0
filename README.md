# MutaBindv2.0

## Files:
  #### SkempiS_WithModelFeatures.txt is training set used for developing MutaBindS.
  ###### Forward (“SkempiS.F”) includes 2504 destabilizing and 712 stabilizing single mutations with 94 neutral mutations. 
  ###### Reverse ("SkempiS.R") includes 712 destabilizing and 2504 stabilizing single mutations with 94 neutral mutations.
  
  #### SkempiM_WithModelFeatures.txt is training set used for developing MutaBindM.
  ###### Forward (“SkempiM.F”) includes 1075 destabilizing and 290 stabilizing single mutations with 6 neutral mutations. 
  ###### Reverse ("SkempiM.R") includes 290 destabilizing and 1075 stabilizing single mutations with 6 neutral mutations.

  #### SkempiS_4191.txt is single mutation training set used in MutaBindv2.0.
  ###### Forward (“SkempiS.F”) includes 2504 destabilizing and 712 stabilizing single mutations with 94 neutral mutations. 
  ###### Reverse ("SkempiS.R") includes 881 stabilizing single mutations.
  
  #### SkempiM_1752.txt is multiple mutations training set used in MutaBindv2.0.
  ###### Forward (“SkempiM.F”) includes 1075 destabilizing and 290 stabilizing single mutations with 6 neutral mutations. 
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

## Code:
  #### BuildModel.R is the script for building model .
