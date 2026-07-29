function lighterColors = lighten_color(colors, factor)
% lighten_color: 将输入的颜色调整为更浅的颜色。
%
% 用法:
%   lighterColor = lighten_color(colors, factor)
%
% 输入参数:
%   colors (RGB 数组或十六进制字符串，或者一个包含RGB 数组或十六进制字符串的一维cell数组)
%                                      - 要调整的颜色。如果是 RGB 数组，应该是形如 [R, G, B] 的向量，
%                                      每个分量的取值范围为 0 到 1。如果是十六进制字符串，应该是形如 '#RRGGBB' 的格式。
%   factor (0 到 1 之间的数) - 调整颜色的因子。接近 0 表示颜色更浅，接近 1 表示颜色更深。
%
% 输出参数:
%   lighterColors (RGB 数组或包含RGB 数组的cell数组) - 调整后的颜色，以 RGB 形式返回。如果 colors 是
%   cell 数组，返回 cell 数组。
%
% 示例:
%   % 通过 RGB 数组调用 lighten_color 函数
%   colorRGB = [0.2, 0.4, 0.6];
%   lighterRGB = lighten_color(colorRGB, 0.5); % 调整为更浅的颜色
%
%   % 通过十六进制字符串调用 lighten_color 函数
%   colorHEX = '#8A2BE2'; % 紫色
%   lighterHEX = lighten_color(colorHEX, 0.3); % 调整为更浅的颜色
%
%  % 通过一个包含RGB 数组或十六进制字符串的一维cell数组调用 lighten_color 函数
%   colors={[141,46,78]./255,[102,163,130]./255,[196,148,100]./255,'#3f5eca','#88b4bd','#d6c85b'};
%   lighterColors = lighten_color(colors, 0.5); % 调整为更浅的颜色
%   scan_color(colors);scan_color(lighterColors);
%
%  
%   WYZ_2024.04.15
%   See also: scan_color, darken_color

if ~(isnumeric(factor) && factor>=0 && factor<=1)
    error('输入参数 factor 错误')
end
factor=1-factor;

j=~iscell(colors);
if j
    colors = {colors};
end

lighterColors=cell(1,numel(colors));
for i = 1:numel(colors)
    color = colors{i};

    if ischar(color) % 如果输入的颜色是十六进制字符串
        % 将十六进制颜色转换为 RGB 格式
        color = sscanf(color(2:end),'%2x%2x%2x',[1 3])/255;
    end

    if any(color>1)
        color=color/255;
    end
    
    % 从输入颜色中获取 RGB 分量
    red = color(1);
    green = color(2);
    blue = color(3);
    
    % 根据因子调整 RGB 分量值
    red = red + (1 - red) * factor;
    green = green + (1 - green) * factor;
    blue = blue + (1 - blue) * factor;
    
    % 将 RGB 分量限制在 0 到 1 之间
    red = min(max(red, 0), 1);
    green = min(max(green, 0), 1);
    blue = min(max(blue, 0), 1);
    
    % 组装新的颜色数组
    lighterColors{1,i} = [red, green, blue];
end

if j
    lighterColors = lighterColors{:};
end

end
