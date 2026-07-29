%% Code for Extended Data Fig. 9b, d, f
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
scatter_point_color=[0.8,0.8,0.8];scatter_point_size=30;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('EDF9/progress_decoding_adv.mat')
decoding_error_trained_on_firsthalf_dir1=decoding_error_trained_on_firsthalf{1};decoding_error_trained_on_firsthalf_dir2=decoding_error_trained_on_firsthalf{2};
nAnimals=size(decoding_error_trained_on_firsthalf_dir1,1);
mdecoding_error_trained_on_firsthalf_dir1=mean(decoding_error_trained_on_firsthalf_dir1,1,'omitmissing');
sedecoding_error_trained_on_firsthalf_dir1=std(decoding_error_trained_on_firsthalf_dir1,1,1,'omitmissing')./sqrt(nAnimals);
mdecoding_error_trained_on_firsthalf_dir2=mean(decoding_error_trained_on_firsthalf_dir2,1,'omitmissing');
sedecoding_error_trained_on_firsthalf_dir2=std(decoding_error_trained_on_firsthalf_dir2,1,1,'omitmissing')./sqrt(nAnimals);

decoding_error_trained_on_lasthalf_dir1=decoding_error_trained_on_lasthalf{1};decoding_error_trained_on_lasthalf_dir2=decoding_error_trained_on_lasthalf{2};
mdecoding_error_trained_on_lasthalf_dir1=mean(decoding_error_trained_on_lasthalf_dir1,1,'omitmissing');
sedecoding_error_trained_on_lasthalf_dir1=std(decoding_error_trained_on_lasthalf_dir1,1,1,'omitmissing')./sqrt(nAnimals);
mdecoding_error_trained_on_lasthalf_dir2=mean(decoding_error_trained_on_lasthalf_dir2,1,'omitmissing');
sedecoding_error_trained_on_lasthalf_dir2=std(decoding_error_trained_on_lasthalf_dir2,1,1,'omitmissing')./sqrt(nAnimals);

decoding_error_middle_progress_dir1=decoding_error_middle_progress{1};decoding_error_middle_progress_dir2=decoding_error_middle_progress{2};
mdecoding_error_middle_progress_dir1=mean(decoding_error_middle_progress_dir1,1,'omitmissing');
sedecoding_error_middle_progress_dir1=std(decoding_error_middle_progress_dir1,1,1,'omitmissing')./sqrt(nAnimals);
mdecoding_error_middle_progress_dir2=mean(decoding_error_middle_progress_dir2,1,'omitmissing');
sedecoding_error_middle_progress_dir2=std(decoding_error_middle_progress_dir2,1,1,'omitmissing')./sqrt(nAnimals);

%% Trained on the first 50% of trials
categ={'Decoded','Shuffled'};
figure('Position',[797 212 480 248],'units','normalized','Visible',figures_visibility);
sgtitle('Trained on the first 50% of trials')
ax1=subplot(1,2,1);% Rightward
hold on;
p1=plot([1,2],mdecoding_error_trained_on_firsthalf_dir1,'LineWidth',1.5,'Color','k');
% scatter([1,2],mdecoding_error_trained_on_firsthalf_dir1,scatter_point_size,'k','filled','LineWidth',scatter_point_linewidth);
scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_trained_on_firsthalf_dir1(:,1),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_trained_on_firsthalf_dir1(:,2),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');
e=errorbar([1,2],mdecoding_error_trained_on_firsthalf_dir1,sedecoding_error_trained_on_firsthalf_dir1,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
xticks([1, 2]);xticklabels(categ);
ylabel({'Decoding error','% progress'});box off
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
xlim([0.2,3])
ylim([0,60]);yticks([0,30,60]);

ax2=subplot(1,2,2);% Leftward
hold on;
p1=plot([1,2],mdecoding_error_trained_on_firsthalf_dir2,'LineWidth',1.5,'Color','k');
% scatter([1,2],mdecoding_error_trained_on_firsthalf_dir2,30,'k','filled','LineWidth',scatter_point_linewidth);
scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_trained_on_firsthalf_dir2(:,1),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_trained_on_firsthalf_dir2(:,2),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');
e=errorbar([1,2],mdecoding_error_trained_on_firsthalf_dir2,sedecoding_error_trained_on_firsthalf_dir2,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
xticks([1, 2]);xticklabels(categ);
ylabel({'Decoding error','% progress'});box off
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
xlim([0.2,3])
ylim([0,60]);yticks([0,30,60]);

%% Trained on the last 50% of trials
categ={'Decoded','Shuffled'};
figure('Position',[797 212 480 248],'units','normalized','Visible',figures_visibility);
sgtitle('Trained on the last 50% of trials')
ax1=subplot(1,2,1);% Rightward
hold on;
p1=plot([1,2],mdecoding_error_trained_on_lasthalf_dir1,'LineWidth',1.5,'Color','k');
% scatter([1,2],mdecoding_error_trained_on_lasthalf_dir1,30,'k','filled','LineWidth',scatter_point_linewidth);
scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_trained_on_lasthalf_dir1(:,1),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_trained_on_lasthalf_dir1(:,2),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');
e=errorbar([1,2],mdecoding_error_trained_on_lasthalf_dir1,sedecoding_error_trained_on_lasthalf_dir1,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
xticks([1, 2]);xticklabels(categ);
ylabel({'Decoding error','% progress'});box off
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
xlim([0.2,3])
ylim([0,60]);yticks([0,30,60]);

ax2=subplot(1,2,2);% Leftward
hold on;
p1=plot([1,2],mdecoding_error_trained_on_lasthalf_dir2,'LineWidth',1.5,'Color','k');
% scatter([1,2],mdecoding_error_trained_on_lasthalf_dir2,30,'k','filled','LineWidth',scatter_point_linewidth);
scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_trained_on_lasthalf_dir2(:,1),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_trained_on_lasthalf_dir2(:,2),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');
e=errorbar([1,2],mdecoding_error_trained_on_lasthalf_dir2,sedecoding_error_trained_on_lasthalf_dir2,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
xticks([1, 2]);xticklabels(categ);
ylabel({'Decoding error','% progress'});box off
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
xlim([0.2,3])
ylim([0,60]);yticks([0,30,60]);

%% Trained on 75% of trials (10%-90% progress)
categ={'Decoded','Shuffled'};
figure('Position',[797 212 480 248],'units','normalized','Visible',figures_visibility);
sgtitle('Trained on 75% of trials (10%-90% progress)')
ax1=subplot(1,2,1);% Rightward
hold on;
p1=plot([1,2],mdecoding_error_middle_progress_dir1,'LineWidth',1.5,'Color','k');
% scatter([1,2],mdecoding_error_middle_progress_dir1,30,'k','filled','LineWidth',scatter_point_linewidth);
scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_middle_progress_dir1(:,1),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_middle_progress_dir1(:,2),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');
e=errorbar([1,2],mdecoding_error_middle_progress_dir1,sedecoding_error_middle_progress_dir1,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
xticks([1, 2]);xticklabels(categ);
ylabel({'Decoding error','% progress'});box off
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
xlim([0.2,3])
ylim([0,60]);yticks([0,30,60]);

ax2=subplot(1,2,2);% Leftward
hold on;
p1=plot([1,2],mdecoding_error_middle_progress_dir2,'LineWidth',1.5,'Color','k');
% scatter([1,2],mdecoding_error_middle_progress_dir2,30,'k','filled','LineWidth',scatter_point_linewidth);
scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_middle_progress_dir2(:,1),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error_middle_progress_dir2(:,2),scatter_point_size,scatter_point_color,'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');
e=errorbar([1,2],mdecoding_error_middle_progress_dir2,sedecoding_error_middle_progress_dir2,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
xticks([1, 2]);xticklabels(categ);
ylabel({'Decoding error','% progress'});box off
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
xlim([0.2,3])
ylim([0,60]);yticks([0,30,60]);