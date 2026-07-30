
load('Figure4_MCI.mat')


%%

data1 = Overall_gCAP;   
data2 = MCI_MMSE;         

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
yticks(20:5:30);
xticks(0.3:0.2:0.8);


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
% Remove x-axis numerical labels
set(gca, 'XTickLabel', []);

% Remove y-axis numerical labels
set(gca, 'YTickLabel', []);
rho, pval



%%

data1 = Overall_tau;   
data2 = MCI_MMSE;         

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
yticks(20:5:30);
xticks(0.8:0.4:1.6);


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
% Remove x-axis numerical labels
set(gca, 'XTickLabel', []);

% Remove y-axis numerical labels
set(gca, 'YTickLabel', []);
rho, pval



%%
subplot(151)
input_xlabel = 'Regional tau';
input_ylabel = 'MMSE';
input_title = 'braak 1';
[rho_b1,p_b1] = function_scatterplot(MCI_bk1_tau,MCI_MMSE,input_xlabel,input_ylabel,input_title);
subplot(152)
input_title = 'meta temporal';
[rho_tem,p_tem] = function_scatterplot(MCI_meta_tau,MCI_MMSE,input_xlabel,input_ylabel,input_title);
subplot(153)
input_title = 'braak 3-4';
[rho_b34,p_b34] = function_scatterplot(MCI_bk34_tau,MCI_MMSE,input_xlabel,input_ylabel,input_title);
subplot(154)
input_title = 'braak 5';
[rho_b5,p_b5] = function_scatterplot(MCI_bk5_tau,MCI_MMSE,input_xlabel,input_ylabel,input_title);
subplot(155)
input_title = 'braak 6';
[rho_b6,p_b6] = function_scatterplot(MCI_bk6_tau,MCI_MMSE,input_xlabel,input_ylabel,input_title);

%%
subplot(151)
input_xlabel = 'Regional gCAP';
input_ylabel = 'MMSE';
input_title = 'braak 1';
[rho_b1,p_b1] = function_scatterplot(MCI_bk1_gCAP,MCI_MMSE,input_xlabel,input_ylabel,input_title);
subplot(152)
input_title = 'meta temporal';
[rho_tem,p_tem] = function_scatterplot(MCI_meta_gCAP,MCI_MMSE,input_xlabel,input_ylabel,input_title);
subplot(153)
input_title = 'braak 3-4';
[rho_b34,p_b34] = function_scatterplot(MCI_bk34_gCAP,MCI_MMSE,input_xlabel,input_ylabel,input_title);
subplot(154)
input_title = 'braak 5';
[rho_b5,p_b5] = function_scatterplot(MCI_bk5_gCAP,MCI_MMSE,input_xlabel,input_ylabel,input_title);
subplot(155)
input_title = 'braak 6';
[rho_b6,p_b6] = function_scatterplot(MCI_bk6_gCAP,MCI_MMSE,input_xlabel,input_ylabel,input_title);

%%
rho_values = [rho_b1, rho_tem, rho_b34, rho_b5, rho_b6];
bar_labels = {'Braak I', 'Temporal', 'Braak III-IV', 'Braak V', 'Braak VI'};

% Define color
pos_color = [0.843, 0.188, 0.153];
gray_outline = [0.6 0.6 0.6];

% Create figure
figure; hold on;

% Bar width and positions
bw = 0.4;
x_pos = [0.8, 1.4, 2.0, 2.6, 3.2];  % Five bar positions

% Plot bars
for i = 1:5
    y = rho_values(i);

    if i == 7  % Significant: filled bars
        bar(x_pos(i), y, bw, 'FaceColor', pos_color, 'EdgeColor', 'none');
    else  % Non-significant: outlined bars
        bar(x_pos(i), y, bw, 'FaceColor', 'none', ...
            'EdgeColor', pos_color, 'LineWidth', 1.8, 'LineStyle', '-');
    end
end

% Trend line
plot(x_pos, rho_values, '--s', ...
    'Color', pos_color, ...
    'LineWidth', 2, ...
    'MarkerFaceColor', pos_color, ...
    'MarkerEdgeColor', 'w', ...
    'MarkerSize', 8);

% Axes settings
set(gca, 'XTick', x_pos, 'XTickLabel', bar_labels, ...
    'FontSize', 12, 'LineWidth', 1.2);
xlim([0.5, 3.4]);  % Adjust range for 5 bars
ylim([-0.8, 0]);
yticks(-0.8:0.4:0);
% ylabel('Spearman''s Correlation (rho)', 'FontSize', 13);
% ylim([0, max(rho_values) + 0.1]);

box off;

% Formatting
ax = gca;
ax.XAxis.FontSize = 25;
ax.YAxis.FontSize = 25;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';
ax.XAxis.LineWidth = 2;
ax.YAxis.LineWidth = 2;

% Hide axis labels if needed
set(gca, 'XTickLabel', []);
set(gca, 'YTickLabel', []);



%%
load('Figure4_CUaCSF.mat')


%%
data1 = Overall_gCAP_CUaCSF;
data2 = CN_aCSF_MMSE;

pos_color = [0.271, 0.459, 0.706];
ci_color = pos_color + (1 - pos_color) * 0.8;  % lighter for CI

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
scatter(data1, data2, 200, pos_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', pos_color, 'LineWidth', 2);

% Axis settings
yticks(20:5:30);
xticks(0.3:0.2:0.8);


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
% Remove x-axis numerical labels
set(gca, 'XTickLabel', []);

% Remove y-axis numerical labels
set(gca, 'YTickLabel', []);
rho, pval

%%
data1 = Overall_tau_CUaCSF;
data2 = CN_aCSF_MMSE;

pos_color = [0.271, 0.459, 0.706];
ci_color = pos_color + (1 - pos_color) * 0.8;  % lighter for CI

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
scatter(data1, data2, 200, pos_color, 'filled', 'MarkerFaceAlpha', 0.7);

% Regression line
plot(x_sorted, y_pred, 'Color', pos_color, 'LineWidth', 2);

% Axis settings
yticks(20:5:30);
xticks(0:0.4:0.8);


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
% Remove x-axis numerical labels
set(gca, 'XTickLabel', []);

% Remove y-axis numerical labels
set(gca, 'YTickLabel', []);
rho, pval



%%
subplot(151)
input_xlabel = 'Regional tau';
input_ylabel = 'MMSE';
input_title = 'braak 1';
[rho_b1,p_b1] = function_scatterplot(CUaCSF_bk1_tau,CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(152)
input_title = 'meta temporal';
[rho_tem,p_tem] = function_scatterplot(CUaCSF_meta_tau,CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(153)
input_title = 'braak 3-4';
[rho_b34,p_b34] = function_scatterplot(CUaCSF_bk34_tau,CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(154)
input_title = 'braak 5';
[rho_b5,p_b5] = function_scatterplot(CUaCSF_bk5_tau,CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(155)
input_title = 'braak 6';
[rho_b6,p_b6] = function_scatterplot(CUaCSF_bk6_tau,CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);

%%
subplot(151)
input_xlabel = 'Regional gCAP';
input_ylabel = 'MMSE';
input_title = 'braak 1';
[rho_b1,p_b1] = function_scatterplot(CUaCSF_bk1_gCAP,CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(152)
input_title = 'meta temporal';
[rho_tem,p_tem] = function_scatterplot(CUaCSF_meta_gCAP,CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(153)
input_title = 'braak 3-4';
[rho_b34,p_b34] = function_scatterplot(CUaCSF_bk34_gCAP,CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(154)
input_title = 'braak 5';
[rho_b5,p_b5] = function_scatterplot(CUaCSF_bk5_gCAP,CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(155)
input_title = 'braak 6';
[rho_b6,p_b6] = function_scatterplot(CUaCSF_bk6_gCAP,CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);




