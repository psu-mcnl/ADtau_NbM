function stats_table = function_boxplot_5groups_stats( ...
    group1, group2, group3, group4, group5, group_labels)
% FUNCTION_BOXPLOT_5GROUPS
% Performs all pairwise two-sided two-sample t-tests among five groups.
%
% P values are not adjusted for multiple comparisons.
%
% Example:
% stats_table = function_boxplot_5groups( ...
%     group1, group2, group3, group4, group5, ...
%     {'Braak I', 'Braak III', 'Braak IV', 'Braak V', 'Braak VI'});

group_data = {
    group1(:)
    group2(:)
    group3(:)
    group4(:)
    group5(:)
    };

if nargin < 6 || isempty(group_labels)
    group_labels = {
        'Group 1'
        'Group 2'
        'Group 3'
        'Group 4'
        'Group 5'
        };
end

group_labels = cellstr(group_labels);

if numel(group_labels) ~= 5
    error('group_labels must contain exactly five labels.');
end

group_1 = cell(10, 1);
group_2 = cell(10, 1);
t_value = zeros(10, 1);
degrees_freedom = zeros(10, 1);
p_value = zeros(10, 1);

row = 0;

for i = 1:5
    for j = i+1:5

        row = row + 1;

        [~, p, ~, stats] = ttest2( ...
            group_data{i}, group_data{j}, ...
            'Tail', 'both', ...
            'Vartype', 'equal');

        group_1{row} = group_labels{i};
        group_2{row} = group_labels{j};
        t_value(row) = stats.tstat;
        degrees_freedom(row) = stats.df;
        p_value(row) = p;
    end
end

stats_table = table( ...
    group_1, group_2, t_value, degrees_freedom, p_value, ...
    'VariableNames', ...
    {'Group1', 'Group2', 't', 'df', 'PValue'});

fprintf('\nPairwise two-sided two-sample t-tests\n');
fprintf('P values are not adjusted for multiple comparisons.\n\n');

for k = 1:height(stats_table)
    fprintf('%s vs. %s: t(%g) = %.4f, p = %.8g\n', ...
        stats_table.Group1{k}, ...
        stats_table.Group2{k}, ...
        stats_table.df(k), ...
        stats_table.t(k), ...
        stats_table.PValue(k));
end

end