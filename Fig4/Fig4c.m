%% Code for Fig4c
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc; clear all;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig4/path_to_path_corr.mat')
nAnimals=size(path_to_path_corr{1},1);
mpath_to_path_corr=cellfun(@(x) mean(x,1,'omitmissing'),path_to_path_corr,'UniformOutput',false);
sepath_to_path_corr=cellfun(@(x) std(x,1,1,'omitmissing')./sqrt(nAnimals),path_to_path_corr,'UniformOutput',false);

%%
categ={'Naive','Trained'};
figure('Position',[654.1429 659.2857 734.2857 253.7143]);title('Correlation coefficients of normalized peak firing positions between different path pairs','Visible',figures_visibility)
hold on
for i=1:size(path_to_path_corr,2)
    b=bar([2*i-1,2*i],[mpath_to_path_corr{i}(1),mpath_to_path_corr{i}(2)],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
    b.CData=[[255,159,221]./255;0.8,0.8,0.8];
    s1=scatter(2*i-1+rand(nAnimals,1)*0.5-0.25,path_to_path_corr{i}(:,1),35,'LineWidth',1.5,'MarkerEdgeColor',[182,114,158]./255);
    s2=scatter(2*i+rand(nAnimals,1)*0.5-0.25,path_to_path_corr{i}(:,2),35,'LineWidth',1.5,'MarkerEdgeColor',[0.8,0.8,0.8]);
    e=errorbar([2*i-1,2*i],[mpath_to_path_corr{i}(1),mpath_to_path_corr{i}(2)],[sepath_to_path_corr{i}(1),sepath_to_path_corr{i}(2)],'.','LineWidth',errorbar_width);
    e.Color='k';
end
xticks(1.5:2:11.5);xticklabels({'Long-Zigzag','Long-Direct','Long-Short','Zigzag-Direct','Zigzag-Short','Direct-Short'});
ylim([-0.5,1]);
ylabel('Corr. Coef.')
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
