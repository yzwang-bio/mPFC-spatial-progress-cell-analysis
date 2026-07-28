%% Code for Fig2e
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc; clear all;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig2/response_jitter.mat')
jitter_time_before=response_jitter{1}(:,1);
jitter_distance_to_goal_before=response_jitter{1}(:,2);
jitter_distance_progress_before=response_jitter{1}(:,3);
numneuron_before=size(jitter_time_before,1);
means_before = [mean(jitter_time_before,'omitmissing'), ...
    mean(jitter_distance_to_goal_before,'omitmissing'), ...
    mean(jitter_distance_progress_before,'omitmissing')];
sems_before = [std(jitter_time_before,'omitmissing'), ...
    std(jitter_distance_to_goal_before,'omitmissing'), ...
    std(jitter_distance_progress_before,'omitmissing')] / sqrt(numneuron_before);

jitter_time_after=response_jitter{2}(:,1);
jitter_distance_to_goal_after=response_jitter{2}(:,2);
jitter_distance_progress_after=response_jitter{2}(:,3);
numneuron_after=size(jitter_time_after,1);
means_after = [mean(jitter_time_after,'omitmissing'), ...
    mean(jitter_distance_to_goal_after,'omitmissing'), ...
    mean(jitter_distance_progress_after,'omitmissing')];
sems_after = [std(jitter_time_after,'omitmissing'), ...
    std(jitter_distance_to_goal_after,'omitmissing'), ...
    std(jitter_distance_progress_after,'omitmissing')] / sqrt(numneuron_after);


%%
categ={'Naive','Trained'};
figure('Position',[817 612 560 298.1429]);
subplot(1,2,1)
b = bar(means_before, 'FaceColor', [0.7 0.7 0.9]); % 浅蓝色柱
hold on;
errorbar(1:3, means_before, sems_before, 'k.', 'LineWidth', 1.5, 'CapSize', 10);
hold off;
xticklabels({'time from trial start','distance to goal','task progression'});
ylabel('Response jitter');
set(gca, 'FontSize', 12, 'Box', 'off');
set(gcf, 'Color', 'w');
title(categ{1})
subplot(1,2,2)
b = bar(means_after, 'FaceColor', [0.7 0.7 0.9]); % 浅蓝色柱
hold on;
errorbar(1:3, means_after, sems_after, 'k.', 'LineWidth', 1.5, 'CapSize', 10);
hold off;
xticklabels({'time from trial start','distance to goal','task progression'});
ylabel('Response jitter');
set(gca, 'FontSize', 12, 'Box', 'off');
set(gcf, 'Color', 'w');
title(categ{2})
