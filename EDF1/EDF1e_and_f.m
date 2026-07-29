%% Code for Extended Data Fig. 1e, f
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('EDF1/trial_duration_seperate_Path_or_Dir.mat')
trial_duration_Path1=trial_duration_Path{1};trial_duration_Path2=trial_duration_Path{2};
nAnimals=size(trial_duration_Path1,1);
mtrial_duration_Path1=mean(trial_duration_Path1,1,'omitmissing');setrial_duration_Path1=std(trial_duration_Path1,1,1,'omitmissing')./sqrt(nAnimals);
mtrial_duration_Path2=mean(trial_duration_Path2,1,'omitmissing');setrial_duration_Path2=std(trial_duration_Path2,1,1,'omitmissing')./sqrt(nAnimals);
trial_duration_Dir1=trial_duration_Dir{1};trial_duration_Dir2=trial_duration_Dir{2};
nAnimals=size(trial_duration_Dir1,1);
mtrial_duration_Dir1=mean(trial_duration_Dir1,1,'omitmissing');setrial_duration_Dir1=std(trial_duration_Dir1,1,1,'omitmissing')./sqrt(nAnimals);
mtrial_duration_Dir2=mean(trial_duration_Dir2,1,'omitmissing');setrial_duration_Dir2=std(trial_duration_Dir2,1,1,'omitmissing')./sqrt(nAnimals);

%%
categ={'Naive','Trained'};
paths={'Long','Zigzag','Direct','Short'};% paths={'Long curve','Zigzag','Direct','Short curve'};
directions={'Rightward','Leftward'};
nSelect=4;
figure('Position',[797 402.7143 580 257.2857],'Visible',figures_visibility);
ax1=subplot(1,2,1);
hold on;
b=bar([1,2],[mtrial_duration_Path1;mtrial_duration_Path2],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
for i = 1:nSelect
    b(i).CData(1,:) = light_circlemaze_color_for_path{i};b(i).CData(2,:) = light_circlemaze_color_for_path{i};
end
for i = 1:2
    eval(sprintf('e%s=errorbar(x%s, mtrial_duration_Path%s, setrial_duration_Path%s, ''k'', ''linestyle'', ''none'');e%s.Color=errorbar_color;e%s.LineWidth=errorbar_width;',num2str(i),num2str(i),num2str(i),num2str(i),num2str(i),num2str(i)))
end
leg=legend(ax1,paths);leg.FontSize=8;leg.FontWeight='normal';set(leg,'Position',[0.297160712866555 0.576628835987052 0.18958333617165 0.428721538279458]);
legend('boxoff')
ylabel('Trial duration (s)');box off;
ylim([0,30])
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');

subplot(1,2,2)
hold on;
b=bar([1,2],[mtrial_duration_Dir1;mtrial_duration_Dir2],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
for i = 1:2
    b(i).CData(1,:) = light_circlemaze_color_for_direction{i};b(i).CData(2,:) = light_circlemaze_color_for_direction{i};
end
for i = 1:2
    eval(sprintf('e%s=errorbar(x%s, mtrial_duration_Dir%s, setrial_duration_Dir%s, ''k'', ''linestyle'', ''none'');e%s.Color=errorbar_color;e%s.LineWidth=errorbar_width;',num2str(i),num2str(i),num2str(i),num2str(i),num2str(i),num2str(i)))
    eval(sprintf('s%s=scatter(x%s(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3, trial_duration_Dir%s(:,1),scatter_point_size/1.5,circlemaze_color_for_direction{1},''LineWidth'',scatter_point_linewidth);',num2str(i),num2str(i),num2str(i)))
    eval(sprintf('s%s=scatter(x%s(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3, trial_duration_Dir%s(:,2),scatter_point_size/1.5,circlemaze_color_for_direction{2},''LineWidth'',scatter_point_linewidth);',num2str(i),num2str(i),num2str(i)))
end
leg2=legend(directions);leg2.FontSize=8;leg2.FontWeight='normal';set(leg2,'Position',[0.797160712866555 0.676628835987052 0.18958333617165 0.228721538279458]);
legend('boxoff')
ylabel('Trial duration (s)');box off;
ylim([0,30])
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
