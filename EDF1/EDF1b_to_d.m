%% Code for Extended Data Fig. 1b-d
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc; clear all;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('EDF1/training_metrics.mat')
nAnimals=size(trial_duration_AT,1);

trial_duration_AT=cat(2,trial_duration_AT{:});
pctIncompleteTrials_AT=cat(2,pctIncompleteTrials_AT{:});
preferrence_index_AT=cat(2,preferrence_index_AT{:});

mtrial_duration_AT=mean(trial_duration_AT,2,'omitmissing');setrial_duration_AT=std(trial_duration_AT,1,2,'omitmissing')./sqrt(nAnimals);
mpctIncompleteTrials_AT=mean(pctIncompleteTrials_AT,2,'omitmissing');sepctIncompleteTrials_AT=std(pctIncompleteTrials_AT,1,2,'omitmissing')./sqrt(nAnimals);
mpreferrence_index_AT=mean(preferrence_index_AT,2,'omitmissing');sepreferrence_index_AT=std(preferrence_index_AT,1,2,'omitmissing')./sqrt(nAnimals);

ndays=length(mtrial_duration_AT);

%% plot
figure('Name','Training curve');
subplot(2,2,1)
hold on
e1=errorbar(1:ndays,mpctIncompleteTrials_AT,sepctIncompleteTrials_AT);e1.Color=errorbar_color;e1.LineWidth=errorbar_width;
ylabel('Incomplete trials (%)');box off
set(gca,'FontSize',9,'FontName', 'Arial','FontWeight', 'normal'); 
set(gca,'LineWidth',1.5);
set(gca,'TickLength',[0.02 0.02],'TickDir','out');
ylim([0,80])
yl = ylim;y_bottom = yl(1);y_top = yl(2);
fill([2.5, 5.5, 5.5, 2.5], [y_bottom, y_bottom, y_top, y_top], ...
     color_before, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
fill([12.5, 15.5, 15.5, 12.5], [y_bottom, y_bottom, y_top, y_top], ...
     color_after, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
uistack(e1,'top')

subplot(2,2,2)
hold on
e1=errorbar(1:ndays,mtrial_duration_AT,setrial_duration_AT);e1.Color=errorbar_color;e1.LineWidth=errorbar_width;
ylabel('Trial duration (s)');box off
set(gca,'FontSize',9,'FontName', 'Arial','FontWeight', 'normal'); 
set(gca,'LineWidth',1.5);
set(gca,'TickLength',[0.02 0.02],'TickDir','out');
ylim([0,30])
yl = ylim;y_bottom = yl(1);y_top = yl(2);
fill([2.5, 5.5, 5.5, 2.5], [y_bottom, y_bottom, y_top, y_top], ...
     color_before, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
fill([12.5, 15.5, 15.5, 12.5], [y_bottom, y_bottom, y_top, y_top], ...
     color_after, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
uistack(e1,'top')

subplot(2,2,3)
hold on
e1=errorbar(1:ndays,mpreferrence_index_AT,sepreferrence_index_AT);e1.Color='k';e1.LineWidth=errorbar_width;
ylabel('Preferrence index');box off
set(gca,'FontSize',9,'FontName', 'Arial','FontWeight', 'normal'); 
set(gca,'LineWidth',1.5);
set(gca,'TickLength',[0.02 0.02],'TickDir','out');
ylim([0.2,1])
yl = ylim;y_bottom = yl(1);y_top = yl(2);
fill([2.5, 5.5, 5.5, 2.5], [y_bottom, y_bottom, y_top, y_top], ...
     color_before, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
fill([12.5, 15.5, 15.5, 12.5], [y_bottom, y_bottom, y_top, y_top], ...
     color_after, 'FaceAlpha', 0.5, 'EdgeColor', 'none');
uistack(e1,'top')
