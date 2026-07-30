%% Code for Fig. 6i
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig6/umap_inactivateHPCtoPFC.mat')
Intra_Inter_Prog_Dist_ratio_dir1=Intra_Inter_Prog_Dist_ratio{1};Intra_Inter_Prog_Dist_ratio_dir2=Intra_Inter_Prog_Dist_ratio{2};
nAnimals=size(Intra_Inter_Prog_Dist_ratio_dir1,1);
mIntra_Inter_Prog_Dist_ratio_dir1=mean(Intra_Inter_Prog_Dist_ratio_dir1,1,'omitmissing');seIntra_Inter_Prog_Dist_ratio_dir1=std(Intra_Inter_Prog_Dist_ratio_dir1,[],1,'omitmissing')./sqrt(nAnimals);
mIntra_Inter_Prog_Dist_ratio_dir2=mean(Intra_Inter_Prog_Dist_ratio_dir2,1,'omitmissing');seIntra_Inter_Prog_Dist_ratio_dir2=std(Intra_Inter_Prog_Dist_ratio_dir2,[],1,'omitmissing')./sqrt(nAnimals);

%% rightward trials, leftward trials are presented in Extended Data Figures
figure
hold on;
scatter(0.5,Intra_Inter_Prog_Dist_ratio_dir1(:,1),scatter_point_size,color_saline,'filled','LineWidth',scatter_point_linewidth);
scatter(1.5,Intra_Inter_Prog_Dist_ratio_dir1(:,2),scatter_point_size,color_cno,'filled','LineWidth',scatter_point_linewidth);
e1=errorbar([0.5,1.5],[mIntra_Inter_Prog_Dist_ratio_dir1(:,1),mIntra_Inter_Prog_Dist_ratio_dir1(:,2)],[seIntra_Inter_Prog_Dist_ratio_dir1(:,1),seIntra_Inter_Prog_Dist_ratio_dir1(:,2)]);e1.Color='k';e1.LineWidth=errorbar_width;e1.CapSize=18;
for ani=1:nAnimals
    plot([0.5,1.5],[Intra_Inter_Prog_Dist_ratio_dir1(ani,1),Intra_Inter_Prog_Dist_ratio_dir1(ani,2)],'Color',[0.8,0.8,0.8])
end
ylabel('Intra/Inter prog. dist.');box off
set(gca,'FontSize',12,'FontName', 'Arial','FontWeight', 'normal'); 
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');box off
ylim([0.6,1]);yticks([0.6,0.8,1]);
xlim([0,2]);xticks([0.5,1.5]);xticklabels({'Saline','CNO'});
