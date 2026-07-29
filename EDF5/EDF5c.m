%% Code for Extended Data Fig. 5c
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('EDF5/distance_between_cells.mat')
nAnimals=size(Dist_progress_cell_rightward,1);
mDist_progress_cell_rightward=mean(Dist_progress_cell_rightward,1,'omitmissing');seDist_progress_cell_rightward=std(Dist_progress_cell_rightward,1,1,'omitmissing')./sqrt(nAnimals);
mDist_progress_cell_leftward=mean(Dist_progress_cell_leftward,1,'omitmissing');seDist_progress_cell_leftward=std(Dist_progress_cell_leftward,1,1,'omitmissing')./sqrt(nAnimals);
mDist_non_progress_cell=mean(Dist_non_progress_cell,1,'omitmissing');seDist_non_progress_cell=std(Dist_non_progress_cell,1,1,'omitmissing')./sqrt(nAnimals);

%%
categ={'Rightward','Leftward','Other'};
figure('Visible',figures_visibility)
title('Pairwise spatial distances between cells')
hold on;
b=bar(1:3,[mDist_progress_cell_rightward,mDist_progress_cell_leftward,mDist_non_progress_cell],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks(1:3);xticklabels(categ);
b.CData(1,:)=light_circlemaze_color_for_direction{1};b.CData(2,:)=light_circlemaze_color_for_direction{2};b.CData(3,:)=[0.8,0.8,0.8];
e=errorbar(1:3,[mDist_progress_cell_rightward,mDist_progress_cell_leftward,mDist_non_progress_cell],[seDist_progress_cell_rightward,seDist_progress_cell_leftward,seDist_non_progress_cell],'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),Dist_progress_cell_rightward,scatter_point_size,color_AtoB,'LineWidth',scatter_point_linewidth);
scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),Dist_progress_cell_leftward,scatter_point_size,color_BtoA,'LineWidth',scatter_point_linewidth);
scatter(3+(-0.25 + 0.5 * rand(nAnimals, 1)),Dist_non_progress_cell,scatter_point_size,[0.2,0.2,0.2],'LineWidth',scatter_point_linewidth);
ylabel('Distance between cells (µm)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,4]) 
ylim([0,450]);yticks([0,150,300,450])
