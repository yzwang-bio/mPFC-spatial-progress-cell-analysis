%% Code for Extended Data Fig. 1g, i
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('EDF1/intertrial_interval.mat')
intertrial_interval1=intertrial_interval(:,1);intertrial_interval2=intertrial_interval(:,2);
nAnimals=size(intertrial_interval,1);
mintertrial_interval=[mean(intertrial_interval1,1,'omitmissing'),mean(intertrial_interval2,1,'omitmissing')];
seintertrial_interval=[std(intertrial_interval1,1,1,'omitmissing')./sqrt(nAnimals),std(intertrial_interval2,1,1,'omitmissing')./sqrt(nAnimals)];
load('EDF1/random_pause.mat')
random_pause1=random_pause(:,1);random_pause2=random_pause(:,2);
nAnimals=size(random_pause,1);
mrandom_pause=[mean(random_pause1,1,'omitmissing'),mean(random_pause2,1,'omitmissing')];
serandom_pause=[std(random_pause1,1,1,'omitmissing')./sqrt(nAnimals),std(random_pause2,1,1,'omitmissing')./sqrt(nAnimals)];

%%
categ={'Naive','Trained'};
figure('Position',[797 212 480 448],'units','normalized','Visible',figures_visibility);
ax1=subplot(2,2,1);% Inter-trial interval
hold on;
b=bar([1, 2],mintertrial_interval,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_before;b.CData(2,:)=light_color_after;
e=errorbar([1, 2],mintertrial_interval,seintertrial_interval,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),intertrial_interval1,scatter_point_size,color_before,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),intertrial_interval2,scatter_point_size,color_after,'LineWidth',scatter_point_linewidth);
ylabel('Inter-trial interval (s)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,25])

ax2=subplot(2,2,2);% Random pause
hold on;
b=bar([1, 2],mrandom_pause,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_before;b.CData(2,:)=light_color_after;
e=errorbar([1, 2],mrandom_pause,serandom_pause,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),random_pause1,scatter_point_size,color_before,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),random_pause2,scatter_point_size,color_after,'LineWidth',scatter_point_linewidth);
ylabel('Random pause (%)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,80])
