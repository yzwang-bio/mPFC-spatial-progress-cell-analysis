function [principalDirections, meanTrajectories] = calculatePrincipalDirections(umapData, pathLabels, binNum,Plot)
% 计算每条路径平均流形的主要方向
%
% 输入:
%   umapData: N×3矩阵，UMAP坐标 [x, y, z]
%   pathLabels: N×1向量，路径标签 (如1,2,3,4)
%   binNum: N×1向量，bin编号 (如1-20)
%   Plot：是否画图显示结果
%
% 输出:
%   principalDirections: 结构数组，包含每条路径的主成分信息
%   meanTrajectories: 路径数×bin数×3矩阵，平均流形坐标

uniquePaths = unique(pathLabels);
numPaths = length(uniquePaths);
numBins = max(binNum);

meanTrajectories = zeros(numPaths, numBins, 3);
principalDirections = struct();
if Plot
    figure('Position', [100, 100, 1200, 800]);
end
for i = 1:numPaths
    % 提取当前路径的所有数据
    if iscell(pathLabels)
        pathId = uniquePaths{i};
        pathMask = strcmp(pathLabels,pathId);
    elseif isnumeric(pathLabels)
        pathId = uniquePaths(i);
        pathMask = pathLabels == pathId;
    else
        error('pathLabels必须是数组或cell')
    end
    pathData = umapData(pathMask, :);
    pathBins = binNum(pathMask);

    % 计算每个bin的平均坐标
    pathTrajectory = zeros(numBins, 3);
    for bin = 1:numBins
        binMask = pathBins == bin;
        if sum(binMask) > 0
            pathTrajectory(bin, :) = mean(pathData(binMask, :), 1);
        else
            pathTrajectory(bin, :) = NaN;
        end
    end
    meanTrajectories(i, :, :) = pathTrajectory;

    % 移除NaN值
    validBins = ~any(isnan(pathTrajectory), 2);
    trajectoryData = pathTrajectory(validBins, :);

    if size(trajectoryData, 1) < 3
        warning('路径的有效数据点不足');
        continue;
    end

    % 主成分分析
    [coeff, score, latent] = pca(trajectoryData);

    % 存储结果
    principalDirections(i).pathId = pathId;
    principalDirections(i).coefficients = coeff;
    principalDirections(i).explainedVariance = latent ./ sum(latent);
    principalDirections(i).meanTrajectory = trajectoryData;
    if Plot
        % 可视化
        subplot(2, 2, i);
        plot3(trajectoryData(:,1), trajectoryData(:,2), trajectoryData(:,3), ...
            'LineWidth', 3, 'Color', [0.2, 0.2, 0.8]);
        hold on;

        % 绘制主方向
        meanPoint = mean(trajectoryData, 1);
        for j = 1:3
            direction = coeff(:, j) * sqrt(latent(j)) * 2;
            quiver3(meanPoint(1), meanPoint(2), meanPoint(3), ...
                direction(1), direction(2), direction(3), ...
                'LineWidth', 2, 'Color', [0.8, 0.2, 0.2], ...
                'MaxHeadSize', 1);
        end
        if iscell(pathLabels)
            title(sprintf('路径 %s - 主方向 (EV1: %.1f%%)',pathId, principalDirections(i).explainedVariance(1)*100));
        elseif isnumeric(pathLabels)
            title(sprintf('路径 %d - 主方向 (EV1: %.1f%%)',pathId, principalDirections(i).explainedVariance(1)*100));
        end
        xlabel('UMAP1'); ylabel('UMAP2'); zlabel('UMAP3');
        grid on; axis equal;
    end
end
end