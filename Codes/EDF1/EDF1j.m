%% Code for Extended Data Fig. 1j
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('EDF1/intertrial_interval_pfc_gi.mat')
intertrial_interval1=intertrial_interval_pfc_gi{1};intertrial_interval2=intertrial_interval_pfc_gi{2};
nAnimals=size(intertrial_interval1,1);
mintertrial_interval1 = mean(intertrial_interval1, 1, 'omitmissing'); seintertrial_interval1 = std(intertrial_interval1, 1, 1, 'omitmissing') ./ sqrt(nAnimals);
mintertrial_interval2 = mean(intertrial_interval2, 1, 'omitmissing'); seintertrial_interval2 = std(intertrial_interval2, 1, 1, 'omitmissing') ./ sqrt(nAnimals);

%%
categ={'Naive','Trained'};
figure('Position',[817 812.4286 422.2857 219.5714],'Visible',figures_visibility);
hold on;
b=bar([1,2],[mintertrial_interval1;mintertrial_interval2],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
b(1).CData(1,:) = light_color_saline;b(1).CData(2,:) = light_color_saline;b(2).CData(1,:) = light_color_cno;b(2).CData(2,:) = light_color_cno;
e1=errorbar([x1(1),x2(1)],[mintertrial_interval1(1),mintertrial_interval2(1)],[seintertrial_interval1(1),seintertrial_interval2(1)],'.');e1.Color=errorbar_color;e1.LineWidth=errorbar_width;e1.CapSize=18/1.5;
s1=scatter([x1(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [intertrial_interval1(:,1),intertrial_interval2(:,1)],scatter_point_size/1.5,color_saline,'LineWidth',scatter_point_linewidth);
e2=errorbar([x1(2),x2(2)],[mintertrial_interval1(2),mintertrial_interval2(2)],[seintertrial_interval1(2),seintertrial_interval2(2)],'.');e2.Color=errorbar_color;e2.LineWidth=errorbar_width;e2.CapSize=18/1.5;
s2=scatter([x1(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [intertrial_interval1(:,2),intertrial_interval2(:,2)],scatter_point_size/1.5,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Inter-trial interval (s)');box off;
ylim([0,15]);yticks([0,5,10,15])
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
leg=legend({'Saline','CNO'},'Location','northeast');leg.FontSize=8;leg.FontWeight='normal';set(leg,'Position',[0.775763604382151 0.804071427320253 0.153316328650661 0.0841836759717404],'FontSize',10);
legend('boxoff')