%% Code for Fig6j
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc; clear all;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig6/progress_decoding_inactivateHPCtoPFC.mat')
decoding_error_dir1=decoding_error{1};decoding_error_dir2=decoding_error{2};
nAnimals=size(decoding_error_dir1,1);
mdecoding_error_dir1=mean(decoding_error_dir1,1,'omitmissing');sedecoding_error_dir1=std(decoding_error_dir1,[],1,'omitmissing')./sqrt(nAnimals);
mdecoding_error_dir2=mean(decoding_error_dir2,1,'omitmissing');sedecoding_error_dir2=std(decoding_error_dir2,[],1,'omitmissing')./sqrt(nAnimals);

%% rightward trials, leftward trials are presented in Extended Data Figures
figure
hold on;
scatter(1,decoding_error_dir1(:,1),scatter_point_size,color_saline,'filled','LineWidth',scatter_point_linewidth);
scatter(2,decoding_error_dir1(:,2),scatter_point_size,color_cno,'filled','LineWidth',scatter_point_linewidth);
e1=errorbar([1,2],[mdecoding_error_dir1(:,1),mdecoding_error_dir1(:,2)],[sedecoding_error_dir1(:,1),sedecoding_error_dir1(:,2)]);e1.Color='k';e1.LineWidth=errorbar_width;e1.CapSize=18;
% for ani=1:nAnimals
%     plot([1,2],[decoding_error_dir1(ani,1),decoding_error_dir1(ani,2)],'Color',[0.8,0.8,0.8])
% end
ylabel({'Decoding error','% progress'});box off
set(gca,'FontSize',12,'FontName', 'Arial','FontWeight', 'normal');
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');box off
ylim([0,60]);yticks([0,30,60]);
xlim([0,3]);xticks([1,2]);xticklabels({'Saline','CNO'});
