% Load Data
load('Figure1.mat')

% Zoom out the plot if there are outliers. For example, Figure 1A, Figure
% 1D-MCI
%%
% Combine data
data1 = double([NB_t1; NB_abeta_t1.pos; NB_abeta_t1.neg]);
data2 = [tau_t1; Tau_abeta_t1.pos; Tau_abeta_t1.neg];

% Group lengths for coloring
len1 = length(NB_t1);    
len2 = length(NB_abeta_t1.pos); 
len3 = length(NB_abeta_t1.neg); 

% colors = [repmat([0.843, 0.188, 0.153], len1, 1);      % Red - #D73027
%           repmat([0.271, 0.459, 0.706], len2, 1);      % Blue - #4575B4
%           repmat([0.992, 0.682, 0.38], len3, 1)];      % Orange - #FDAE61
colors = [repmat([0.843, 0.188, 0.153], len1, 1);    % Red - #D73027
          repmat([0.271, 0.459, 0.706], len2, 1);    % Blue - #4575B4
          repmat([0.902, 0.671, 0.008], len3, 1)];   % Gold - #E6AB02


% Spearman correlation
[rho, p2] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);

% Sort x data for smooth prediction line
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Plot confidence interval (light gray fill)
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     [0.85 0.85 0.85], 'EdgeColor', 'none');
hold on;

% Plot scatter points (colored by group)
scatter(data1, data2, 200, colors, 'filled', 'MarkerFaceAlpha', 0.7);

% Plot least-squares regression line (gray)
plot(x_sorted, y_pred, 'Color', [0.5 0.5 0.5], 'LineWidth', 2);

% Set tick marks
xticks(100:50:250); 
yticks(0.8:0.4:1.6);  

% Set figure size
set(gcf, 'Position', [100, 100, 800, 600]); % in pixels

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
% axis tight;

[rho, p2] = corr(data1, data2, 'type', 'Spearman');
disp(['Rho: ', num2str(rho)]);
disp(['P-value: ', num2str(p2)]);

%%
% Combine data
data1 = double([PSC_t1; PSC_abeta_t1.pos; PSC_abeta_t1.neg]);
data2 = [tau_t1; Tau_abeta_t1.pos; Tau_abeta_t1.neg];

% Group lengths for coloring
len1 = length(NB_t1);    
len2 = length(NB_abeta_t1.pos); 
len3 = length(NB_abeta_t1.neg); 

% colors = [repmat([0.843, 0.188, 0.153], len1, 1);      % Red - #D73027
%           repmat([0.271, 0.459, 0.706], len2, 1);      % Blue - #4575B4
%           repmat([0.992, 0.682, 0.38], len3, 1)];      % Orange - #FDAE61
colors = [repmat([0.843, 0.188, 0.153], len1, 1);    % Red - #D73027
          repmat([0.271, 0.459, 0.706], len2, 1);    % Blue - #4575B4
          repmat([0.902, 0.671, 0.008], len3, 1)];   % Gold - #E6AB02


% Spearman correlation
[rho, p2] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);

% Sort x data for smooth prediction line
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Plot confidence interval (light gray fill)
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     [0.85 0.85 0.85], 'EdgeColor', 'none');
hold on;

% Plot scatter points (colored by group)
scatter(data1, data2, 200, colors, 'filled', 'MarkerFaceAlpha', 0.7);

% Plot least-squares regression line (gray)
plot(x_sorted, y_pred, 'Color', [0.5 0.5 0.5], 'LineWidth', 2);

% Set tick marks
% xticks(100:50:250); 
yticks(0.8:0.4:1.6);  

% Set figure size
set(gcf, 'Position', [100, 100, 800, 600]); % in pixels

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
% axis tight;

%% Figure S2

data1 = double([NB_t1; NB_abeta_t1.pos; NB_abeta_t1.neg]);
data2 = [tau_change_MCI; tau_change_CUaCSF; tau_change_CUnCSF];

% Group lengths for coloring
len1 = length(NB_t1);    
len2 = length(NB_abeta_t1.pos); 
len3 = length(NB_abeta_t1.neg); 

% colors = [repmat([0.843, 0.188, 0.153], len1, 1);      % Red - #D73027
%           repmat([0.271, 0.459, 0.706], len2, 1);      % Blue - #4575B4
%           repmat([0.992, 0.682, 0.38], len3, 1)];      % Orange - #FDAE61
colors = [repmat([0.843, 0.188, 0.153], len1, 1);    % Red - #D73027
          repmat([0.271, 0.459, 0.706], len2, 1);    % Blue - #4575B4
          repmat([0.902, 0.671, 0.008], len3, 1)];   % Gold - #E6AB02


% Spearman correlation
[rho, p2] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);

% Sort x data for smooth prediction line
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Plot confidence interval (light gray fill)
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     [0.85 0.85 0.85], 'EdgeColor', 'none');
hold on;

% Plot scatter points (colored by group)
scatter(data1, data2, 200, colors, 'filled', 'MarkerFaceAlpha', 0.7);

% Plot least-squares regression line (gray)
plot(x_sorted, y_pred, 'Color', [0.5 0.5 0.5], 'LineWidth', 2);

% Set tick marks
xticks(100:50:200); 
yticks(0:0.04:1.6);  

% Set figure size
set(gcf, 'Position', [100, 100, 800, 600]); % in pixels

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
% axis tight;

rho
p2
% set(gca, 'XTickLabel', []);
% set(gca, 'YTickLabel', []);

%% Figure S2 


data1 = double([tau_t1; Tau_abeta_t1.pos; Tau_abeta_t1.neg]);
data2 = [NB_change_MCI; NB_change_CUaCSF; NB_change_CUnCSF];

% Group lengths for coloring
len1 = length(NB_t1);    
len2 = length(NB_abeta_t1.pos); 
len3 = length(NB_abeta_t1.neg); 

% colors = [repmat([0.843, 0.188, 0.153], len1, 1);      % Red - #D73027
%           repmat([0.271, 0.459, 0.706], len2, 1);      % Blue - #4575B4
%           repmat([0.992, 0.682, 0.38], len3, 1)];      % Orange - #FDAE61
colors = [repmat([0.843, 0.188, 0.153], len1, 1);    % Red - #D73027
          repmat([0.271, 0.459, 0.706], len2, 1);    % Blue - #4575B4
          repmat([0.902, 0.671, 0.008], len3, 1)];   % Gold - #E6AB02


% Spearman correlation
[rho, p2] = corr(data1, data2, 'type', 'Spearman');

% Fit linear regression model
mdl = fitlm(data1, data2);

% Sort x data for smooth prediction line
[x_sorted, sortIdx] = sort(data1);
[y_pred, y_ci] = predict(mdl, x_sorted);

% Plot confidence interval (light gray fill)
fill([x_sorted; flipud(x_sorted)], ...
     [y_ci(:,1); flipud(y_ci(:,2))], ...
     [0.85 0.85 0.85], 'EdgeColor', 'none');
hold on;

% Plot scatter points (colored by group)
scatter(data1, data2, 200, colors, 'filled', 'MarkerFaceAlpha', 0.7);

% Plot least-squares regression line (gray)
plot(x_sorted, y_pred, 'Color', [0.5 0.5 0.5], 'LineWidth', 2);

% Set tick marks
xticks(0.8:0.4:1.6); 
yticks(-20:20:20);  

% Set figure size
set(gcf, 'Position', [100, 100, 800, 600]); % in pixels

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
% axis tight;

rho
p2
% set(gca, 'XTickLabel', []);
% set(gca, 'YTickLabel', []);
%% ========================================================================
%
%           Baseline 
%
% ========================================================================

%%

% 
data1 = double(NB_abeta_t1.neg);
data2 = Tau_abeta_t1.neg;

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
yticks(0.8:0.1:1);  
xticks(100:50:200);  
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


set(gca, 'XTickLabel', []);
set(gca, 'YTickLabel', []);

%%
% Data
data1 = double(NB_abeta_t1.pos);    
data2 = Tau_abeta_t1.pos;             

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
yticks(0.8:0.2:1.6);
% yticks(-0.04:0.08:1);
xticks(100:50:200);

% xlim([100 200]);


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
%%

% Data
data1 = double(NB_t1);   
data2 = tau_t1;          

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
yticks(0.8:0.4:1.6);
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

rho, pval


set(gca, 'XTickLabel', []);
set(gca, 'YTickLabel', []);


%% ========================================================================
% Longitudinal


data1 = double(NB_abeta_t1.neg);
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
yticks(0:0.04:10);  
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

data1 = double(Tau_abeta_t1.neg);
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
yticks(-40:20:20);  
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
data1 = double(NB_abeta_t1.pos);     
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
yticks(-10:0.04:10);
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
data1 = double(Tau_abeta_t1.pos);     
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
% Data
data1 = double(NB_t1);   
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
yticks(0:0.1:10);
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
% Data
data1 = double(tau_t1);   
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
yticks(-20:20:0);
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
