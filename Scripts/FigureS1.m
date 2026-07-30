clear
load('FigureS1.mat')
%%
[r0,p0] = function_brainplot_corr(tau_spatial_MCI,NB_MCI, 'Baseline NbM vs. annual Tau change','Spearman');

[r0,p0] = function_brainplot_corr(tau_spatial_CUaCSF,NB_CUaCSF, 'Baseline NbM vs. annual Tau change','Spearman');