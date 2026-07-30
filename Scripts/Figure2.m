clear
load('Figure2.mat')



%%
group1 = Braak1_gCAP_75;
group2 = Meta_gCAP_75;
group3 = Braak34_gCAP_75;
group4 = Braak5_gCAP_75;
group5 = Braak6_gCAP_75;
colors = [
    254, 237, 207;  % Light Mustard Yellow
    254, 212, 139;  % Soft Mustard Yellow
    253, 183, 62;   % Mustard Yellow
    231, 159, 49;   % Deep Mustard Yellow
    217, 139, 25    % Dark Mustard Yellow
] / 255;


% group1 = Braak1_tau_75;
% group2 = Meta_tau_75;
% group3 = Braak34_tau_75;
% group4 = Braak5_tau_75;
% group5 = Braak6_tau_75;
% colors = [
%     178, 216, 216;  % Light Teal Green
%     102, 178, 178;  % Soft Teal Green
%     0, 128, 128;    % Teal Green
%     0, 102, 102;    % Deep Teal Green
%     0, 76, 76       % Dark Teal Green
% ] / 255;

% function_boxplot_5groups(group1, group2, group3, group4, group5,0.2,0.1,'gCAP')
function_boxplot_5groups_stats( ...
    group1, group2, group3, group4, group5, ...
    {'Braak I', 'meta-tem', 'Braak III-IV', 'Braak V', 'Braak VI'});
%%

% print(gcf, 'Figure2B_tau.svg', '-dsvg');

% Sample data
group_data = {group1, group2, group3, group4, group5};

% Perform pairwise t-tests and store p-values
num_groups = length(group_data);
p_values = nan(num_groups);
for i = 1:num_groups
    for j = i+1:num_groups
        [~, p_values(i, j)] = ttest2(group_data{i}, group_data{j});
    end
end

% Define significance thresholds and corresponding symbols
sig_thresholds = [0.05, 0.01, 0.001];
sig_symbols = {'*', '**', '***'};

% Plot the data using daviolinplot or your preferred plotting function
% figure; hold on;
% Define figure position and size
figureWidth = 800;   % Width in pixels
figureHeight = 500;  % Height in pixels
screenSize = get(0, 'ScreenSize'); % Get screen size [left, bottom, width, height]

% Calculate position to center the figure on the screen
figureLeft = (screenSize(3) - figureWidth) / 2;
figureBottom = (screenSize(4) - figureHeight) / 2;

% Create figure with specified position and size
figure('Position', [figureLeft, figureBottom, figureWidth, figureHeight]);


daviolinplot(group_data, 'violin', 'half', 'colors', colors, 'box', 2, ...
             'scatter', 2, 'jitter', 1, 'scatteralpha', 1, 'scattercolors', 'same', 'scattersize',10, ...
             'outliers', 0, 'linkline', 1, ...
             'boxcolors', 'same', 'boxwidth', 3, 'boxalpha', 1,...
             'violinalpha',0.5,'violinwidth',1);

hold on;
% means = cellfun(@mean, group_data);
% plot(1:length(means), means, 'k-', 'LineWidth', 1.5,'Color',[253, 183, 62]/255);
medians = cellfun(@median, group_data);
plot(1:length(medians), medians, 'k-', 'LineWidth', 1.5,'Color',[0, 128, 128]/255);
% plot(1:length(medians), medians, 'k-', 'LineWidth', 1.5,'Color',[253, 183, 62]/255);
% Set x-axis labels
set(gca, 'XTick', 1:num_groups, 'XTickLabels', {'braak1', 'braak3', 'braak4', 'braak5', 'braak6'});
yticks(0:0.5:2.0);

ax = gca;  
ax.XAxis.LineWidth = 2;  
ax.YAxis.LineWidth = 2; 


% Remove x-axis numerical labels
set(gca, 'XTickLabel', []);
set(gca, 'YTickLabel', []);

%%
% print(gcf, 'Figure2B_gCAP.svg', '-dsvg');
group_data = {group1, group2, group3, group4, group5};

% Perform pairwise t-tests and store p-values
num_groups = length(group_data);
p_values = nan(num_groups);
for i = 1:num_groups
    for j = i+1:num_groups
        [~, p_values(i, j)] = ttest2(group_data{i}, group_data{j});
    end
end

% Define significance thresholds and corresponding symbols
sig_thresholds = [0.05, 0.01, 0.001];
sig_symbols = {'*', '**', '***'};

% Define figure position and size (keep unchanged)
figureWidth = 800;   % Width in pixels
figureHeight = 500;  % Height in pixels
screenSize = get(0, 'ScreenSize');
figureLeft = (screenSize(3) - figureWidth) / 2;
figureBottom = (screenSize(4) - figureHeight) / 2;

figure('Position', [figureLeft, figureBottom, figureWidth, figureHeight]);

% Plot violin plots (occupy more vertical space)
daviolinplot(group_data, 'violin', 'half', 'colors', colors, 'box', 2, ...
             'scatter', 2, 'jitter', 1, 'scatteralpha', 1, 'scattercolors', 'same', 'scattersize',10, ...
             'outliers', 0, 'linkline', 1, ...
             'boxcolors', 'same', 'boxwidth', 3, 'boxalpha', 1,...
             'violinalpha',0.5,'violinwidth',1);

hold on;

% Plot median line
medians = cellfun(@median, group_data);
plot(1:length(medians), medians, 'k-', 'LineWidth', 1.5, 'Color', [253, 183, 62]/255)

% Set x-axis labels
set(gca, 'XTick', 1:num_groups, 'XTickLabels', {'braak1', 'braak3', 'braak4', 'braak5', 'braak6'});
yticks(0:0.5:2.0);

ax = gca;  
ax.XAxis.LineWidth = 2;  
ax.YAxis.LineWidth = 2; 

% Compute data bounds
% y_max = max(cellfun(@max, group_data));
% y_min = min(cellfun(@min, group_data));
% y_range = y_max - y_min;
% 
% % Layout config: set a small gap above violins
% top_margin_ratio = 0.08;
% annotation_space_ratio = 0.14;  % top 14% for all annotation lines
% 
% % Compute annotation heights (compact)
% num_comparisons = num_groups * (num_groups - 1) / 2;
% y_annotation_start = y_max + y_range * 0.01;
% y_annotation_end = y_max + y_range * annotation_space_ratio;
% y_positions = linspace(y_annotation_start, y_annotation_end, num_comparisons);
% 
% % Set y-limits so annotations go up to the top
% ylim([y_min - 0.05 * y_range, y_max + y_range * (annotation_space_ratio + top_margin_ratio)]);

% Adjust plot box to use more vertical space
ax = gca;
ax.Position = [0.1, 0.15, 0.85, 0.85];  % [left, bottom, width, height]

% Remove axis labels (optional)
set(gca, 'XTickLabel', []);
set(gca, 'YTickLabel', []);

% % Add significance annotations (same logic)
% comparison_idx = 1;
% for i = 1:num_groups
%     for j = i+1:num_groups
%         p_val = p_values(i, j);
%         if ~isnan(p_val)
%             sig_symbol = '';
%             for k = 1:length(sig_thresholds)
%                 if p_val < sig_thresholds(k)
%                     sig_symbol = sig_symbols{k};
%                 end
%             end
%             if ~isempty(sig_symbol)
%                 x = [i, j];
%                 y = y_positions(comparison_idx);
%                 plot(x, [y, y], '-k', 'LineWidth', 1.5);
%                 text(mean(x), y + 0.01 * y_range, sig_symbol, ...
%                     'HorizontalAlignment', 'center', 'FontSize', 12, 'FontWeight', 'bold');
%                 comparison_idx = comparison_idx + 1;
%             end
%         end
%     end
% end



%%
% -------------------- MCI 1:35
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
% -------------------- CuaCSF 35:52
subplot(151)
input_xlabel = 'Regional gCAP';
input_ylabel = 'Regional tau';
input_title = 'braak 1';
[rho_b1,p_b1] = function_scatterplot(Braak1_gCAP_75(36:52),Braak1_tau_75(36:52),input_xlabel,input_ylabel,input_title);
subplot(152)
input_title = 'meta temporal';
[rho_tem,p_tem] = function_scatterplot(Meta_gCAP_75(36:52),Meta_tau_75(36:52), input_xlabel,input_ylabel,input_title);
subplot(153)
input_title = 'braak 3-4';
[rho_b34,p_b34] = function_scatterplot(Braak34_gCAP_75(36:52),Braak34_tau_75(36:52), input_xlabel,input_ylabel,input_title);
subplot(154)
input_title = 'braak 5';
[rho_b5,p_b5] = function_scatterplot(Braak5_gCAP_75(36:52),Braak5_tau_75(36:52), input_xlabel,input_ylabel,input_title);
subplot(155)
input_title = 'braak 6';
[rho_b6,p_b6] = function_scatterplot(Braak6_gCAP_75(36:52),Braak6_tau_75(36:52), input_xlabel,input_ylabel,input_title);

%%

% 
% data1 = (load gCAP here)
% data2 = (load tau here)     

% Color: Red - #D73027
% Color: Blue - #4575B4
pos_color = [0.271, 0.459, 0.706];
ci_color = pos_color + (1 - pos_color) * 0.8;  % lighter version for CI
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
yticks(0.9:0.1:2.6);
xticks(0.3:0.3:1.6);


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
% 
% % Remove y-axis numerical labels
% set(gca, 'YTickLabel', []);
rho, pval
















