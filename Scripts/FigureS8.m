clear

load('APC_NB_tau.mat');
load('FigureS8.mat')

%%

data1 = NB_CUnCSF;
data2 = tau_change_CUnCSF;

% Color (Gold - #E6AB02)
colors = repmat([0.902, 0.671, 0.008], length(data1), 1);

% Spearman correlation
[rho, p2] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);

% Sort x data for smooth prediction line
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Plot confidence interval (light gold fill)
nb_color = [0.902, 0.671, 0.008];
ci_color = nb_color + (1 - nb_color) * 0.8;
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none');
hold on;

% Plot scatter points (colored by group)
scatter(data1, data2, 200, colors, 'filled', 'MarkerFaceAlpha', 0.7);

% Plot least-squares regression line (slightly darker gold)
plot(x_sorted, y_pred, 'Color', [0.85, 0.6, 0.1], 'LineWidth', 2);

% Set tick marks
yticks(0:4:10);  
xticks(50:50:250);  
% Set figure size
set(gcf, 'Position', [100, 100, 800, 600]);

% Axis styling
ax = gca; 
ax.XAxis.FontSize = 25; 
ax.YAxis.FontSize = 25; 
ax.XAxis.FontWeight = 'bold';  
ax.YAxis.FontWeight = 'bold'; 
ax.XAxis.LineWidth = 2;  
ax.YAxis.LineWidth = 2; 
ax.Box = 'off';

% Make sure the ticks stay on bottom and left
ax.TickDir = 'out';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';

rho
p2


% set(gca, 'XTickLabel', []);
% set(gca, 'YTickLabel', []);

%%

data1 = tau_CUnCSF;
data2 = NB_change_CUnCSF;

% Color (Gold - #E6AB02)
colors = repmat([0.902, 0.671, 0.008], length(data1), 1);

% Spearman correlation
[rho, p2] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);

% Sort x data for smooth prediction line
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Plot confidence interval (light gold fill)
nb_color = [0.902, 0.671, 0.008];
ci_color = nb_color + (1 - nb_color) * 0.8;
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none');
hold on;

% Plot scatter points (colored by group)
scatter(data1, data2, 200, colors, 'filled', 'MarkerFaceAlpha', 0.7);

% Plot least-squares regression line (slightly darker gold)
plot(x_sorted, y_pred, 'Color', [0.85, 0.6, 0.1], 'LineWidth', 2);

% Set tick marks
yticks(-40:20:100);  
xticks(0.8:0.1:1.2);  
% Set figure size
set(gcf, 'Position', [100, 100, 800, 600]);

% Axis styling
ax = gca; 
ax.XAxis.FontSize = 25; 
ax.YAxis.FontSize = 25; 
ax.XAxis.FontWeight = 'bold';  
ax.YAxis.FontWeight = 'bold'; 
ax.XAxis.LineWidth = 2;  
ax.YAxis.LineWidth = 2; 
ax.Box = 'off';

% Make sure the ticks stay on bottom and left
ax.TickDir = 'out';
ax.XAxis.TickDirection = 'out';
ax.YAxis.TickDirection = 'out';

rho
p2

% set(gca, 'XTickLabel', []);
% set(gca, 'YTickLabel', []);

%%

% Data
data1 = NB_CUaCSF;    
data2 = tau_change_CUaCSF;            

% Color: Blue - #4575B4
pos_color = [0.271, 0.459, 0.706];
ci_color = pos_color + (1 - pos_color) * 0.8;  % lighter version for CI

% Spearman correlation
[rho, pval] = corr(data1, data2, 'type', 'Spearman');

% Linear regression model
mdl = fitlm(data1, data2);

% Sort x values for smooth line
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Plot
figure;
set(gcf, 'Position', [100, 100, 800, 600]);

% Plot CI (lighter fill)
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none'); 
hold on;

% Scatter plot
scatter(data1, data2, 200, pos_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', pos_color, 'LineWidth', 2);

% Axis styling
yticks(-10:5:10);
% yticks(-0.04:0.08:1);
xticks(50:50:250);
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

% 
% set(gca, 'XTickLabel', []);
% set(gca, 'YTickLabel', []);


rho, pval


%%

% Data
data1 = tau_CUaCSF;   
data2 = NB_change_CUaCSF;             

% Color: Blue - #4575B4
pos_color = [0.271, 0.459, 0.706];
ci_color = pos_color + (1 - pos_color) * 0.8;  % lighter version for CI

% Spearman correlation
[rho, pval] = corr(data1, data2, 'type', 'Spearman');

% Linear regression model
mdl = fitlm(data1, data2);

% Sort x values for smooth line
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Plot
figure;
set(gcf, 'Position', [100, 100, 800, 600]);

% Plot CI (lighter fill)
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     ci_color, 'EdgeColor', 'none'); 
hold on;

% Scatter plot
scatter(data1, data2, 200, pos_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', pos_color, 'LineWidth', 2);

% Axis styling
xticks(0.8:0.2:1.6);
% yticks(-0.04:0.08:1);
yticks(-10:10:10);
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

% set(gca, 'XTickLabel', []);
% set(gca, 'YTickLabel', []);

rho, pval

%%

data1 = NB_MCI;
data2 = tau_change_MCI;           

% Color: Red - #D73027
psc_color = [0.843, 0.188, 0.153];
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
xticks(100:50:200);
yticks(0:5:10);
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

rho, pval
% set(gca, 'XTickLabel', []);
% set(gca, 'YTickLabel', []);

%%
data1 = tau_MCI; 
data2 = NB_change_MCI;           

% Color: Red - #D73027
psc_color = [0.843, 0.188, 0.153];
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
xticks(1:0.4:200);
yticks(-40:10:100);
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

rho, pval


%% Longitudinal
clear
load('FigureS8_longitudinal.mat')

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
yticks(0:10:30);
xticks(0.4:0.2:1.6);


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

% set(gca, 'XTickLabel', []);
% set(gca, 'YTickLabel', []);
rho, pval



%%


data1 = NB_t1;   
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
yticks(0:10:30);
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
% % % Remove x-axis numerical labels
% set(gca, 'XTickLabel', []);
% 
% % Remove y-axis numerical labels
% set(gca, 'YTickLabel', []);
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

data1 = X_res;   
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
yticks(0:5:30);
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


% set(gca, 'XTickLabel', []);
% set(gca, 'YTickLabel', []);
rho, pval
%% --------------------- CU aCSF --------------------------
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


%%

data1 = NB_abeta_t1.pos;  
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
yticks(0:5:30);
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
% % % Remove x-axis numerical labels
% set(gca, 'XTickLabel', []);
% 
% % Remove y-axis numerical labels
% set(gca, 'YTickLabel', []);
rho, pval


%%

data1 = X_res;   
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
% % Remove x-axis numerical labels
set(gca, 'XTickLabel', []);

% Remove y-axis numerical labels
set(gca, 'YTickLabel', []);
rho, pval

