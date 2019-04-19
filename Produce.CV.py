#!/usr/bin/python
# coding=utf-8

# Before you need to make sure the number of muts, and the change the 'len(crossvalidation.keys()) == 4191' in line 32

import os
from collections import defaultdict

fileinputpath = 'C:/Users/ChenDouDou/Downloads/MutaBindv2.0-master/'

file_list = os.listdir(fileinputpath + 'CrossValidation/')

filetype_list = ['MLR_LOO','RF_LOO','MLR_LBSO','RF_LBSO']
Allprediction = defaultdict(list)
for filetype in filetype_list:
    files = [item for item in file_list if item.startswith(filetype)]
    crossvalidation = {}
    line_count = []
    for file in files:
        with open(fileinputpath + 'CrossValidation/' + file, 'r') as fr:
            for line in fr:
                line = line.strip().split('\t')
                info = line[0].replace('1.00E+96','1E96').replace('1.00E+65','1E65')  # 1ASY_N117A
                cor = float(line[1])
                line_count.append(info)
                crossvalidation[info] = [cor, 1]
                if info not in crossvalidation.keys():
                    crossvalidation[info] = [cor, 1]
                else:
                    crossvalidation[info][0] = crossvalidation[info][0] + cor
                    crossvalidation[info][1] += 1
    if len(crossvalidation.keys()) == 4191:  ## SkempiS:4191; SkempiM:1752
        for key in crossvalidation.keys():
            Allprediction[key].append(str(crossvalidation[key][0]/crossvalidation[key][1]))
    else:
        print filetype,'not all muts taken as test!!!'

fr = open(fileinputpath+'SkempiS_4191.txt','r')  # SkempiM_1752
title = fr.next()

fpred = open(fileinputpath+'SkempiS_4191_addCV.txt','w')  # SkempiM_1752_addCV
newtitle = title.strip()+'\t'+'\t'.join(filetype_list)+'\n'
fpred.write(newtitle)

for line in fr:
    newline = line.strip().split('\t')
    # info = newline[0]+'_'+newline[1]+'_'+newline[2]+'_'+newline[3]+'_'+newline[4]+'_'+newline[6]  # SkempiS
    info = newline[0]+'_'+newline[1]+'_'+newline[2]+'_'+newline[3]+'_'+newline[5]  # SkempiM
    row = line.strip()+'\t'+'\t'.join(Allprediction[info])+'\n'
    fpred.write(row)

fr.close()
fpred.close()