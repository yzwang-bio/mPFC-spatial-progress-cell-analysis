%% Code for Fig. 1i
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig1/preference_index.mat')
preference_index1=preference_index(:,1);preference_index2=preference_index(:,2);
nAnimals=size(preference_index,1);
mpreference_index=[mean(preference_index1,1,'omitmissing'),mean(preference_index2,1,'omitmissing')];
sepreference_index=[std(preference_index1,1,1,'omitmissing')./sqrt(nAnimals),std(preference_index2,1,1,'omitmissing')./sqrt(nAnimals)];

%% Preference index
categ={'Naive','Trained'};
figure('Position',[797 212 480 448],'units','normalized','Visible',figures_visibility);
ax1=subplot(2,2,1);% Preference index
hold on;
b=bar([1, 2],mpreference_index,'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
b.CData(1,:)=light_color_before;b.CData(2,:)=light_color_after;
e=errorbar([1, 2],mpreference_index,sepreference_index,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
s=scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),preference_index1,scatter_point_size,color_before,'LineWidth',scatter_point_linewidth);scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),preference_index2,scatter_point_size,color_after,'LineWidth',scatter_point_linewidth);
ylabel('Preference index');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0.2,3]);ylim([0.2,1])
