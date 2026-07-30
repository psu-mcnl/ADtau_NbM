clear
clc

mean(MRI_gap_MCI)
std(MRI_gap_MCI)

mean(MRI_gap_CU_aCSF)
std(MRI_gap_CU_aCSF)

mean(MRI_gap_CU_nCSF)
std(MRI_gap_CU_nCSF)

[t,p] = ttest2(CU_nCSF_ratio,CU_aCSF_ratio)

[t,p] = ttest2(MCI_ratio,CU_aCSF_ratio)