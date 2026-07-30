function  [correlation,pvalue] = function_brainplot_corr(variable_1, variable_2, input_title,corrType)

niimask = amri_file_loadnii('/nfs/data2/Yutong/Templates/MNI152_T1_3mm_brain.nii');
niimask = niimask.img;
mask = logical(niimask); 
dkt_nii = amri_file_loadnii('/nfs/data2/Baizhou/wholebrain_parcel_3mm.nii.gz');
dkt_nii2 = dkt_nii;
dkt_epi = dkt_nii.img;
dkt = mapNto1(dkt_epi,mask);
dkt_2d = mosaic(dkt_epi,6,6)';
dkt_2d(dkt_2d < 1000) = 0;
load('/nfs/data2/Yutong/AD/NBtau/mats/68parcel_id.mat');
parcel68_id = sorted_Tau_parcel_id;

% for parcel = 1:68
%     tmp1 = variable_1(:,parcel);
%     tmp2 = variable_2(:,parcel);
%     [r,p] = corr(tmp1,tmp2,'type',corrType);
%     correlation(parcel) = r;
%     pvalue(parcel) = p;
% end

    correlation = zeros(68, 1);
    pvalue = zeros(68, 1);
    for parcel = 1:68
        tmp1 = variable_1(:, parcel);  % Data for the current parcel
        
        % Check if variable_2 is 1D (37x1) or 2D (37x68)
        if isvector(variable_2)
            tmp2 = variable_2;  % Use the entire vector for correlation
        else
            tmp2 = variable_2(:, parcel);  % Use the corresponding column
        end
        
        % Calculate correlation and p-value
        [r, p] = corr(tmp1, tmp2, 'type', corrType);
        correlation(parcel) = r;
        pvalue(parcel) = p;
    end

data1 = correlation;
data2 = pvalue;
brain_plot = dkt;
brain_plot(brain_plot < 1000) = 0;
for parcel = 1:68
    id = parcel68_id(parcel);
    value1 = data1(parcel);
    value2 = data2(parcel);
    if value2 <= 0.05
%         id,value1
        regions{parcel} = [id,value1];
    end
end
% non_zero_regions = regions(~cellfun('isempty', regions));
% non_zero_regions



data_plot = correlation;
brain_plot = dkt;
brain_plot(brain_plot < 1000) = 0;
for parcel = 1:68
    id = parcel68_id(parcel);
    value = data_plot(parcel);
    brain_plot(brain_plot == id) = value;
end
brain_plot(brain_plot == 0) = NaN;



figure(1)
rst_mask = mosaic(niimask,6,6)';
rst_2d = brain_plot;
rst = mosaic(map1toN(rst_2d,mask),6,6)';
rst(isnan(rst)) = 0;
rst(~rst) = nan;
rst = flipud(rst);
rst_mask = flipud(rst_mask);
rst = rst(1:292,:);
rst_mask = rst_mask(1:292,:);
[hf,hb] = imoverlay(rst_mask,rst,[],[min(rst_mask(:)),max(rst_mask(:))+2000],'jet',1);
cb = colorbar;
cb.Location = 'eastoutside'; % Places colorbar to the right of the axes
cb.Position = [0.85 0.1 0.03 0.8]; % You may need to tweak these values
set(gca, 'Position', [0.05 0.1 0.75 0.8]); % Adjust [left bottom width height]
set(gcf, 'Position', [100, 100, 800, 600]); % Set figure position and size: [left, bottom, width, height]

colormap jet;
caxis([-0.5,0.5]);
title(['Spearman rho: ', input_title])

data_plot = pvalue;
brain_plot = dkt;
brain_plot(brain_plot < 1000) = 0;
for parcel = 1:68
    id = parcel68_id(parcel);
    value = data_plot(parcel);
    brain_plot(brain_plot == id) = value;
end
brain_plot(brain_plot == 0) = NaN;

figure(2)
rst_mask = mosaic(niimask,6,6)';
rst_2d = brain_plot;
rst = mosaic(map1toN(rst_2d,mask),6,6)';
rst(isnan(rst)) = 0;
rst(~rst) = nan;
rst = flipud(rst);
rst_mask = flipud(rst_mask);
rst = rst(1:292,:);
rst_mask = rst_mask(1:292,:);
[hf,hb] = imoverlay(rst_mask,rst,[],[min(rst_mask(:)),max(rst_mask(:))+2000],'jet',1);
cb = colorbar;
cb.Location = 'eastoutside'; % Places colorbar to the right of the axes
cb.Position = [0.85 0.1 0.03 0.8]; % You may need to tweak these values
set(gca, 'Position', [0.05 0.1 0.75 0.8]); % Adjust [left bottom width height]
set(gcf, 'Position', [100, 100, 800, 600]); % Set figure position and size: [left, bottom, width, height]
colormap hot;
caxis([0,0.1]);
title(['P-value: ', input_title])