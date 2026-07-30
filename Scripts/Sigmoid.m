%%
% print(gcf, 'Figure1_sigmoid_nCSF.svg', '-dsvg');

x = linspace(-3, 3, 1000);

% Sigmoid parameters
k = 10;
y1 = 1 ./ (1 + exp(-k * (x - 0)));    % First sigmoid
y2 = 1 ./ (1 + exp(-k * (x - 0.3)));  % Second sigmoid (shifted) Normal shift 0.3

% Crop transition region
idx1 = y1 > 0.01 & y1 < 0.99;
idx2 = y2 > 0.01 & y2 < 0.99;
x1 = x(idx1); y1 = y1(idx1);
x2 = x(idx2); y2 = y2(idx2);

% Colors
% color1 = [0.271, 0.459, 0.706];  % Blue
% color1 = [0.843, 0.188, 0.153];
color1 = [0.902, 0.671, 0.008];  % Gold
% color1 = [16, 102, 56]/255;
color2 = [0, 0, 0];  
% Plot
figure;
plot(x1, y1, 'Color', color1, 'LineWidth', 10); hold on;
plot(x2, y2, 'Color', color2, 'LineWidth', 10);
set(gcf, 'Position', [100, 100, 800, 600]);

% Axis styling
ax = gca;
ax.Box = 'off';
ax.XColor = 'k';
ax.YColor = 'k';

% ✅ REMOVE tick labels
ax.XTickLabel = {};
ax.YTickLabel = {};

% ✅ REMOVE tick notches
ax.XAxis.TickLength = [0 0];
ax.YAxis.TickLength = [0 0];

% Keep axis lines on bottom/left
ax.XAxisLocation = 'bottom';
ax.YAxisLocation = 'left';
ax.TickDir = 'out';
ax.LineWidth = 2;

% Tight layout
axis tight;

% print(gcf, '/nfs/data2/Yutong/AD/NBtau/Paper/Figures/official_draft_1/Figure_1/tau_S.png', '-dpng', '-r300');



%% =========================================================================
%
%
%
% =========================================================================

% print(gcf, 'Figure3G', '-dsvg');

x = linspace(-3, 3, 1000);

% Sigmoid parameters
k = 3;
y1 = 1 ./ (1 + exp(-k * (x - 0)));      % First sigmoid
y2 = 1 ./ (1 + exp(-k * (x - 0.11)));    % Second sigmoid (closer shift)
y3 = 1 ./ (1 + exp(-k * (x - 1.5)));    % Third sigmoid

% Crop transition region
idx1 = y1 > 0.01 & y1 < 0.99;
idx2 = y2 > 0.01 & y2 < 0.99;
idx3 = y3 > 0.01 & y3 < 0.99;

x1 = x(idx1); y1 = y1(idx1);
x2 = x(idx2); y2 = y2(idx2);
x3 = x(idx3); y3 = y3(idx3);

% Colors
color1 = [0, 0, 0];                   % Black
color2_top = [0.843, 0.188, 0.153];   % Red
color2_bottom = [0.271, 0.459, 0.706]; % Blue
color3_top = [0.843, 0.188, 0.153];   % Red
color3_bottom = [0.271, 0.459, 0.706]; % Blue
color3 = [0.902, 0.671, 0.008];       % Gold

% Plot
figure;
hold on;

% y1 (Black)
plot(x1, y1, 'Color', color1, 'LineWidth', 10);
thr = 0.3;
% y2 (Green-Top and Blue-Bottom)
plot(x2(y2 >= thr), y2(y2 >= thr), 'Color', color2_top, 'LineWidth', 10); % Top half
plot(x2(y2 < thr), y2(y2 < thr), 'Color', color2_bottom, 'LineWidth', 10); % Bottom half

% y3 (Green-Top and Blue-Bottom)
plot(x3(y3 >= thr), y3(y3 >= thr), 'Color', color3_top, 'LineWidth', 10); % Top half
plot(x3(y3 < thr), y3(y3 < thr), 'Color', color3_bottom, 'LineWidth', 10); % Bottom half

% Axis styling
set(gcf, 'Position', [100, 100, 800, 600]);
ax = gca;
ax.Box = 'off';
ax.XColor = 'k';
ax.YColor = 'k';

% ✅ REMOVE tick labels
ax.XTickLabel = {};
ax.YTickLabel = {};

% ✅ REMOVE tick notches
ax.XAxis.TickLength = [0 0];
ax.YAxis.TickLength = [0 0];

% Keep axis lines on bottom/left
ax.XAxisLocation = 'bottom';
ax.YAxisLocation = 'left';
ax.TickDir = 'out';
ax.LineWidth = 2;

% Tight layout
axis tight;
hold off;
