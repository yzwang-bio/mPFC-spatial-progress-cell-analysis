%% Code for Fig. 3a, b
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
circlemaze_color_schedule
figures_visibility='on';
path={'Long curve','Zigzag','Direct','Short curve'};
NumDimensions = 3;
interp_ornot=1;

%% Colormaps for different paths
custom_colormaps={CMap('parula'),CMap('inferno'),CMap('cividis'),CMap('viridis'),CMap('magma'),CMap('plasma'),CMap('hot')};custom_colormaps=cellfun(@(x) flipud(x),custom_colormaps,'UniformOutput',false);

%% Example animal: YZ06
animal_ID='YZ06';

%% Rightward trials
load('Fig3/umap_rightward.mat')

% Plot-1 Neuronal activity from an example animal (YZ06) binned into spatial-progress bins for trials of different paths and visualized on a neural manifold (UMAP)
figure('Position',[300,100,340,340],'Visible',figures_visibility,'Name',[animal_ID,' neural manifold']);
s=cell(numBins,1);
for i = 1:numBins
    clusterPoints = Y(labels_Bin == categories_Bin(i), :);
    if NumDimensions==2
        s{i}=scatter(clusterPoints(:, 1), clusterPoints(:, 2), 6, color_for_bins{i}, 'filled');
        xlabel('Dim 1 (a.u.)');ylabel('Dim 2 (a.u.)');
    elseif NumDimensions==3
        s{i}=scatter3(clusterPoints(:, 1), clusterPoints(:, 2), clusterPoints(:, 3), 6, color_for_bins{i}, 'filled');
        xlabel('Dim 1 (a.u.)');ylabel('Dim 2 (a.u.)');zlabel('Dim 3 (a.u.)')
    end
    hold on;
end
hold off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
lgd = legend(num2cell(string(categories_Bin)),'Orientation','horizontal','NumColumns',5);set(lgd,'Position',[0.0772232151939211 0.893392857142858 0.808928577267394 0.0668508005358255]);lgd.FontSize=8;
legend('boxoff')
drawnow
grid on
axis tight
view(az,el);
xlim(xLim);ylim(yLim);zlim(zLim);

% Plot-2 Neural trajectories on the manifolds, grouped by paths and color-coded by both path type and spatial progress
figure('Position',[300,100,340,340],'Visible',figures_visibility,'Name',[animal_ID,' neural trajectories']);
% Step-1 draw points
% for j = 1:numPaths
%     Cmap=custom_colormaps{strcmp(path,categories_Path{j})}; % Colormap for this path
%     for i=1:numBins
%         clusterPoints = Y(strcmp(labels_Path,categories_Path{j}) & labels_Bin == categories_Bin(i), :);
%         if NumDimensions==2
%             scatter(clusterPoints(:, 1), clusterPoints(:, 2), 6, Cmap(round(256/numBins*i),:), 'filled');
%             xlabel('Dim 1(a.u.)');ylabel('Dim 2(a.u.)');
%         elseif NumDimensions==3
%             scatter3(clusterPoints(:, 1), clusterPoints(:, 2), clusterPoints(:, 3), 6, Cmap(round(256/numBins*i),:), 'filled');
%              xlabel('Dim 1 (a.u.)');ylabel('Dim 2 (a.u.)');zlabel('Dim 3 (a.u.)')
%         end
%         hold on;
%     end
% end
% Step-2 Draw the neural trajectories for individual trials (different paths have different colormaps)
alpha=0.3;
manifold_curves=cell(numPaths,1);
for j = 1:numPaths
    Cmap=custom_colormaps{strcmp(path,categories_Path{j})}; % Colormap for this path
    for c = 1:numTrials
        clusterPoints = Y(strcmp(labels_Path,categories_Path{j}) & strcmp(labels_TrialIdx,categories_TrialIdx{c}), :); % Points for this trial
        if isempty(clusterPoints);continue;end
        if size(clusterPoints,1)~=numBins;error('When specifying a single trial, the number of points should be the same as the number of bins.');end
        if interp_ornot
            t = [0; cumsum(sqrt(sum(diff(clusterPoints).^2, 2)))];
            t = t / t(end);
            num_interp = 500;
            t_interp = linspace(0, 1, num_interp);
            x_interp = spline(t, clusterPoints(:, 1), t_interp);
            y_interp = spline(t, clusterPoints(:, 2), t_interp);
            z_interp = spline(t, clusterPoints(:, 3), t_interp);
            points_interp=[x_interp(:),y_interp(:),z_interp(:)];
                                points_interp = smoothdata(points_interp,1,'movmean', 50);
                    % points_interp = sgolayFilter3D(points_interp, 2, 161);
        else
            points_interp=clusterPoints;
        end
        original_indices = zeros(size(clusterPoints, 1), 1);
        for i = 1:size(clusterPoints, 1)
            distances = sqrt(sum((points_interp - clusterPoints(i, :)).^2, 2));
            [~, min_idx] = min(distances);
            original_indices(i) = min_idx;
        end

        result = original_indices;
        for i = 2:size(original_indices,1)-1
            if result(i) > result(i+1);result(i) = (result(i-1) + result(i+1)) / 2;end
        end
        original_indices=round(result);
        for i=1:numBins-1
            plot3(points_interp(original_indices(i):original_indices(i+1),1), points_interp(original_indices(i):original_indices(i+1),2), points_interp(original_indices(i):original_indices(i+1),3),'Color',[Cmap(round(256/numBins*i),:),alpha], 'LineWidth', 0.5,'Clipping','off');
            hold on;
        end
        manifold_curves{j}{end+1}=points_interp;
    end
end
% Step-3 Calculate and plot the mean neural trajectory for each path (averaged across all trajectories in that path)
umapData=Y;pathLabels=labels_Path;binNum=labels_Bin;Plot=0;
[principalDirections, meanTrajectories] = calculatePrincipalDirections(umapData, pathLabels, categories_Path, binNum, Plot);
alpha=0.8;
for j = 1:numPaths
    Cmap=custom_colormaps{strcmp(path,categories_Path{j})}; % Colormap for this path
    meanTrajectory=squeeze(meanTrajectories(j,:,:));
    if interp_ornot
        t = [0; cumsum(sqrt(sum(diff(meanTrajectory).^2, 2)))];
        t = t / t(end);
        num_interp = 1000;
        t_interp = linspace(0, 1, num_interp);
        x_interp = spline(t, meanTrajectory(:, 1), t_interp);
        y_interp = spline(t, meanTrajectory(:, 2), t_interp);
        z_interp = spline(t, meanTrajectory(:, 3), t_interp);
        meanTrajectory_interp=[x_interp(:),y_interp(:),z_interp(:)];
    else
        meanTrajectory_interp=meanTrajectory;
    end
    original_indices = zeros(size(meanTrajectory, 1), 1);
    for i = 1:size(meanTrajectory, 1)
        distances = sqrt(sum((meanTrajectory_interp - meanTrajectory(i, :)).^2, 2));
        [~, min_idx] = min(distances);
        original_indices(i) = min_idx;
    end
    if original_indices(1)~=1 || original_indices(end)~=size(meanTrajectory_interp,1)
        original_indices(1)=1;original_indices(end)=size(meanTrajectory_interp,1);
    end

    scatter3(meanTrajectory_interp(1, 1), meanTrajectory_interp(1, 2), meanTrajectory_interp(1, 3),15, Cmap(1,:), 'filled');
    scatter3(meanTrajectory_interp(end, 1), meanTrajectory_interp(end, 2), meanTrajectory_interp(end, 3),15, Cmap(end,:), 'filled');
    for i=1:numBins-1
        p=plot3(meanTrajectory_interp(original_indices(i):original_indices(i+1),1), meanTrajectory_interp(original_indices(i):original_indices(i+1),2), meanTrajectory_interp(original_indices(i):original_indices(i+1),3),'Color',[Cmap(round(256/numBins*i),:),alpha], 'LineWidth',2,'Clipping','off');
        hold on;
    end
end
hold off;grid on
xlabel('Dim 1 (a.u.)');ylabel('Dim 2 (a.u.)');zlabel('Dim 3 (a.u.)')
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
drawnow
axis tight
view(az,el);
xlim(xLim);ylim(yLim);zlim(zLim);

%% Leftward trials
load('Fig3/umap_leftward.mat')

% Plot-1 Neuronal activity from an example animal (YZ06) binned into spatial-progress bins for trials of different paths and visualized on a neural manifold (UMAP)
figure('Position',[300,100,340,340],'Visible',figures_visibility,'Name',[animal_ID,' neural trajectories']);
s=cell(numBins,1);
for i = 1:numBins
    clusterPoints = Y(labels_Bin == categories_Bin(i), :);
    if NumDimensions==2
        s{i}=scatter(clusterPoints(:, 1), clusterPoints(:, 2), 6, color_for_bins{i}, 'filled');
        xlabel('Dim 1 (a.u.)');ylabel('Dim 2 (a.u.)');
    elseif NumDimensions==3
        s{i}=scatter3(clusterPoints(:, 1), clusterPoints(:, 2), clusterPoints(:, 3), 6, color_for_bins{i}, 'filled');
        xlabel('Dim 1 (a.u.)');ylabel('Dim 2 (a.u.)');zlabel('Dim 3 (a.u.)')
    end
    hold on;
end
hold off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
lgd = legend(num2cell(string(categories_Bin)),'Orientation','horizontal','NumColumns',5);set(lgd,'Position',[0.0772232151939211 0.893392857142858 0.808928577267394 0.0668508005358255]);lgd.FontSize=8;
legend('boxoff')
drawnow
grid on
axis tight
view(az,el);
xlim(xLim);ylim(yLim);zlim(zLim);

% Plot-2 Neural trajectories on the manifolds, grouped by paths and color-coded by both path type and spatial progress
figure('Position',[300,100,340,340],'Visible',figures_visibility,'Name',animal_ID);
% Step-1 draw points
% for j = 1:numPaths
%     Cmap=custom_colormaps{strcmp(path,categories_Path{j})}; % Colormap for this path
%     for i=1:numBins
%         clusterPoints = Y(strcmp(labels_Path,categories_Path{j}) & labels_Bin == categories_Bin(i), :);
%         if NumDimensions==2
%             scatter(clusterPoints(:, 1), clusterPoints(:, 2), 6, Cmap(round(256/numBins*i),:), 'filled');
%             xlabel('Dim 1(a.u.)');ylabel('Dim 2(a.u.)');
%         elseif NumDimensions==3
%             scatter3(clusterPoints(:, 1), clusterPoints(:, 2), clusterPoints(:, 3), 6, Cmap(round(256/numBins*i),:), 'filled');
%              xlabel('Dim 1 (a.u.)');ylabel('Dim 2 (a.u.)');zlabel('Dim 3 (a.u.)')
%         end
%         hold on;
%     end
% end
% Step-2 Draw the neural trajectories for individual trials (different paths have different colormaps)
alpha=0.3;
manifold_curves=cell(numPaths,1);
for j = 1:numPaths
    Cmap=custom_colormaps{strcmp(path,categories_Path{j})}; % Colormap for this path
    for c = 1:numTrials
        clusterPoints = Y(strcmp(labels_Path,categories_Path{j}) & strcmp(labels_TrialIdx,categories_TrialIdx{c}), :); % Points for this trial
        if isempty(clusterPoints);continue;end
        if size(clusterPoints,1)~=numBins;error('When specifying one single trial, the number of points should be the same as the number of bins.');end
        if interp_ornot
            t = [0; cumsum(sqrt(sum(diff(clusterPoints).^2, 2)))];
            t = t / t(end);
            num_interp = 500;
            t_interp = linspace(0, 1, num_interp);
            x_interp = spline(t, clusterPoints(:, 1), t_interp);
            y_interp = spline(t, clusterPoints(:, 2), t_interp);
            z_interp = spline(t, clusterPoints(:, 3), t_interp);
            points_interp=[x_interp(:),y_interp(:),z_interp(:)];
                                points_interp = smoothdata(points_interp,1,'movmean', 50);
                    % points_interp = sgolayFilter3D(points_interp, 2, 161);
        else
            points_interp=clusterPoints;
        end
        original_indices = zeros(size(clusterPoints, 1), 1);
        for i = 1:size(clusterPoints, 1)
            distances = sqrt(sum((points_interp - clusterPoints(i, :)).^2, 2));
            [~, min_idx] = min(distances);
            original_indices(i) = min_idx;
        end

        result = original_indices;
        for i = 2:size(original_indices,1)-1
            if result(i) > result(i+1);result(i) = (result(i-1) + result(i+1)) / 2;end
        end
        original_indices=round(result);
        for i=1:numBins-1
            plot3(points_interp(original_indices(i):original_indices(i+1),1), points_interp(original_indices(i):original_indices(i+1),2), points_interp(original_indices(i):original_indices(i+1),3),'Color',[Cmap(round(256/numBins*i),:),alpha], 'LineWidth', 0.5,'Clipping','off');
            hold on;
        end
        manifold_curves{j}{end+1}=points_interp;
    end
end
% Step-3 Calculate and plot the mean neural trajectory for each path (averaged across all trajectories in that path)
umapData=Y;pathLabels=labels_Path;binNum=labels_Bin;Plot=0;
[principalDirections, meanTrajectories] = calculatePrincipalDirections(umapData, pathLabels, categories_Path, binNum, Plot);
alpha=0.8;
for j = 1:numPaths
    Cmap=custom_colormaps{strcmp(path,categories_Path{j})}; % Colormap for this path
    meanTrajectory=squeeze(meanTrajectories(j,:,:));
    if interp_ornot
        t = [0; cumsum(sqrt(sum(diff(meanTrajectory).^2, 2)))];
        t = t / t(end);
        num_interp = 1000;
        t_interp = linspace(0, 1, num_interp);
        x_interp = spline(t, meanTrajectory(:, 1), t_interp);
        y_interp = spline(t, meanTrajectory(:, 2), t_interp);
        z_interp = spline(t, meanTrajectory(:, 3), t_interp);
        meanTrajectory_interp=[x_interp(:),y_interp(:),z_interp(:)];
    else
        meanTrajectory_interp=meanTrajectory;
    end
    original_indices = zeros(size(meanTrajectory, 1), 1);
    for i = 1:size(meanTrajectory, 1)
        distances = sqrt(sum((meanTrajectory_interp - meanTrajectory(i, :)).^2, 2));
        [~, min_idx] = min(distances);
        original_indices(i) = min_idx;
    end
    if original_indices(1)~=1 || original_indices(end)~=size(meanTrajectory_interp,1)
        original_indices(1)=1;original_indices(end)=size(meanTrajectory_interp,1);
    end

    scatter3(meanTrajectory_interp(1, 1), meanTrajectory_interp(1, 2), meanTrajectory_interp(1, 3),15, Cmap(1,:), 'filled');
    scatter3(meanTrajectory_interp(end, 1), meanTrajectory_interp(end, 2), meanTrajectory_interp(end, 3),15, Cmap(end,:), 'filled');
    for i=1:numBins-1
        p=plot3(meanTrajectory_interp(original_indices(i):original_indices(i+1),1), meanTrajectory_interp(original_indices(i):original_indices(i+1),2), meanTrajectory_interp(original_indices(i):original_indices(i+1),3),'Color',[Cmap(round(256/numBins*i),:),alpha], 'LineWidth',2,'Clipping','off');
        hold on;
    end
end
hold off;grid on
xlabel('Dim 1 (a.u.)');ylabel('Dim 2 (a.u.)');zlabel('Dim 3 (a.u.)')
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
drawnow
axis tight
view(az,el);
xlim(xLim);ylim(yLim);zlim(zLim);