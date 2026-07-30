%%
subplot(151)
input_xlabel = 'Regional gCAP';
input_ylabel = 'MMSE';
input_title = 'braak 1';
[MCI_gCAP_rho_b1,p_b1] = function_scatterplot(mean(gCAP_t1(:,braak_1_index),2),MMSE_t1,input_xlabel,input_ylabel,input_title);
subplot(152)
input_title = 'meta temporal';
[MCI_gCAP_rho_tem,p_tem] = function_scatterplot(mean(gCAP_t1(:,meta_new),2),MMSE_t1,input_xlabel,input_ylabel,input_title);
subplot(153)
input_title = 'braak 3-4';
[MCI_gCAP_rho_b34,p_b34] = function_scatterplot(mean(gCAP_t1(:,braak_34_index),2),MMSE_t1,input_xlabel,input_ylabel,input_title);
subplot(154)
input_title = 'braak 5';
[MCI_gCAP_rho_b5,p_b5] = function_scatterplot(mean(gCAP_t1(:,braak_5_index),2),MMSE_t1,input_xlabel,input_ylabel,input_title);
subplot(155)
input_title = 'braak 6';
[MCI_gCAP_rho_b6,p_b6] = function_scatterplot(mean(gCAP_t1(:,braak_6_index),2),MMSE_t1,input_xlabel,input_ylabel,input_title);

%%
subplot(151)
input_xlabel = 'Regional tau';
input_ylabel = 'MMSE';
input_title = 'braak 1';
[MCI_tau_rho_b1,p_b1] = function_scatterplot(mean(tau_spatial_t1(:,braak_1_index),2),MMSE_t1,input_xlabel,input_ylabel,input_title);
subplot(152)
input_title = 'meta temporal';
[MCI_tau_rho_tem,p_tem] = function_scatterplot(mean(tau_spatial_t1(:,meta_new),2),MMSE_t1,input_xlabel,input_ylabel,input_title);
subplot(153)
input_title = 'braak 3-4';
[MCI_tau_rho_b34,p_b34] = function_scatterplot(mean(tau_spatial_t1(:,braak_34_index),2),MMSE_t1,input_xlabel,input_ylabel,input_title);
subplot(154)
input_title = 'braak 5';
[MCI_tau_rho_b5,p_b5] = function_scatterplot(mean(tau_spatial_t1(:,braak_5_index),2),MMSE_t1,input_xlabel,input_ylabel,input_title);
subplot(155)
input_title = 'braak 6';
[MCI_tau_rho_b6,p_b6] = function_scatterplot(mean(tau_spatial_t1(:,braak_6_index),2),MMSE_t1,input_xlabel,input_ylabel,input_title);

%%
subplot(151)
input_xlabel = 'Regional gCAP';
input_ylabel = 'MMSE';
input_title = 'braak 1';
[aCSF_gCAP_rho_b1,p_b1] = function_scatterplot(mean(gCAP_abeta_t1.pos(:,braak_1_index),2),CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(152)
input_title = 'meta temporal';
[aCSF_gCAP_rho_tem,p_tem] = function_scatterplot(mean(gCAP_abeta_t1.pos(:,meta_new),2),CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(153)
input_title = 'braak 3-4';
[aCSF_gCAP_rho_b34,p_b34] = function_scatterplot(mean(gCAP_abeta_t1.pos(:,braak_34_index),2),CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(154)
input_title = 'braak 5';
[aCSF_gCAP_rho_b5,p_b5] = function_scatterplot(mean(gCAP_abeta_t1.pos(:,braak_5_index),2),CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(155)
input_title = 'braak 6';
[aCSF_gCAP_rho_b6,p_b6] = function_scatterplot(mean(gCAP_abeta_t1.pos(:,braak_6_index),2),CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);

%%
subplot(151)
input_xlabel = 'Regional tau';
input_ylabel = 'MMSE';
input_title = 'braak 1';
[aCSF_tau_rho_b1,p_b1] = function_scatterplot(mean(tau_spatial_abeta_t1.pos(:,braak_1_index),2),CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(152)
input_title = 'meta temporal';
[aCSF_tau_rho_tem,p_tem] = function_scatterplot(mean(tau_spatial_abeta_t1.pos(:,meta_new),2),CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(153)
input_title = 'braak 3-4';
[aCSF_tau_rho_b34,p_b34] = function_scatterplot(mean(tau_spatial_abeta_t1.pos(:,braak_34_index),2),CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(154)
input_title = 'braak 5';
[aCSF_tau_rho_b5,p_b5] = function_scatterplot(mean(tau_spatial_abeta_t1.pos(:,braak_5_index),2),CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
subplot(155)
input_title = 'braak 6';
[aCSF_tau_rho_b6,p_b6] = function_scatterplot(mean(tau_spatial_abeta_t1.pos(:,braak_6_index),2),CN_aCSF_MMSE,input_xlabel,input_ylabel,input_title);
%%

gcap_vals = [MCI_gCAP_rho_b1, MCI_gCAP_rho_tem, MCI_gCAP_rho_b34, MCI_gCAP_rho_b5, MCI_gCAP_rho_b6];
tau_vals  = [MCI_tau_rho_b1,  MCI_tau_rho_tem,  MCI_tau_rho_b34,  MCI_tau_rho_b5,  MCI_tau_rho_b6];

% x positions (can correspond to ROI indices)
x = 1:5;

% Set color
line_color = [0.843, 0.188, 0.153];

figure('Position', [100, 100, 1000, 600]);
hold on;

% Plot lines
plot(x, gcap_vals, '-o', 'Color', line_color, 'LineWidth', 3, 'MarkerSize', 10);
plot(x, tau_vals,  '-s', 'Color', line_color, 'LineWidth', 3, 'MarkerSize', 10);

ylim([-0.8, 0.8]);           
yticks(-0.8:0.4:0.8);    
% Formatting
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

% Remove axis numerical labels
set(gca, 'XTickLabel', []);
set(gca, 'YTickLabel', []);

%%

% Define grouped arrays using original individual variable names
MCI_gCAP = [MCI_gCAP_rho_b1, MCI_gCAP_rho_tem, MCI_gCAP_rho_b34, MCI_gCAP_rho_b5, MCI_gCAP_rho_b6];
MCI_tau  = [MCI_tau_rho_b1,  MCI_tau_rho_tem,  MCI_tau_rho_b34,  MCI_tau_rho_b5,  MCI_tau_rho_b6];

aCSF_gCAP = [aCSF_gCAP_rho_b1, aCSF_gCAP_rho_tem, aCSF_gCAP_rho_b34, aCSF_gCAP_rho_b5, aCSF_gCAP_rho_b6];
aCSF_tau  = [aCSF_tau_rho_b1,  aCSF_tau_rho_tem,  aCSF_tau_rho_b34,  aCSF_tau_rho_b5,  aCSF_tau_rho_b6];

mci_color = [0.843, 0.188, 0.153];
acsf_color = [0.271, 0.459, 0.706];

% Create figure with 4:3 aspect ratio
figure('Position', [100, 100, 800, 600]);
hold on;

% Plot MCI
plot(x, MCI_gCAP, '-o', 'Color', mci_color, 'LineWidth', 3, 'MarkerSize', 10); % gCAP
plot(x, MCI_tau,  '-s', 'Color', mci_color, 'LineWidth', 3, 'MarkerSize', 10); % tau

% Plot aCSF
plot(x, aCSF_gCAP, '--o', 'Color', acsf_color, 'LineWidth', 3, 'MarkerSize', 10); % gCAP
plot(x, aCSF_tau,  '--s', 'Color', acsf_color, 'LineWidth', 3, 'MarkerSize', 10); % tau

% Axes formatting
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

% Remove tick labels
set(gca, 'XTickLabel', []);
set(gca, 'YTickLabel', []);

% Set y-axis range and tick step
ylim([-0.8, 0.8]);
yticks(-0.4:0.4:0.4);


%%
% exportgraphics(gcf, '/nfs/data2/Yutong/AD/NBtau/Paper/Figures_Oct_modify/Figure4/illustration_MCI.png', 'Resolution', 300);

% Define MCI data
MCI_gCAP = [MCI_gCAP_rho_b1, MCI_gCAP_rho_tem, MCI_gCAP_rho_b34, MCI_gCAP_rho_b5, MCI_gCAP_rho_b6];
MCI_tau  = [MCI_tau_rho_b1,  MCI_tau_rho_tem,  MCI_tau_rho_b34,  MCI_tau_rho_b5,  MCI_tau_rho_b6];

x = 1:5;
mci_color = [0.843, 0.188, 0.153];

% Create figure with 4:3 aspect ratio
figure('Position', [100, 100, 900, 500]);
hold on;

% Plot MCI bars (semi-transparent)
bar_data = [MCI_gCAP; MCI_tau]';  % 5x2: each column is a variable
b = bar(x, bar_data, 'grouped');
b(1).FaceColor = mci_color;
b(2).FaceColor = mci_color;
b(2).LineStyle = '--';
b(1).FaceAlpha = 0.25;
b(2).FaceAlpha = 0.25;

% Black horizontal line at y = 0
plot([0.5, 5.5], [0, 0], 'k-', 'LineWidth', 2);

% Plot lines on top
plot(x, MCI_gCAP, '-o', 'Color', mci_color, 'LineWidth', 3, 'MarkerSize', 10);
plot(x, MCI_tau,  '--s', 'Color', mci_color, 'LineWidth', 3, 'MarkerSize', 10);

% Axes formatting
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

% Remove tick labels
set(gca, 'XTickLabel', []);
set(gca, 'YTickLabel', []);
set(gca, 'XTick', 1:5);
% Set y-axis range and ticks
ylim([-0.8, 0.8]);
yticks(-0.4:0.4:0.4);

%%

% exportgraphics(gcf, '/nfs/data2/Yutong/AD/NBtau/Paper/Figures_Oct_modify/Figure4/illustration_aCSF.png', 'Resolution', 300);

% Define aCSF data
aCSF_gCAP = [aCSF_gCAP_rho_b1, aCSF_gCAP_rho_tem, aCSF_gCAP_rho_b34, aCSF_gCAP_rho_b5, aCSF_gCAP_rho_b6];
aCSF_tau  = [aCSF_tau_rho_b1,  aCSF_tau_rho_tem,  aCSF_tau_rho_b34,  aCSF_tau_rho_b5,  aCSF_tau_rho_b6];

x = 1:5;
acsf_color = [0.271, 0.459, 0.706];

% Create figure with 4:3 aspect ratio
figure('Position', [100, 100, 900, 500]);
hold on;

% Plot aCSF bars (semi-transparent)
bar_data = [aCSF_gCAP; aCSF_tau]';  % 5x2: each column = gCAP or tau
b = bar(x, bar_data, 'grouped');
b(1).FaceColor = acsf_color;
b(2).FaceColor = acsf_color;
b(2).LineStyle = '--';
b(1).FaceAlpha = 0.25;
b(2).FaceAlpha = 0.25;

% Black horizontal line at y = 0
plot([0.5, 5.5], [0, 0], 'k-', 'LineWidth', 2);

% Plot aCSF lines
plot(x, aCSF_gCAP, '-o', 'Color', acsf_color, 'LineWidth', 3, 'MarkerSize', 10);
plot(x, aCSF_tau,  '--s', 'Color', acsf_color, 'LineWidth', 3, 'MarkerSize', 10);

% Axes formatting
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

% Show five tick marks on x-axis
set(gca, 'XTick', 1:5);

% Remove labels
set(gca, 'XTickLabel', []);
set(gca, 'YTickLabel', []);

% Set y-axis range and ticks
ylim([-0.8, 0.8]);
yticks(-0.4:0.4:0.4);
