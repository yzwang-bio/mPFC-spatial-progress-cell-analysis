%% Code for Fig. 2e
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;

%%
load('Fig2/response_jitter.mat')
jitter_time_naive=response_jitter{1}(:,1);
jitter_distance_to_goal_naive=response_jitter{1}(:,2);
jitter_distance_progress_naive=response_jitter{1}(:,3);
numneuron_naive=size(jitter_time_naive,1);
means_naive = [mean(jitter_time_naive,'omitmissing'), ...
    mean(jitter_distance_to_goal_naive,'omitmissing'), ...
    mean(jitter_distance_progress_naive,'omitmissing')];
sems_naive = [std(jitter_time_naive,'omitmissing'), ...
    std(jitter_distance_to_goal_naive,'omitmissing'), ...
    std(jitter_distance_progress_naive,'omitmissing')] / sqrt(numneuron_naive);

jitter_time_trained=response_jitter{2}(:,1);
jitter_distance_to_goal_trained=response_jitter{2}(:,2);
jitter_distance_progress_trained=response_jitter{2}(:,3);
numneuron_trained=size(jitter_time_trained,1);
means_trained = [mean(jitter_time_trained,'omitmissing'), ...
    mean(jitter_distance_to_goal_trained,'omitmissing'), ...
    mean(jitter_distance_progress_trained,'omitmissing')];
sems_trained = [std(jitter_time_trained,'omitmissing'), ...
    std(jitter_distance_to_goal_trained,'omitmissing'), ...
    std(jitter_distance_progress_trained,'omitmissing')] / sqrt(numneuron_trained);

%% Comparison of the response jitter for the recorded mPFC neurons across different alignment conditions between the naive and trained stages
categ={'Naive','Trained'};
alignment_type={'Time from trial start','Distance to goal','Norm. distance (spatial progress)'};
color_type={[241,144,77]./255,[77,184,120]./255,[84,111,177]./255};
figure('Position',[817 612 560 298.1429]);
subplot(1,2,1)
b1 = bar(means_naive,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
b1.CData(1,:)=color_type{1};b1.CData(2,:)=color_type{2};b1.CData(3,:)=color_type{3};
hold on;
e1=errorbar(1:3, means_naive, sems_naive,'.', 'LineWidth', 1.5, 'CapSize', 10);e1.Color=errorbar_color;e1.LineWidth=errorbar_width;
hold off;
xticklabels(alignment_type);
ylabel('Response jitter');
set(gca, 'FontSize', 10, 'Box', 'off');
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
title(categ{1})
subplot(1,2,2)
b2 = bar(means_trained,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
b2.CData(1,:)=color_type{1};b2.CData(2,:)=color_type{2};b2.CData(3,:)=color_type{3};
hold on;
e2=errorbar(1:3, means_trained, sems_trained,'.', 'LineWidth', 1.5, 'CapSize', 10);e2.Color=errorbar_color;e2.LineWidth=errorbar_width;
hold off;
xticklabels(alignment_type);
ylabel('Response jitter');
set(gca, 'FontSize', 10, 'Box', 'off');
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
title(categ{2})
