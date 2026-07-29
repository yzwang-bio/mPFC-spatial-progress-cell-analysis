%% Code for Extended Data Fig. 10a
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color=[0.8,0.8,0.8];scatter_point_size=30;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('EDF10/corr_within_path.mat')
nAnimals=size(corr_within_path,1);nPaths=size(corr_within_path,2);
mcorr_within_path=mean(corr_within_path,1);secorr_within_path=std(corr_within_path,[],1)./sqrt(nAnimals);

%% Average correlation coefficients of normalized peak positions across trials within individual paths
categ={'Long curve','Zigzag','Direct','Short curve'};

figure('Name','Average correlation coefficients of normalized peak positions across trials within individual paths','Position',[797 448.4286 226.2857 211.5714],'Visible',figures_visibility);
hold on;
b=bar(1:nPaths,mcorr_within_path,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks(1:nPaths);xticklabels(categ);
b.CData(1,:)=light_circlemaze_color_for_path{1};b.CData(2,:)=light_circlemaze_color_for_path{2};b.CData(3,:)=light_circlemaze_color_for_path{3};b.CData(4,:)=light_circlemaze_color_for_path{4};
e=errorbar(1:nPaths,mcorr_within_path,secorr_within_path,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
for p=1:nPaths
    scatter(p+(-0.25 + 0.5 * rand(nAnimals, 1)),corr_within_path(:,p),scatter_point_size,circlemaze_color_for_path{p},'LineWidth',scatter_point_linewidth);
end
ylabel('Corr. Coef.');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,5])
