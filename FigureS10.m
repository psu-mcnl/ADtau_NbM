clear
load('FigureS10.mat')

subplot(121)
input_xlabel = 'NB volume';
input_ylabel = 'MMSE';
input_title = 'MCI';
function_scatterplot(NB_MCI,MMSE_MCI,input_xlabel,input_ylabel,input_title);
subplot(122)
input_xlabel = 'NB volume';
input_ylabel = 'MMSE';
input_title = 'CU-aCSF';
function_scatterplot(NB_CUaCSF,MMSE_CUaCSF,input_xlabel,input_ylabel,input_title);











