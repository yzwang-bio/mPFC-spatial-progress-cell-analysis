function circlemaze_color_schedule
% save color combinations (RGB) used in circlemaze
%%
circlemaze_color_for_types={[0 0.4470 0.7410],...%dark blue
        [0.8500 0.3250 0.0980],...% dark orange
        [0.9290 0.6940 0.1250],...% dark yellow
        [0.4940 0.1840 0.5560],...% dark purple
        [0.4660 0.6740 0.1880],...% medium green
        [0.3010 0.7450 0.9330],...% light blue
        [0.6350 0.0780 0.1840],...% dark red
        [0.8275 0.2118 0.5098]};
        % [0.5294 0.5078 0.9804]
% scan_color(circlemaze_color_for_types)
assignin('base','circlemaze_color_for_types',circlemaze_color_for_types);
light_circlemaze_color_for_types=lighten_color(circlemaze_color_for_types,0.65);
assignin('base','light_circlemaze_color_for_types',light_circlemaze_color_for_types);
%%
circlemaze_color_for_direction={'#E9A18C','#8B8DE8'}; % scan_color(circlemaze_color_for_direction)
circlemaze_color_for_direction = cellfun(@(x) sscanf(x(2:end),'%2x%2x%2x',[1 3])/255,circlemaze_color_for_direction,'UniformOutput',false);
% scan_color(circlemaze_color_for_direction)
assignin('base','circlemaze_color_for_direction',circlemaze_color_for_direction);
light_circlemaze_color_for_direction=lighten_color(circlemaze_color_for_direction,0.65);
assignin('base','light_circlemaze_color_for_direction',light_circlemaze_color_for_direction);
color_AtoB=circlemaze_color_for_direction{1};color_BtoA=circlemaze_color_for_direction{2};
assignin('base','color_AtoB',color_AtoB);assignin('base','color_BtoA',color_BtoA);
%%
% circlemaze_color_for_path={[141,46,78]./255,[102,163,130]./255,[136,180,189]./255,[214,200,91]./255};
circlemaze_color_for_path={[141,46,78]./255,[156,208,107]./255,[31,167,255]./255,[214,200,91]./255};% scan_color(circlemaze_color_for_path)
assignin('base','circlemaze_color_for_path',circlemaze_color_for_path);
light_circlemaze_color_for_path=lighten_color(circlemaze_color_for_path,0.65);
assignin('base','light_circlemaze_color_for_path',light_circlemaze_color_for_path);
color_L=circlemaze_color_for_path{1};color_Z=circlemaze_color_for_path{2};color_X=circlemaze_color_for_path{3};color_S=circlemaze_color_for_path{4};
assignin('base','color_L',color_L);assignin('base','color_Z',color_Z);assignin('base','color_X',color_X);assignin('base','color_S',color_S);
%%
circlemaze_color_for_events={[11 48 142]./255,...
    [252,140,090]./255,...
    [255,223,146]./255,...
    [148,105,204]./255,...
    [144,190,224]./255,...
    [11 48 142]./255}; 
% circlemaze_color_for_events={[219,49,36]./255,...
%     [252,140,090]./255,...
%     [255,223,146]./255,...
%     [230,241,243]./255,...
%     [144,190,224]./255,...
%     [075,116,178]./255}; 
% scan_color(circlemaze_color_for_events)
assignin('base','circlemaze_color_for_events',circlemaze_color_for_events);
light_circlemaze_color_for_events=lighten_color(circlemaze_color_for_events,0.65);
assignin('base','light_circlemaze_color_for_events',light_circlemaze_color_for_events);

%%
circlemaze_color_for_phase={'#FFFF00',  % 黄色
    '#FFA500',  % 橙色
       '#FFC0CB',  % 粉红
    '#FF6347',  % 西瓜红
    '#7FFFD4',  % 碧绿
};
circlemaze_color_for_phase = cellfun(@(x) sscanf(x(2:end),'%2x%2x%2x',[1 3])/255,circlemaze_color_for_phase,'UniformOutput',false);
% scan_color(circlemaze_color_for_phase)
assignin('base','circlemaze_color_for_phase',circlemaze_color_for_phase);
light_circlemaze_color_for_phase=lighten_color(circlemaze_color_for_phase,0.65);
assignin('base','light_circlemaze_color_for_phase',light_circlemaze_color_for_phase);

%%
color_for_neurons={
    '#FF0000',  % 红色
    '#00FF00',  % 绿色
    '#0000FF',  % 蓝色
    '#FFFF00',  % 黄色
    '#00FFFF',  % 青色
    '#FF00FF',  % 品红
    '#FFA500',  % 橙色
    '#800080',  % 紫色
    '#808080',  % 灰色
    '#FFC0CB',  % 粉红
    '#FF6347',  % 西瓜红
    '#7FFFD4',  % 碧绿
    '#800000',  % 红棕色
    '#000080',  % 海军蓝
    '#4B0082',  % 靛蓝
    '#A0522D',  % 橡木色
    '#8B4513',  % 棕色
    '#556B2F'   % 橄榄绿
};
color_for_neurons = cellfun(@(x) sscanf(x(2:end),'%2x%2x%2x',[1 3])/255,color_for_neurons,'UniformOutput',false);
% scan_color(color_for_neurons)
assignin('base','color_for_neurons',color_for_neurons);
%% 
color_before='#004C5E';% 暗绿色
color_after='#FF8005';% 橙色
color_before = sscanf(color_before(2:end),'%2x%2x%2x',[1 3])/255;color_after = sscanf(color_after(2:end),'%2x%2x%2x',[1 3])/255;
% scan_color(color_before);
% scan_color(color_after)
assignin('base','color_before',color_before);
assignin('base','color_after',color_after);
light_color_before=lighten_color(color_before,0.65);
assignin('base','light_color_before',light_color_before);
light_color_after=lighten_color(color_after,0.65);
assignin('base','light_color_after',light_color_after);
%%
color_cno='#ae286a';
color_cno = sscanf(color_cno(2:end),'%2x%2x%2x',[1 3])/255;
color_saline=[105,105,105]./255;%lighten_color(color_cno,0.15);
assignin('base','color_cno',color_cno);
assignin('base','color_saline',color_saline);
light_color_cno=lighten_color(color_cno,0.65);
assignin('base','light_color_cno',light_color_cno);
light_color_saline=lighten_color(color_saline,0.65);
assignin('base','light_color_saline',light_color_saline);
%%
color_decode={[168,159,255]./255,[128,128,128]./255}; 
assignin('base','color_decode',color_decode);
%%
color_corr={[128,0,128]./255,...% coef. of neuron activities between 2 direction trials
    [128,128,128]./255,... % shuffled
    [0,0,128]./255}; % reverse bins
assignin('base','color_corr',color_corr);
light_color_corr=lighten_color(color_corr,0.65);
assignin('base','light_color_corr',light_color_corr);
%%
colors = [[235,235,235]./255;0.400000000000000, 0, 0.121568627450980];
Y_values = [-2, 0];
interp_Y = linspace(min(Y_values), max(Y_values), 256);
R_interp = interp1(Y_values, colors(:, 1), interp_Y, 'linear');G_interp = interp1(Y_values, colors(:, 2), interp_Y, 'linear');B_interp = interp1(Y_values, colors(:, 3), interp_Y, 'linear');% 对每个颜色通道进行插值
custom_colormap = [R_interp(:), G_interp(:), B_interp(:)];
assignin('base','custom_colormap',custom_colormap);

%%
colors = [[255,244,238]./255;0.400000000000000, 0, 0.121568627450980];
Y_values = [-2, 0];
interp_Y = linspace(min(Y_values), max(Y_values), 256);
R_interp = interp1(Y_values, colors(:, 1), interp_Y, 'linear');G_interp = interp1(Y_values, colors(:, 2), interp_Y, 'linear');B_interp = interp1(Y_values, colors(:, 3), interp_Y, 'linear');% 对每个颜色通道进行插值
custom_colormap2 = [R_interp(:), G_interp(:), B_interp(:)];
assignin('base','custom_colormap2',custom_colormap2);
%%
colors = [[225,255,255]./255;0.600000000000000, 0, 0.121568627450980];
Y_values = [-2, 0];
interp_Y = linspace(min(Y_values), max(Y_values), 256);
R_interp = interp1(Y_values, colors(:, 1), interp_Y, 'linear');G_interp = interp1(Y_values, colors(:, 2), interp_Y, 'linear');B_interp = interp1(Y_values, colors(:, 3), interp_Y, 'linear');% 对每个颜色通道进行插值
custom_colormap1 = [R_interp(:), G_interp(:), B_interp(:)];
assignin('base','custom_colormap1',custom_colormap1);
%%
colorStops = [
    1, 0, 0;    % 红色
    1, 0.5, 0;  % 橙色
    1, 1, 0;    % 黄色
    0, 1, 0;    % 绿色
    0, 1, 1;    % 青色
    0, 0, 1;    % 蓝色
    0.5, 0, 1;  % 紫色
    0,0,0     % 黑色
];
numColors = 20;
numSections = size(colorStops, 1) - 1; % 色段数量是色标点数量减1
numColors=numColors+numSections-1;
% 计算每个色段应该分配的颜色数量
sectionSizes = diff(round(linspace(0, numColors, numSections + 1)));
colors = zeros(numColors, 3);
currentIndex = 1;
for i = 1:numSections
    startColor = colorStops(i, :);
    endColor = colorStops(i + 1, :);
    
    % 为当前色段生成渐变颜色
    for j = 1:sectionSizes(i)
        t = (j - 1) / (sectionSizes(i) - 1);  % 插值因子
        colors(currentIndex, :) = (1 - t) * startColor + t * endColor;
        currentIndex = currentIndex + 1;
    end
end
% 确保最后一个颜色是最后一个色标点
colors(end, :) = colorStops(end, :);
% 转换为cell数组
color_for_bins = num2cell(colors, 2);
[~, uniqueIdx] = unique(cell2mat(color_for_bins), 'rows', 'stable');
color_for_bins = color_for_bins(uniqueIdx);
assignin('base','color_for_bins',color_for_bins);
%%
color_intra=[0,179,201]./255;
assignin('base','color_intra',color_intra);
color_inter=[255,218,106]./255;
assignin('base','color_inter',color_inter);
end
