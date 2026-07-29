%% Code for Fig. 5c-e, g-i
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig5/numTrial_min_inactivateHPCtoPFC.mat')
numTrial_min1=numTrial_min(:,1);numTrial_min2=numTrial_min(:,2);
nAnimals=size(numTrial_min,1);
mnumTrial_min=[mean(numTrial_min1,1,'omitmissing'),mean(numTrial_min2,1,'omitmissing')];
senumTrial_min=[std(numTrial_min1,1,1,'omitmissing')./sqrt(nAnimals),std(numTrial_min2,1,1,'omitmissing')./sqrt(nAnimals)];
load('Fig5/random_pause_inactivateHPCtoPFC.mat')
random_pause1=random_pause(:,1);random_pause2=random_pause(:,2);
nAnimals=size(random_pause1,1);
mrandom_pause=[mean(random_pause1,1,'omitmissing'),mean(random_pause2,1,'omitmissing')];
serandom_pause=[std(random_pause1,1,1,'omitmissing')./sqrt(nAnimals),std(random_pause2,1,1,'omitmissing')./sqrt(nAnimals)];
load('Fig5/choice_time_inactivateHPCtoPFC.mat')
choice_time1=choice_time(:,1);choice_time2=choice_time(:,2);
nAnimals=size(choice_time,1);
mchoice_time=[mean(choice_time1,1,'omitmissing'),mean(choice_time2,1,'omitmissing')];
sechoice_time=[std(choice_time1,1,1,'omitmissing')./sqrt(nAnimals),std(choice_time2,1,1,'omitmissing')./sqrt(nAnimals)];
load('Fig5/preference_index_inactivateHPCtoPFC.mat')
preference_index1=preference_index(:,1);preference_index2=preference_index(:,2);
nAnimals=size(preference_index,1);
mpreference_index=[mean(preference_index1,1,'omitmissing'),mean(preference_index2,1,'omitmissing')];
sepreference_index=[std(preference_index1,1,1,'omitmissing')./sqrt(nAnimals),std(preference_index2,1,1,'omitmissing')./sqrt(nAnimals)];
load('Fig5/pctIncompleteTrials_inactivateHPCtoPFC.mat')
numIncompleteTrials1=numIncompleteTrials(:,1);numIncompleteTrials2=numIncompleteTrials(:,2);
nAnimals=size(numIncompleteTrials,1);
mnumIncompleteTrials=[mean(numIncompleteTrials1,1,'omitmissing'),mean(numIncompleteTrials2,1,'omitmissing')];
senumIncompleteTrials=[std(numIncompleteTrials1,1,1,'omitmissing')./sqrt(nAnimals),std(numIncompleteTrials2,1,1,'omitmissing')./sqrt(nAnimals)];
load('Fig5/intertrial_interval_inactivateHPCtoPFC.mat')
intertrial_interval1=intertrial_interval(:,1);intertrial_interval2=intertrial_interval(:,2);
nAnimals=size(intertrial_interval,1);
mintertrial_interval=[mean(intertrial_interval1,1,'omitmissing'),mean(intertrial_interval2,1,'omitmissing')];
seintertrial_interval=[std(intertrial_interval1,1,1,'omitmissing')./sqrt(nAnimals),std(intertrial_interval2,1,1,'omitmissing')./sqrt(nAnimals)];
%%
categ={'Naive','Trained'};
figure('Position',[797 212 480 648],'units','normalized','Visible',figures_visibility);
ax1=subplot(3,2,1);% Number of trials/minute
hold on;
b=bar([1, 2],mnumTrial_min,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_saline;b.CData(2,:)=light_color_cno;
e=errorbar([1, 2],mnumTrial_min,senumTrial_min,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),numTrial_min1,scatter_point_size,color_saline,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),numTrial_min2,scatter_point_size,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Trials / min');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,8])

ax2=subplot(3,2,2);% Random pause
hold on;
b=bar([1, 2],mrandom_pause,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_saline;b.CData(2,:)=light_color_cno;
e=errorbar([1, 2],mrandom_pause,serandom_pause,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),random_pause1,scatter_point_size,color_saline,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),random_pause2,scatter_point_size,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Random pause (%)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,30])

ax3=subplot(3,2,3);% Choice time
hold on;
b=bar([1, 2],mchoice_time,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_saline;b.CData(2,:)=light_color_cno;
e=errorbar([1, 2],mchoice_time,sechoice_time,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),choice_time1,scatter_point_size,color_saline,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),choice_time2,scatter_point_size,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Choice time (s)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,6]);yticks([0,2,4,6])

ax4=subplot(3,2,4);% Preference index
hold on;
b=bar([1, 2],mpreference_index,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_saline;b.CData(2,:)=light_color_cno;
e=errorbar([1, 2],mpreference_index,sepreference_index,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),preference_index1,scatter_point_size,color_saline,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),preference_index2,scatter_point_size,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Preference index');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0.2,1])

ax5=subplot(3,2,5);% Incomplete trial rate
hold on;
b=bar([1, 2],mnumIncompleteTrials,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_saline;b.CData(2,:)=light_color_cno;
e=errorbar([1, 2],mnumIncompleteTrials,senumIncompleteTrials,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),numIncompleteTrials1,scatter_point_size,color_saline,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),numIncompleteTrials2,scatter_point_size,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Incomplete trials (%)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,80])

ax6=subplot(3,2,6);% Inter-trial interval
hold on;
b=bar([1, 2],mintertrial_interval,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_saline;b.CData(2,:)=light_color_cno;
e=errorbar([1, 2],mintertrial_interval,seintertrial_interval,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),intertrial_interval1,scatter_point_size,color_saline,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),intertrial_interval2,scatter_point_size,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Inter-trial interval (s)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,15])