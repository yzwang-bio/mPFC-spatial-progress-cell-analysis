%% Code for Fig1b-e
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc; clear all;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig1/numTrial_min.mat')
numTrial_min1=numTrial_min(:,1);numTrial_min2=numTrial_min(:,2);
nAnimals=size(numTrial_min,1);
mnumTrial_min=[mean(numTrial_min1,1,'omitmissing'),mean(numTrial_min2,1,'omitmissing')];
senumTrial_min=[std(numTrial_min1,1,1,'omitmissing')./sqrt(nAnimals),std(numTrial_min2,1,1,'omitmissing')./sqrt(nAnimals)];
load('Fig1/numIncompleteTrials.mat')
numIncompleteTrials1=numIncompleteTrials(:,1);numIncompleteTrials2=numIncompleteTrials(:,2);
nAnimals=size(numIncompleteTrials,1);
mnumIncompleteTrials=[mean(numIncompleteTrials1,1,'omitmissing'),mean(numIncompleteTrials2,1,'omitmissing')];
senumIncompleteTrials=[std(numIncompleteTrials1,1,1,'omitmissing')./sqrt(nAnimals),std(numIncompleteTrials2,1,1,'omitmissing')./sqrt(nAnimals)];
load('Fig1/trial_duration.mat')
trial_duration1=trial_duration(:,1);trial_duration2=trial_duration(:,2);
nAnimals=size(trial_duration,1);
mtrial_duration=[mean(trial_duration1,1,'omitmissing'),mean(trial_duration2,1,'omitmissing')];
setrial_duration=[std(trial_duration1,1,1,'omitmissing')./sqrt(nAnimals),std(trial_duration2,1,1,'omitmissing')./sqrt(nAnimals)];
load('Fig1/choice_time.mat')
choice_time1=choice_time(:,1);choice_time2=choice_time(:,2);
nAnimals=size(choice_time,1);
mchoice_time=[mean(choice_time1,1,'omitmissing'),mean(choice_time2,1,'omitmissing')];
sechoice_time=[std(choice_time1,1,1,'omitmissing')./sqrt(nAnimals),std(choice_time2,1,1,'omitmissing')./sqrt(nAnimals)];

%%
categ={'Naive','Trained'};
figure('Position',[797 212 480 448],'units','normalized','Visible',figures_visibility);
ax1=subplot(2,2,1);% Number of trials/minute
hold on;
b=bar([1, 2],mnumTrial_min,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_before;b.CData(2,:)=light_color_after;
e=errorbar([1, 2],mnumTrial_min,senumTrial_min,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),numTrial_min1,scatter_point_size,color_before,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),numTrial_min2,scatter_point_size,color_after,'LineWidth',scatter_point_linewidth);
ylabel('Trials / min');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,8])

ax2=subplot(2,2,2);% Incomplete trial rate
hold on;
b=bar([1, 2],mnumIncompleteTrials,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_before;b.CData(2,:)=light_color_after;
e=errorbar([1, 2],mnumIncompleteTrials,senumIncompleteTrials,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),numIncompleteTrials1,scatter_point_size,color_before,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),numIncompleteTrials2,scatter_point_size,color_after,'LineWidth',scatter_point_linewidth);
ylabel('Incomplete trials (%)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,80])

ax3=subplot(2,2,3);% Trial duration
hold on;
b=bar([1, 2],mtrial_duration,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_before;b.CData(2,:)=light_color_after;
e=errorbar([1, 2],mtrial_duration,setrial_duration,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),trial_duration1,scatter_point_size,color_before,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),trial_duration2,scatter_point_size,color_after,'LineWidth',scatter_point_linewidth);
ylabel('Trial duration (s)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,30])

ax4=subplot(2,2,4);% Choice time
hold on;
b=bar([1, 2],mchoice_time,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_before;b.CData(2,:)=light_color_after;
e=errorbar([1, 2],mchoice_time,sechoice_time,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),choice_time1,scatter_point_size,color_before,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),choice_time2,scatter_point_size,color_after,'LineWidth',scatter_point_linewidth);
ylabel('Choice time (s)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,9]);yticks([0,3,6,9])