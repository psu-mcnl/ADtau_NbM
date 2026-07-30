clear all

load('/nfs/data2/Yutong/AD/NBtau/scripts/Main_gBOLD_NB_GM/mats/MCI_gBOLD_stdThreshold_DKTMask.mat')

gBOLD = gBOLD_overlap{15};


[pks,w] = findpeaks(gBOLD,'MinPeakHeight',0.2,'MinPeakDistance',4); 
rbold = rbold_parcel{15};
peaks_pattern = rbold(w,:);
peaks_pattern_mean = mean(peaks_pattern,1);
gCAP = peaks_pattern_mean;


gCAP_4 = peaks_pattern(4,:);
gCAP_8 = peaks_pattern(8,:);
gCAP_19 = peaks_pattern(19,:);
gCAP_5 = peaks_pattern(5,:);
gCAP_18 = peaks_pattern(18,:);
%%
data = double(gCAP_18)';
data(data==0) = nan;
filename = 'gCAP_18';
output_path = '/nfs/data2/Yutong/AD/NBtau/Paper/Figures/official_draft_1/Scripts';
function_surfaceplot_parcel(data, filename, output_path)


%% ========================================================================
%
%
% =========================================================================
% clear
TR = 3; 
dataRange = 40:160;
timeVector = ((dataRange(1)-1) * TR : TR : (dataRange(end)-1) * TR)'; 
signalValues = gBOLD(dataRange);  % Assuming gBOLD contains your BOLD signal data

figure;
hold on;  % Keep the plot for multiple plotting commands
set(gcf, 'Position', [100, 100, 1500, 300]);  % Width of 1200 pixels and height of 300 pixels
% Plot each segment and color it based on the signal value relative to the threshold
for i = 1:length(signalValues) - 1
    startValue = signalValues(i);
    endValue = signalValues(i+1);
    startColor = 'k'; % Default color black
    endColor = 'k'; % Default color black

    if startValue > 0.2
        startColor = 'r'; % Change to red if above 0.2
    end
    if endValue > 0.2
        endColor = 'r'; % Change to red if above 0.2
    end

    % Plot segment from current point to next point using interpolated color
    % If the colors are the same, just plot normally
    if startColor == endColor
        plot(timeVector(i:i+1), signalValues(i:i+1), 'Color', startColor, 'LineWidth', 3);
    else
        % If the colors differ, find the exact crossing point (linear interpolation)
        tCross = 0.2; % Threshold value
        xCross = (tCross - startValue) / (endValue - startValue) + i;
        timeCross = timeVector(1) + (xCross - 1) * TR; % Interpolated time at threshold crossing
        
        % Plot two segments in different colors
        plot([timeVector(i), timeCross], [startValue, tCross], 'Color', startColor, 'LineWidth', 3);
        plot([timeCross, timeVector(i+1)], [tCross, endValue], 'Color', endColor, 'LineWidth', 3);
    end
end

% Highlight peaks that are significant (above threshold)
[peakValues, peakIndices] = findpeaks(signalValues);
for i = 1:length(peakValues)
    if peakValues(i) > 0.2
        plot(timeVector(peakIndices(i)), peakValues(i), 'ro', 'MarkerFaceColor', 'r');
    end
end

hold off;
yticks(-1:1:1); 
xticks(0:100:400);  
ax = gca; 
ax.XAxis.FontSize = 15; 
ax.YAxis.FontSize = 15; 
ax.XAxis.FontWeight = 'bold';  
ax.YAxis.FontWeight = 'bold'; 
ax.XAxis.LineWidth = 2;  
ax.YAxis.LineWidth = 2; 
ylim([-1 1]);
xt = get(gca, 'XTick');  % Get current ticks
set(gca, 'XTick', xt, 'XTickLabel', xt - 100);  % Shift to start from 0

print(gcf, 'gBOLD_ex', '-dpng', '-r300');










