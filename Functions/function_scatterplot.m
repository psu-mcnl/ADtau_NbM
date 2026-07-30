% function function_scatterplot(data1, data2, input_xlabel, input_ylabel, input_title)
% 
% [r, p] = corr(data1, data2, 'type', 'Pearson');
% [rho, p2] = corr(data1, data2, 'type', 'Spearman');
% scatter(data1, data2, 40, 'filled', 'MarkerFaceColor', [0.797, 0.518, 0.259]);
% hold on;
% h = lsline;
% h.Color = [0.106, 0.165, 0.208];
% h.LineWidth = 1;
% xText = max(data1) - 0.05 * range(data1); % 5% padding from the right
% yText = max(data2) - 0.05 * range(data2); % 5% padding from the top
% 
% text(xText, yText, sprintf('r = %.3f, p = %.3f \n rho = %.3f, p = %.3f', ...
%     r, p, rho, p2), ...
%     'HorizontalAlignment', 'right', 'VerticalAlignment', 'top', ...
%     'FontSize', 16, 'FontWeight', 'bold');
% 
% xlabel(input_xlabel, 'FontSize', 12);
% ylabel(input_ylabel, 'FontSize', 12);
% 
% % Only set the title if input_title is provided
% if nargin >= 5 && ~isempty(input_title)
%     title(input_title, 'FontSize', 12);
% end
% 
% ax = gca;
% ax.FontSize = 20;
% 
% hold off;
% 
% end
%% ========================================================================
%
%       fix location
% =========================================================================
% function function_scatterplot(data1, data2, input_xlabel, input_ylabel, input_title)
% 
% [r, p] = corr(data1, data2, 'type', 'Pearson');
% [rho, p2] = corr(data1, data2, 'type', 'Spearman');
% scatter(data1, data2, 40, 'filled', 'MarkerFaceColor', [0.797, 0.518, 0.259]);
% hold on;
% h = lsline;
% h.Color = [0.106, 0.165, 0.208];
% h.LineWidth = 1;
% 
% % Set the text location to the upper right corner of the axes
% ax = gca;
% xText = ax.XLim(2) - 0.02 * range(ax.XLim); % 2% padding from the right
% yText = ax.YLim(2) - 0.02 * range(ax.YLim); % 2% padding from the top
% 
% text(xText, yText, sprintf('r = %.3f, p = %.3f \n rho = %.3f, p = %.3f', ...
%     r, p, rho, p2), ...
%     'HorizontalAlignment', 'right', 'VerticalAlignment', 'top', ...
%     'FontSize', 16, 'FontWeight', 'bold');
% 
% xlabel(input_xlabel, 'FontSize', 12);
% ylabel(input_ylabel, 'FontSize', 12);
% 
% % Only set the title if input_title is provided
% if nargin >= 5 && ~isempty(input_title)
%     title(input_title, 'FontSize', 12);
% end
% 
% ax.FontSize = 20;
% 
% hold off;
% 
% end
%% ========================================================================
%
%       no overlap
% =========================================================================



function [rho, p2] = function_scatterplot(data1, data2, input_xlabel, input_ylabel, input_title)

[r, p] = corr(data1, data2, 'type', 'Pearson');
[rho, p2] = corr(data1, data2, 'type', 'Spearman');
% scatter(data1, data2, 60, 'filled', 'MarkerFaceColor', [0.797, 0.518, 0.259]);
% hold on;
% h = lsline;
% h.Color = [0.106, 0.165, 0.208];
% h.LineWidth = 1;

% ---nCSF ----
% scatter(data1, data2, 60, 'filled', 'MarkerFaceColor', '#376439');
% hold on;
% h = lsline;
% h.Color = '#669877';
% h.LineWidth = 1;

% ---aCSF ----
% scatter(data1, data2, 60, 'filled', 'MarkerFaceColor', ' #313772');
% hold on;
% h = lsline;
% h.Color = '#326db6';
% h.LineWidth = 1;

% ---MCI ----
scatter(data1, data2, 60, 'filled', 'MarkerFaceColor', ' #b7282e');
hold on;
h = lsline;
h.Color = '#d16d5b';
h.LineWidth = 1;

% Set the text location to the upper right corner of the axes
ax = gca;
xText = ax.XLim(2) - 0.02 * range(ax.XLim); % 2% padding from the right
yText = ax.YLim(2) - 0.02 * range(ax.YLim); % 2% padding from the top

% Check if text overlaps and adjust
dataMaxY = max(data2);
if dataMaxY > (ax.YLim(2) - 0.2 * range(ax.YLim)) % Less than 10% padding
    ax.YLim(2) = dataMaxY + 0.3 * range(ax.YLim); % Increase upper limit
    yText = ax.YLim(2) - 0.02 * range(ax.YLim); % Recalculate text position
end

text(xText, yText, sprintf('r = %.3f, p = %.3f \n rho = %.3f, p = %.3f', ...
    r, p, rho, p2), ...
    'HorizontalAlignment', 'right', 'VerticalAlignment', 'top', ...
    'FontSize', 16, 'FontWeight', 'bold');

xlabel(input_xlabel, 'FontSize', 12);
ylabel(input_ylabel, 'FontSize', 12);

% Only set the title if input_title is provided
if nargin >= 5 && ~isempty(input_title)
    title(input_title, 'FontSize', 12);
end

ax.FontSize = 20;

hold off
