%% Code for Fig1g
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc; clear all;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig1/pathselectRate.mat')
pathselectRate1=pathselectRate{1};pathselectRate2=pathselectRate{2};
nAnimals=size(pathselectRate1,1);
mpathselectRate1=mean(pathselectRate1,1,'omitmissing');sepathselectRate1=std(pathselectRate1,1,1,'omitmissing')./sqrt(nAnimals);
mpathselectRate2=mean(pathselectRate2,1,'omitmissing');sepathselectRate2=std(pathselectRate2,1,1,'omitmissing')./sqrt(nAnimals);
nSelect=4;

%%
categ={'Naive','Trained'};
figure('Position',[797 402.7143 480 257.2857],'Visible',figures_visibility);
hold on;
b=bar([1,2],[mpathselectRate1;mpathselectRate2],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
for i = 1:nSelect
    b(i).CData(1,:) = light_circlemaze_color_for_path{i};b(i).CData(2,:) = light_circlemaze_color_for_path{i};
end
path={'Long','Zigzag','Direct','Short'};% path={'Long curve','Zigzag','Direct','Short curve'};

for i = 1:2
    eval(sprintf('e%s=errorbar(x%s, mpathselectRate%s, sepathselectRate%s, ''k'', ''linestyle'', ''none'');e%s.Color=errorbar_color;e%s.LineWidth=errorbar_width;',num2str(i),num2str(i),num2str(i),num2str(i),num2str(i),num2str(i)))
end

leg=legend(path);leg.FontSize=8;leg.FontWeight='normal';pos=set(leg,'Position',[0.797160712866555 0.576628835987052 0.18958333617165 0.428721538279458]);
legend('boxoff')
ylabel('Path selection rate (%)');box off;
ylim([0,60])
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
