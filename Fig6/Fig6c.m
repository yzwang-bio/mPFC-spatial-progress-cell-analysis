%% Code for Fig. 6c
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig6/progress_reponse_jitter_inactivateHPCtoPFC.mat')
progress_reponse_jitter1=progress_reponse_jitter(:,1);progress_reponse_jitter2=progress_reponse_jitter(:,2);
nAnimals=size(progress_reponse_jitter,1);
mprogress_reponse_jitter=[mean(progress_reponse_jitter1,1,'omitmissing'),mean(progress_reponse_jitter2,1,'omitmissing')];
seprogress_reponse_jitter=[std(progress_reponse_jitter1,1,1,'omitmissing')./sqrt(nAnimals),std(progress_reponse_jitter2,1,1,'omitmissing')./sqrt(nAnimals)];

%% Comparison of the response jitter for spatial-progress cells before and after inactivation of the CA1→mPFC projection, with activity aligned by spatial progress
categ={'Naive','Trained'};
figure('Position',[797 212 480 448],'units','normalized','Visible',figures_visibility);
ax1=subplot(2,2,1);% 
hold on;
b=bar([1, 2],mprogress_reponse_jitter,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_saline;b.CData(2,:)=light_color_cno;
e=errorbar([1, 2],mprogress_reponse_jitter,seprogress_reponse_jitter,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
% s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),progress_reponse_jitter1,scatter_point_size,color_saline,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),progress_reponse_jitter2,scatter_point_size,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Preference index');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0,0.8]);ylim([0,0.4,0.8])
