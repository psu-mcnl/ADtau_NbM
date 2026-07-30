load('Figure3.mat')

% Note the vairable name apc does not mean it is apc, in main figure, it is
% annual change.
%%

subplot(121)
input_xlabel = 'BL: regional gCAP';
input_ylabel = 'regional tau change (Annual)';
input_title = 'MCI, Braak V';
function_scatterplot(gCAP_bk5_t1,tau_bk5_apc,input_xlabel,input_ylabel,input_title);
subplot(122)
input_xlabel = 'BL: regional tau';
input_ylabel = 'regional gCAP change (Annual)';
input_title = 'MCI, Braak V';
function_scatterplot(tau_bk5_t1,gCAP_bk5_apc,input_xlabel,input_ylabel,input_title);


%%


data1 = gCAP_bk5_t1;            
data2 = tau_bk5_apc;
% Color: Red - #D73027
psc_color =[0.843, 0.188, 0.153];
ci_color = psc_color + (1 - psc_color) * 0.8;  % lighter for CI

% Spearman correlation
[rho, pval] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Create figure
figure;
set(gcf, 'Position', [100, 100, 800, 600]);

% Plot CI
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none');
hold on;

% Scatter plot
scatter(data1, data2, 200, psc_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', psc_color, 'LineWidth', 2);

% Axis settings
yticks(0:0.1:30);
xticks(0:0.2:1.6);


ax = gca;
ax.XAxis.FontSize = 25;
ax.YAxis.FontSize = 25;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.Box = 'off';
ax.TickDir = 'out';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';
% % Remove x-axis numerical labels
set(gca, 'XTickLabel', []);

% Remove y-axis numerical labels
set(gca, 'YTickLabel', []);
rho, pval

%%


data1 = tau_bk5_t1;   
data2 = gCAP_bk5_apc;
% Color: Red - #D73027
psc_color =[0.843, 0.188, 0.153];
ci_color = psc_color + (1 - psc_color) * 0.8;  % lighter for CI

% Spearman correlation
[rho, pval] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Create figure
figure;
set(gcf, 'Position', [100, 100, 800, 600]);

% Plot CI
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none');
hold on;

% Scatter plot
scatter(data1, data2, 200, psc_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', psc_color, 'LineWidth', 2);

% Axis settings
yticks(-0.2:0.1:30);
xticks(0:0.4:1.6);


ax = gca;
ax.XAxis.FontSize = 25;
ax.YAxis.FontSize = 25;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.Box = 'off';
ax.TickDir = 'out';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';

set(gca, 'XTickLabel', []);
set(gca, 'YTickLabel', []);
rho, pval


%% --------------------- MCI --------------------------
X = NB_t1;
M = gCAP_bk5_t1;
Y = tau_bk5_apc;


X = tiedrank(X);
M = tiedrank(M);
Y = tiedrank(Y);

lm1 = fitlm(M, X);         
X_res = lm1.Residuals.Raw;  
lm2 = fitlm(M, Y);          
Y_res = lm2.Residuals.Raw;  
lm_rst = fitlm(X_res, Y_res);      

lm_rst.Coefficients

figure,
subplot(121)
data1 = NB_t1;
data2 = tau_bk5_apc;
function_scatterplot(data1, data2, 'BL NB', 'tau change Annual', 'MCI');
% subplot(132)
% data1 = X_res;
% data2 = Y;
% function_scatterplot(data1, data2, 'NB ranked', 'tau change APC', 'NB control gCAP');
subplot(122)
data1 = X_res;
data2 = Y_res;
function_scatterplot(data1, data2, 'NB ranked', 'tau change ranked', 'both control gCAP');


%%

data1 = NB_t1;  
% data2 = braak_tau_t1(:,1);       
data2 = tau_bk5_apc;
% Color: Red - #D73027
psc_color =[0.843, 0.188, 0.153];
ci_color = psc_color + (1 - psc_color) * 0.8;  % lighter for CI

% Spearman correlation
[rho, pval] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Create figure
figure;
set(gcf, 'Position', [100, 100, 800, 600]);

% Plot CI
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none');
hold on;

% Scatter plot
scatter(data1, data2, 200, psc_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', psc_color, 'LineWidth', 2);

% Axis settings
yticks(0:0.1:30);
xticks(100:100:200);


ax = gca;
ax.XAxis.FontSize = 25;
ax.YAxis.FontSize = 25;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.Box = 'off';
ax.TickDir = 'out';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';
% % Remove x-axis numerical labels
set(gca, 'XTickLabel', []);

% Remove y-axis numerical labels
set(gca, 'YTickLabel', []);
rho, pval


%%

data1 = X_res;   
% data2 = braak_tau_t1(:,1);           % Tau (same group)
data2 = Y_res;
% Color: Red - #D73027
psc_color =[0.843, 0.188, 0.153];
ci_color = psc_color + (1 - psc_color) * 0.8;  % lighter for CI

% Spearman correlation
[rho, pval] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Create figure
figure;
set(gcf, 'Position', [100, 100, 800, 600]);

% Plot CI
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none');
hold on;

% Scatter plot
scatter(data1, data2, 200, psc_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', psc_color, 'LineWidth', 2);

% Axis settings
yticks(-20:20:20);
xticks(-20:20:20);


ax = gca;
ax.XAxis.FontSize = 25;
ax.YAxis.FontSize = 25;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.Box = 'off';
ax.TickDir = 'out';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';
% % % Remove x-axis numerical labels
% set(gca, 'XTickLabel', []);
% 
% % Remove y-axis numerical labels
% set(gca, 'YTickLabel', []);
rho, pval


%%
subplot(121)
input_xlabel = 'BL: regional gCAP';
input_ylabel = 'regional tau change (Annual)';
input_title = 'CU aCSF, meta-temporal';
function_scatterplot(gCAP_metatemporal_t1,tau_metatemporal_apc,input_xlabel,input_ylabel,input_title);
subplot(122)
input_xlabel = 'BL: regional tau';
input_ylabel = 'regional gCAP change (Annual)';
input_title = 'CU aCSF, meta-temporal';
function_scatterplot(tau_metatemporal_t1,gCAP_metatemporal_apc,input_xlabel,input_ylabel,input_title);


%%

data1 = gCAP_metatemporal_t1;            
data2 = tau_metatemporal_apc;
% Color: Blue - #D73027
psc_color =[0.271, 0.459, 0.706];
ci_color = psc_color + (1 - psc_color) * 0.8;  % lighter for CI

% Spearman correlation
[rho, pval] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Create figure
figure;
set(gcf, 'Position', [100, 100, 800, 600]);

% Plot CI
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none');
hold on;

% Scatter plot
scatter(data1, data2, 200, psc_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', psc_color, 'LineWidth', 2);

% Axis settings
yticks(0:0.05:30);
xticks(0:0.2:1.6);


ax = gca;
ax.XAxis.FontSize = 25;
ax.YAxis.FontSize = 25;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.Box = 'off';
ax.TickDir = 'out';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';
% % Remove x-axis numerical labels
set(gca, 'XTickLabel', []);

% Remove y-axis numerical labels
set(gca, 'YTickLabel', []);
rho, pval


%%

data1 = tau_metatemporal_t1;   
data2 = gCAP_metatemporal_apc;
% Color: Blue
psc_color =[0.271, 0.459, 0.706];
ci_color = psc_color + (1 - psc_color) * 0.8;  % lighter for CI

% Spearman correlation
[rho, pval] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Create figure
figure;
set(gcf, 'Position', [100, 100, 800, 600]);

% Plot CI
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none');
hold on;

% Scatter plot
scatter(data1, data2, 200, psc_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', psc_color, 'LineWidth', 2);

% Axis settings
yticks(-0.2:0.2:30);
xticks(0:0.2:1.6);


ax = gca;
ax.XAxis.FontSize = 25;
ax.YAxis.FontSize = 25;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.Box = 'off';
ax.TickDir = 'out';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';
% % % Remove x-axis numerical labels
% set(gca, 'XTickLabel', []);
% 
% % Remove y-axis numerical labels
% set(gca, 'YTickLabel', []);
rho, pval

%%
% --------------------- CU aCSF --------------------------
X = NB_abeta_t1.pos;
M = gCAP_metatemporal_t1;
Y = tau_metatemporal_apc;

X = tiedrank(X);
M = tiedrank(M);
Y = tiedrank(Y);

lm1 = fitlm(M, X);         
X_res = lm1.Residuals.Raw;  
lm2 = fitlm(M, Y);          
Y_res = lm2.Residuals.Raw;  
lm_rst = fitlm(X_res, Y_res);      

lm_rst.Coefficients

figure,
subplot(121)
data1 = NB_abeta_t1.pos;
data2 = tau_metatemporal_apc;
function_scatterplot(data1, data2, 'BL NB', 'tau change Annual', 'CUaCSF');
% subplot(132)
% data1 = X_res;
% data2 = Y;
% function_scatterplot(data1, data2, 'NB ranked', 'tau change APC', 'NB control gCAP');
subplot(122)
data1 = X_res;
data2 = Y_res;
function_scatterplot(data1, data2, 'NB ranked', 'tau change ranked', 'both control gCAP');

%%

data1 = NB_abeta_t1.pos;   
% data2 = braak_tau_t1(:,1);           
data2 = tau_metatemporal_apc;
% Color: Blue
psc_color =[0.271, 0.459, 0.706];
ci_color = psc_color + (1 - psc_color) * 0.8;  % lighter for CI

% Spearman correlation
[rho, pval] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Create figure
figure;
set(gcf, 'Position', [100, 100, 800, 600]);

% Plot CI
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none');
hold on;

% Scatter plot
scatter(data1, data2, 200, psc_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', psc_color, 'LineWidth', 2);

% Axis settings
yticks(0:0.05:30);
xticks(100:50:200);


ax = gca;
ax.XAxis.FontSize = 25;
ax.YAxis.FontSize = 25;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.Box = 'off';
ax.TickDir = 'out';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';
% % Remove x-axis numerical labels
set(gca, 'XTickLabel', []);

% Remove y-axis numerical labels
set(gca, 'YTickLabel', []);
rho, pval


%%


data1 = X_res;   
% data2 = braak_tau_t1(:,1);           % Tau (same group)
data2 = Y_res;
% Color: Blue
psc_color =[0.271, 0.459, 0.706];
ci_color = psc_color + (1 - psc_color) * 0.8;  % lighter for CI

% Spearman correlation
[rho, pval] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Create figure
figure;
set(gcf, 'Position', [100, 100, 800, 600]);

% Plot CI
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none');
hold on;

% Scatter plot
scatter(data1, data2, 200, psc_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', psc_color, 'LineWidth', 2);

% Axis settings
yticks(-10:10:20);
xticks(-10:10:20);

ax = gca;
ax.XAxis.FontSize = 25;
ax.YAxis.FontSize = 25;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;
ax.Box = 'off';
ax.TickDir = 'out';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';
% % % Remove x-axis numerical labels
% set(gca, 'XTickLabel', []);
% 
% % Remove y-axis numerical labels
% set(gca, 'YTickLabel', []);
rho, pval


%%
load('Figure3_2.mat')
%%
input_title = 'SameTimepoint, NB vs. gCAP';
[r_gCAP_NB,p_gCAP_NB] = function_brainplot_corr(gCAP_t1,NB_t1,input_title,'Spearman');

input_title = 'SameTimepoint, tau vs. gCAP';
[r_gCAP_tau,p_gCAP_tau] = function_brainplot_corr(gCAP_t1,tau_spatial_t1,input_title,'Spearman');

%%
input_title = 'SameTimepoint, NB vs. gCAP';
[r_gCAP_NB,p_gCAP_NB] = function_brainplot_corr(gCAP_abeta_t1.pos,NB_abeta_t1.pos,input_title,'Spearman');

input_title = 'SameTimepoint, tau vs. gCAP';
[r_gCAP_tau,p_gCAP_tau] = function_brainplot_corr(gCAP_abeta_t1.pos,tau_spatial_abeta_t1.pos,input_title,'Spearman');

[rho,p] = corr(r_gCAP_NB,r_gCAP_tau,'type','Spearman')
%%













