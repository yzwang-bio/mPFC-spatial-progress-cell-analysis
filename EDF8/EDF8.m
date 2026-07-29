%% Code for Extended Data Fig. 8
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
NumDimensions = 3;
circlemaze_color_schedule
figures_visibility='on';

%% Example animal: YZ06
animal_ID='YZ06';

load('EDF8/umap_single_trial_trajectories.mat')
%%
trial_betweenBin_dist=cell(numTrials,1);trial_Pathname=cell(numTrials,1);% 记录每个试次的神经流形相邻点（bin）间距离及试次所属路径名
TrialPoints=cell(numTrials,1);% 记录每个试次点的坐标
for c = 1:numTrials
    for j = 1:numPaths
        clusterPoints = Y(strcmp(labels_Path,categories_Path{j}) & strcmp(labels_TrialIdx,categories_TrialIdx{c}), :); % 指定试次时的点
        if isempty(clusterPoints);continue;end% 说明该试次不是这一路径的
        if size(clusterPoints,1)~=numBins;error('指定试次时，点的数量应与bin数相同');end
        TrialPoints{c}=clusterPoints;

        trial_betweenBin_dist{c}(1)=0;
        for r=2:numBins
            trial_betweenBin_dist{c}(r)=norm(clusterPoints(r,:)-clusterPoints(r-1,:));
        end
        trial_Pathname{c}=categories_Path{j};
        
        % Plot
        if (c-1)/15==ceil((c-1)/15)
            fig=figure('Visible',figures_visibility,'Name',animal_ID);
            max_win(fig);
            sgtitle('Consecutive single-trial trajectories')
        end
        subplot(3,5,c-ceil(c/15-1)*15)
        for r=1:numBins
            if NumDimensions==2
                scatter(clusterPoints(r, 1), clusterPoints(r, 2), 25, color_for_bins{r}, 'filled');
                xlabel('Dim 1 (a.u.)');ylabel('Dim 2 (a.u.)');
            elseif NumDimensions==3
                scatter3(clusterPoints(r, 1), clusterPoints(r, 2), clusterPoints(r, 3), 25, color_for_bins{r}, 'filled');
                xlabel('Dim 1 (a.u.)');ylabel('Dim 2 (a.u.)');zlabel('Dim 3 (a.u.)')
            end
            hold on;
        end
        for r=1:numBins-1
            if NumDimensions==2
                plot3(clusterPoints(r, 1):clusterPoints(r+1, 1), clusterPoints(r, 2):clusterPoints(r+1, 2), clusterPoints(r, 3):clusterPoints(r+1, 3),'Color',color_for_bins{r}, 'LineWidth',1)
            elseif NumDimensions==3
                plot3(clusterPoints(r:r+1, 1), clusterPoints(r:r+1, 2), clusterPoints(r:r+1, 3),'Color',color_for_bins{r}, 'LineWidth',2)
            end
        end
        set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
        grid on
        axis tight
        view(az,el);
        xlim(xLim);ylim(yLim);zlim(zLim);
        title(['Trial index-',strrep(categories_TrialIdx{c},'trial index-',''),'...',categories_Path{j}])
    end
end
