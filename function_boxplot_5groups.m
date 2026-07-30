function function_boxplot_5groups(group1, group2, group3, group4, group5, increment, textaboveLine, input_ylabel)

% Group 1: Data and Grouping Preparation
data = [group1; group2; group3; group4; group5];
groups = [ones(size(group1)); 2*ones(size(group2)); 3*ones(size(group3)); 4*ones(size(group4)); 5*ones(size(group5))];

% Group 2: Boxplot and Data Points Visualization
boxplot(data, groups, 'Labels', {'braak1', 'meta-tem', 'braak34', 'braak5', 'braak6'}, 'Whisker', 1.5);
hold on;
colors = ['r', 'g', 'b', 'm', 'c'];
for i = 1:5
    inds = find(groups == i);
    x = repmat(i, length(inds), 1) + (rand(length(inds), 1) - 0.5) * 0.1;
    y = data(inds);
    plot(x, y, '.', 'MarkerSize', 10, 'Color', colors(i));
end
ylim([min(data)*0.9 max(data)*1.2]); 

% Group 3: Statistical Testing
% [h12, p12] = ttest2(group1, group2);
% [h13, p13] = ttest2(group1, group3);
% [h14, p14] = ttest2(group1, group4);
% [h15, p15] = ttest2(group1, group5);
% [h23, p23] = ttest2(group2, group3);
% [h24, p24] = ttest2(group2, group4);
% [h25, p25] = ttest2(group2, group5);
% [h34, p34] = ttest2(group3, group4);
% [h35, p35] = ttest2(group3, group5);
% [h45, p45] = ttest2(group4, group5);
[h12, p12] = ttest2(group1, group2, 'Vartype', 'unequal');
[h13, p13] = ttest2(group1, group3, 'Vartype', 'unequal');
[h14, p14] = ttest2(group1, group4, 'Vartype', 'unequal');
[h15, p15] = ttest2(group1, group5, 'Vartype', 'unequal');
[h23, p23] = ttest2(group2, group3, 'Vartype', 'unequal');
[h24, p24] = ttest2(group2, group4, 'Vartype', 'unequal');
[h25, p25] = ttest2(group2, group5, 'Vartype', 'unequal');
[h34, p34] = ttest2(group3, group4, 'Vartype', 'unequal');
[h35, p35] = ttest2(group3, group5, 'Vartype', 'unequal');
[h45, p45] = ttest2(group4, group5, 'Vartype', 'unequal');
% Group 4: Significance Annotation
yMax = max(data);
pairs = [1,2; 1,3; 1,4; 1,5; 2,3; 2,4; 2,5; 3,4; 3,5; 4,5];
pValues = [p12, p13, p14, p15, p23, p24, p25, p34, p35, p45];

for i = 1:size(pairs, 1)
    % Drawing a line between the pairs
    xPos = pairs(i, :);
    yPos = [yMax, yMax] + i * increment;  % Increment y position for each line to avoid overlap
    line(xPos, yPos, 'Color', 'k', 'LineWidth', 1);
    % Adding p-value text above the line
    text(mean(xPos), yPos(1) + textaboveLine, sprintf('p=%.4f', pValues(i)), ...
         'HorizontalAlignment', 'center', 'FontSize', 12, 'FontWeight', 'bold');
end

% Final Touches
hold off;
ylabel(input_ylabel);

end
