#!/bin/bash
#prep protein
pdb4amber -i protein.pdb -d --reduce -o PRO.pdb

pdb4amber -i peptide.pdb --reduce -o peptide_clean.pdb


#clean pdb nya dulu

obabel aln.pdb -O fixed.mol2 --gen3d

antechamber -i fixed.mol2 -fi mol2 -o CIR_tmp.mol2 -fo mol2 -c bcc -at gaff2
parmchk2 -i CIR_tmp.mol2 -f mol2 -o CIR.frcmod

antechamber -i fixed.mol2 -fi mol2 -o ALN_tmp.mol2 -fo mol2 -c bcc -at gaff2
parmchk2 -i ALN_tmp.mol2 -f mol2 -o ALN.frcmod

antechamber -i fixed.mol2 -fi mol2 -o DPR_tmp.mol2 -fo mol2 -c bcc -at gaff2
parmchk2 -i DPR_tmp.mol2 -f mol2 -o DPR.frcmod