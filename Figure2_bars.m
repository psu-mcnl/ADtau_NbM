




subplot(151)
input_xlabel = 'Regional gCAP';
input_ylabel = 'Regional tau';
input_title = 'braak 1';
[rho_b1,p_b1] = function_scatterplot(Braak1_gCAP_75(1:35),Braak1_tau_75(1:35),input_xlabel,input_ylabel,input_title);
subplot(152)
input_title = 'meta temporal';
[rho_tem,p_tem] = function_scatterplot(Meta_gCAP_75(1:35),Meta_tau_75(1:35), input_xlabel,input_ylabel,input_title);
subplot(153)
input_title = 'braak 3-4';
[rho_b34,p_b34] = function_scatterplot(Braak34_gCAP_75(1:35),Braak34_tau_75(1:35), input_xlabel,input_ylabel,input_title);
subplot(154)
input_title = 'braak 5';
[rho_b5,p_b5] = function_scatterplot(Braak5_gCAP_75(1:35),Braak5_tau_75(1:35), input_xlabel,input_ylabel,input_title);
subplot(155)
input_title = 'braak 6';
[rho_b6,p_b6] = function_scatterplot(Braak6_gCAP_75(1:35),Braak6_tau_75(1:35), input_xlabel,input_ylabel,input_title);


%%
% exportgraphics(gcf, '/nfs/data2/Yutong/AD/NBtau/Paper/Figures_Oct_modify/Figure2/aCSF_bar.png', 'Resolution', 300);
% Spearman's rho values
% Spearman's rho values
rho_values = [rho_b1, rho_tem, rho_b34, rho_b5, rho_b6];
bar_labels = {'Braak I', 'Temporal', 'Braak III-IV', 'Braak V', 'Braak VI'};

% Define color
pos_color = [0.271, 0.459, 0.706];  % Hex: #4575B4
gray_outline = [0.6 0.6 0.6];

% Create figure
figure; hold on;

% Bar width and positions
bw = 0.4;
x_pos = [0.8, 1.4, 2.0, 2.6, 3.2];  % Five bar positions

% Plot bars
for i = 1:5
    y = rho_values(i);

    if i <= 2  % Significant: filled bars
        bar(x_pos(i), y, bw, 'FaceColor', pos_color, 'EdgeColor', 'none');
    else  % Non-significant: outlined bars
        bar(x_pos(i), y, bw, 'FaceColor', 'none', ...
            'EdgeColor', pos_color, 'LineWidth', 1.8, 'LineStyle', '-');
    end
end

% Trend line
plot(x_pos, rho_values, '-o', ...
    'Color', pos_color, ...
    'LineWidth', 2, ...
    'MarkerFaceColor', pos_color, ...
    'MarkerEdgeColor', 'w', ...
    'MarkerSize', 8);

% Axes settings
set(gca, 'XTick', x_pos, 'XTickLabel', bar_labels, ...
    'FontSize', 12, 'LineWidth', 1.2);
xlim([0.5, 3.4]);  % Adjust range for 5 bars
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


%% MCI
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

    if i > 2 & i<5 % Significant: filled bars
        bar(x_pos(i), y, bw, 'FaceColor', pos_color, 'EdgeColor', 'none');
    else  % Non-significant: outlined bars
        bar(x_pos(i), y, bw, 'FaceColor', 'none', ...
            'EdgeColor', pos_color, 'LineWidth', 1.8, 'LineStyle', '-');
    end
end

% Trend line
plot(x_pos, rho_values, '-o', ...
    'Color', pos_color, ...
    'LineWidth', 2, ...
    'MarkerFaceColor', pos_color, ...
    'MarkerEdgeColor', 'w', ...
    'MarkerSize', 8);

% Axes settings
set(gca, 'XTick', x_pos, 'XTickLabel', bar_labels, ...
    'FontSize', 12, 'LineWidth', 1.2);
xlim([0.5, 3.4]);  % Adjust range for 5 bars
ylim([-0.5, 0]);
yticks(-0.4:0.2:0);
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
