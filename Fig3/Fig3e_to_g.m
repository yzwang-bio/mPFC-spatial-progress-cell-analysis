%% Code for Fig3e-g
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc; clear all;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig3/umap.mat')
Intra_Inter_Prog_Dist_dir1=Intra_Inter_Prog_Dist{1};Intra_Inter_Prog_Dist_dir2=Intra_Inter_Prog_Dist{2};
nAnimals=size(Intra_Inter_Prog_Dist_dir1,1);
mIntra_Inter_Prog_Dist_dir1=mean(Intra_Inter_Prog_Dist_dir1,1,'omitmissing');seIntra_Inter_Prog_Dist_dir1=std(Intra_Inter_Prog_Dist_dir1,[],1,'omitmissing')./sqrt(nAnimals);
mIntra_Inter_Prog_Dist_dir2=mean(Intra_Inter_Prog_Dist_dir2,1,'omitmissing');seIntra_Inter_Prog_Dist_dir2=std(Intra_Inter_Prog_Dist_dir2,[],1,'omitmissing')./sqrt(nAnimals);
Intra_Inter_Path_Dist_dir1=Intra_Inter_Path_Dist{1};Intra_Inter_Path_Dist_dir2=Intra_Inter_Path_Dist{2};
mIntra_Inter_Path_Dist_dir1=mean(Intra_Inter_Path_Dist_dir1,1,'omitmissing');seIntra_Inter_Path_Dist_dir1=std(Intra_Inter_Path_Dist_dir1,[],1,'omitmissing')./sqrt(nAnimals);
mIntra_Inter_Path_Dist_dir2=mean(Intra_Inter_Path_Dist_dir2,1,'omitmissing');seIntra_Inter_Path_Dist_dir2=std(Intra_Inter_Path_Dist_dir2,[],1,'omitmissing')./sqrt(nAnimals);

Intra_Dir_Dist=Intra_Inter_Dir_Dist(:,1);Inter_Dir_Dist=Intra_Inter_Dir_Dist(:,2);
mIntra_Inter_Dir_Dist=[mean(Intra_Dir_Dist,1,'omitmissing'),mean(Inter_Dir_Dist,1,'omitmissing')];
seIntra_Inter_Dir_Dist=[std(Intra_Dir_Dist,1,1,'omitmissing')./sqrt(nAnimals),std(Inter_Dir_Dist,1,1,'omitmissing')./sqrt(nAnimals)];

%% e
figure
hold on;
scatter(0.5,Intra_Inter_Prog_Dist_dir1(:,1),scatter_point_size,color_intra,'filled','LineWidth',scatter_point_linewidth);
scatter(1.5,Intra_Inter_Prog_Dist_dir1(:,2),scatter_point_size,color_inter,'filled','LineWidth',scatter_point_linewidth);
e1=errorbar([0.5,1.5],[mIntra_Inter_Prog_Dist_dir1(:,1),mIntra_Inter_Prog_Dist_dir1(:,2)],[seIntra_Inter_Prog_Dist_dir1(:,1),seIntra_Inter_Prog_Dist_dir1(:,2)]);e1.Color='k';e1.LineWidth=errorbar_width;e1.CapSize=18;
for ani=1:nAnimals
    plot([0.5,1.5],[Intra_Inter_Prog_Dist_dir1(ani,1),Intra_Inter_Prog_Dist_dir1(ani,2)],'Color',[0.8,0.8,0.8])
end

scatter(2.5,Intra_Inter_Prog_Dist_dir2(:,1),scatter_point_size,color_intra,'filled','LineWidth',scatter_point_linewidth);
scatter(3.5,Intra_Inter_Prog_Dist_dir2(:,2),scatter_point_size,color_inter,'filled','LineWidth',scatter_point_linewidth);
e2=errorbar([2.5,3.5],[mIntra_Inter_Prog_Dist_dir2(:,1),mIntra_Inter_Prog_Dist_dir2(:,2)],[seIntra_Inter_Prog_Dist_dir2(:,1),seIntra_Inter_Prog_Dist_dir2(:,2)]);e2.Color='k';e2.LineWidth=errorbar_width;e2.CapSize=18;
for ani=1:nAnimals
    plot([2.5,3.5],[Intra_Inter_Prog_Dist_dir2(ani,1),Intra_Inter_Prog_Dist_dir2(ani,2)],'Color',[0.8,0.8,0.8])
end
ylabel('Eucl. dist. (a.u.)');box off
set(gca,'FontSize',12,'FontName', 'Arial','FontWeight', 'normal'); % 坐标轴刻度
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');box off
yticks([1,4,7]);yticklabels([1,4,7]);ylim([1,7])
xlim([0,4]);xticks([1,3]);xticklabels({'Rightward','Leftward'});

h1 = scatter(NaN, NaN, scatter_point_size, color_intra, 'filled', 'LineWidth', scatter_point_linewidth, 'DisplayName', 'Intra-prog.');
h2 = scatter(NaN, NaN, scatter_point_size, color_inter, 'filled', 'LineWidth', scatter_point_linewidth, 'DisplayName', 'Inter-prog.');
legend([h1, h2], 'Location', 'best');

%% f
figure
hold on;
scatter(0.5,Intra_Inter_Path_Dist_dir1(:,1),scatter_point_size,color_intra,'filled','LineWidth',scatter_point_linewidth);
scatter(1.5,Intra_Inter_Path_Dist_dir1(:,2),scatter_point_size,color_inter,'filled','LineWidth',scatter_point_linewidth);
e1=errorbar([0.5,1.5],[mIntra_Inter_Path_Dist_dir1(:,1),mIntra_Inter_Path_Dist_dir1(:,2)],[seIntra_Inter_Path_Dist_dir1(:,1),seIntra_Inter_Path_Dist_dir1(:,2)]);e1.Color='k';e1.LineWidth=errorbar_width;e1.CapSize=18;
for ani=1:nAnimals
    plot([0.5,1.5],[Intra_Inter_Path_Dist_dir1(ani,1),Intra_Inter_Path_Dist_dir1(ani,2)],'Color',[0.8,0.8,0.8])
end

scatter(2.5,Intra_Inter_Path_Dist_dir2(:,1),scatter_point_size,color_intra,'filled','LineWidth',scatter_point_linewidth);
scatter(3.5,Intra_Inter_Path_Dist_dir2(:,2),scatter_point_size,color_inter,'filled','LineWidth',scatter_point_linewidth);
e2=errorbar([2.5,3.5],[mIntra_Inter_Path_Dist_dir2(:,1),mIntra_Inter_Path_Dist_dir2(:,2)],[seIntra_Inter_Path_Dist_dir2(:,1),seIntra_Inter_Path_Dist_dir2(:,2)]);e2.Color='k';e2.LineWidth=errorbar_width;e2.CapSize=18;
for ani=1:nAnimals
    plot([2.5,3.5],[Intra_Inter_Path_Dist_dir2(ani,1),Intra_Inter_Path_Dist_dir2(ani,2)],'Color',[0.8,0.8,0.8])
end
ylabel('Eucl. dist. (a.u.)');box off
set(gca,'FontSize',12,'FontName', 'Arial','FontWeight', 'normal'); % 坐标轴刻度
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');box off
yticks([1,4,7]);yticklabels([1,4,7]);ylim([1,7])
xlim([0,4]);xticks([1,3]);xticklabels({'Rightward','Leftward'});

h1 = scatter(NaN, NaN, scatter_point_size, color_intra, 'filled', 'LineWidth', scatter_point_linewidth, 'DisplayName', 'Intra-path');
h2 = scatter(NaN, NaN, scatter_point_size, color_inter, 'filled', 'LineWidth', scatter_point_linewidth, 'DisplayName', 'Inter-path');
legend([h1, h2], 'Location', 'best');

%% g
figure
hold on;
scatter(0.5,Intra_Inter_Dir_Dist(:,1),scatter_point_size,color_intra,'filled','LineWidth',scatter_point_linewidth);
scatter(1.5,Intra_Inter_Dir_Dist(:,2),scatter_point_size,color_inter,'filled','LineWidth',scatter_point_linewidth);
e1=errorbar([0.5,1.5],[mIntra_Inter_Dir_Dist(:,1),mIntra_Inter_Dir_Dist(:,2)],[seIntra_Inter_Dir_Dist(:,1),seIntra_Inter_Dir_Dist(:,2)]);e1.Color='k';e1.LineWidth=errorbar_width;e1.CapSize=18;
for ani=1:nAnimals
    plot([0.5,1.5],[Intra_Inter_Dir_Dist(ani,1),Intra_Inter_Dir_Dist(ani,2)],'Color',[0.8,0.8,0.8])
end
ylabel('Eucl. dist. (a.u.)');box off
set(gca,'FontSize',12,'FontName', 'Arial','FontWeight', 'normal'); % 坐标轴刻度
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');box off
yticks([1,4,7]);yticklabels([1,4,7]);ylim([1,7])
xlim([0,2]);xticks([0.5,1.5]);xticklabels({'Intra-dir.','Inter-dir.'});

h1 = scatter(NaN, NaN, scatter_point_size, color_intra, 'filled', 'LineWidth', scatter_point_linewidth, 'DisplayName', 'Intra-dir.');
h2 = scatter(NaN, NaN, scatter_point_size, color_inter, 'filled', 'LineWidth', scatter_point_linewidth, 'DisplayName', 'Inter-dir.');
legend([h1, h2], 'Location', 'best');