%% Code for Fig1k-n, p
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc; clear all;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig1/numTrial_min_pfc_gi.mat')
numTrial_min1=numTrial_min_pfc_gi{1};numTrial_min2=numTrial_min_pfc_gi{2};
nAnimals=size(numTrial_min1,1);
mnumTrial_min1 = mean(numTrial_min1, 1, 'omitmissing'); senumTrial_min1 = std(numTrial_min1, 1, 1, 'omitmissing') ./ sqrt(nAnimals);
mnumTrial_min2 = mean(numTrial_min2, 1, 'omitmissing'); senumTrial_min2 = std(numTrial_min2, 1, 1, 'omitmissing') ./ sqrt(nAnimals);
load('Fig1/random_pause_pfc_gi.mat')
random_pause1=random_pause_pfc_gi{1};random_pause2=random_pause_pfc_gi{2};
nAnimals=size(random_pause1,1);
mrandom_pause1 = mean(random_pause1, 1, 'omitmissing'); serandom_pause1 = std(random_pause1, 1, 1, 'omitmissing') ./ sqrt(nAnimals);
mrandom_pause2 = mean(random_pause2, 1, 'omitmissing'); serandom_pause2 = std(random_pause2, 1, 1, 'omitmissing') ./ sqrt(nAnimals);
load('Fig1/choice_time_pfc_gi.mat')
choice_time1=choice_time_pfc_gi{1};choice_time2=choice_time_pfc_gi{2};
nAnimals=size(choice_time1,1);
mchoice_time1 = mean(choice_time1, 1, 'omitmissing'); sechoice_time1 = std(choice_time1, 1, 1, 'omitmissing') ./ sqrt(nAnimals);
mchoice_time2 = mean(choice_time2, 1, 'omitmissing'); sechoice_time2 = std(choice_time2, 1, 1, 'omitmissing') ./ sqrt(nAnimals);
load('Fig1/numIncompleteTrials_pfc_gi.mat')
numIncompleteTrials1=numIncompleteTrials_pfc_gi{1};numIncompleteTrials2=numIncompleteTrials_pfc_gi{2};
nAnimals=size(numIncompleteTrials1,1);
mnumIncompleteTrials1 = mean(numIncompleteTrials1, 1, 'omitmissing'); senumIncompleteTrials1 = std(numIncompleteTrials1, 1, 1, 'omitmissing') ./ sqrt(nAnimals);
mnumIncompleteTrials2 = mean(numIncompleteTrials2, 1, 'omitmissing'); senumIncompleteTrials2 = std(numIncompleteTrials2, 1, 1, 'omitmissing') ./ sqrt(nAnimals);
load('Fig1/preference_index_pfc_gi.mat')
preference_index1=preference_index_pfc_gi{1};preference_index2=preference_index_pfc_gi{2};
nAnimals=size(preference_index1,1);
mpreference_index1 = mean(preference_index1, 1, 'omitmissing'); sepreference_index1 = std(preference_index1, 1, 1, 'omitmissing') ./ sqrt(nAnimals);
mpreference_index2 = mean(preference_index2, 1, 'omitmissing'); sepreference_index2 = std(preference_index2, 1, 1, 'omitmissing') ./ sqrt(nAnimals);

%%
categ={'Naive','Trained'};
figure
hold on;
b=bar([1,2],[mnumTrial_min1;mnumTrial_min2],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
b(1).CData(1,:) = light_color_saline;b(1).CData(2,:) = light_color_saline;b(2).CData(1,:) = light_color_cno;b(2).CData(2,:) = light_color_cno;
e1=errorbar([x1(1),x2(1)],[mnumTrial_min1(1),mnumTrial_min2(1)],[senumTrial_min1(1),senumTrial_min2(1)],'.');e1.Color=errorbar_color;e1.LineWidth=errorbar_width;e1.CapSize=18/1.5;
s1=scatter([x1(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [numTrial_min1(:,1),numTrial_min2(:,1)],scatter_point_size/1.5,color_saline,'LineWidth',scatter_point_linewidth);
e2=errorbar([x1(2),x2(2)],[mnumTrial_min1(2),mnumTrial_min2(2)],[senumTrial_min1(2),senumTrial_min2(2)],'.');e2.Color=errorbar_color;e2.LineWidth=errorbar_width;e2.CapSize=18/1.5;
s2=scatter([x1(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [numTrial_min1(:,2),numTrial_min2(:,2)],scatter_point_size/1.5,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Trials / min');box off;
ylim([0,8]);yticks([0,2,4,6,8])
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
leg=legend({'Saline','CNO'},'Location','northeast');leg.FontSize=8;leg.FontWeight='normal';set(leg,'Position',[0.775763604382151 0.804071427320253 0.153316328650661 0.0841836759717404],'FontSize',10);
legend('boxoff')

figure
hold on;
b=bar([1,2],[mrandom_pause1;mrandom_pause2],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
b(1).CData(1,:) = light_color_saline;b(1).CData(2,:) = light_color_saline;b(2).CData(1,:) = light_color_cno;b(2).CData(2,:) = light_color_cno;
e1=errorbar([x1(1),x2(1)],[mrandom_pause1(1),mrandom_pause2(1)],[serandom_pause1(1),serandom_pause2(1)],'.');e1.Color=errorbar_color;e1.LineWidth=errorbar_width;e1.CapSize=18/1.5;
s1=scatter([x1(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [random_pause1(:,1),random_pause2(:,1)],scatter_point_size/1.5,color_saline,'LineWidth',scatter_point_linewidth);
e2=errorbar([x1(2),x2(2)],[mrandom_pause1(2),mrandom_pause2(2)],[serandom_pause1(2),serandom_pause2(2)],'.');e2.Color=errorbar_color;e2.LineWidth=errorbar_width;e2.CapSize=18/1.5;
s2=scatter([x1(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [random_pause1(:,2),random_pause2(:,2)],scatter_point_size/1.5,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Random pause (%)');box off;
ylim([0,80]);yticks([0,20,40,60,80])
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
leg=legend({'Saline','CNO'},'Location','northeast');leg.FontSize=8;leg.FontWeight='normal';set(leg,'Position',[0.775763604382151 0.804071427320253 0.153316328650661 0.0841836759717404],'FontSize',10);
legend('boxoff')

figure
hold on;
b=bar([1,2],[mchoice_time1;mchoice_time2],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
b(1).CData(1,:) = light_color_saline;b(1).CData(2,:) = light_color_saline;b(2).CData(1,:) = light_color_cno;b(2).CData(2,:) = light_color_cno;
e1=errorbar([x1(1),x2(1)],[mchoice_time1(1),mchoice_time2(1)],[sechoice_time1(1),sechoice_time2(1)],'.');e1.Color=errorbar_color;e1.LineWidth=errorbar_width;e1.CapSize=18/1.5;
s1=scatter([x1(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [choice_time1(:,1),choice_time2(:,1)],scatter_point_size/1.5,color_saline,'LineWidth',scatter_point_linewidth);
e2=errorbar([x1(2),x2(2)],[mchoice_time1(2),mchoice_time2(2)],[sechoice_time1(2),sechoice_time2(2)],'.');e2.Color=errorbar_color;e2.LineWidth=errorbar_width;e2.CapSize=18/1.5;
s2=scatter([x1(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [choice_time1(:,2),choice_time2(:,2)],scatter_point_size/1.5,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Choice time (s)');box off;
ylim([0,9]);yticks([0,3,6,9])
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
leg=legend({'Saline','CNO'},'Location','northeast');leg.FontSize=8;leg.FontWeight='normal';set(leg,'Position',[0.775763604382151 0.804071427320253 0.153316328650661 0.0841836759717404],'FontSize',10);
legend('boxoff')

figure
hold on;
b=bar([1,2],[mnumIncompleteTrials1;mnumIncompleteTrials2],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
b(1).CData(1,:) = light_color_saline;b(1).CData(2,:) = light_color_saline;b(2).CData(1,:) = light_color_cno;b(2).CData(2,:) = light_color_cno;
e1=errorbar([x1(1),x2(1)],[mnumIncompleteTrials1(1),mnumIncompleteTrials2(1)],[senumIncompleteTrials1(1),senumIncompleteTrials2(1)],'.');e1.Color=errorbar_color;e1.LineWidth=errorbar_width;e1.CapSize=18/1.5;
s1=scatter([x1(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [numIncompleteTrials1(:,1),numIncompleteTrials2(:,1)],scatter_point_size/1.5,color_saline,'LineWidth',scatter_point_linewidth);
e2=errorbar([x1(2),x2(2)],[mnumIncompleteTrials1(2),mnumIncompleteTrials2(2)],[senumIncompleteTrials1(2),senumIncompleteTrials2(2)],'.');e2.Color=errorbar_color;e2.LineWidth=errorbar_width;e2.CapSize=18/1.5;
s2=scatter([x1(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [numIncompleteTrials1(:,2),numIncompleteTrials2(:,2)],scatter_point_size/1.5,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Incomplete trials (%)');box off;
ylim([0,60]);yticks([0,20,40,60])
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
leg=legend({'Saline','CNO'},'Location','northeast');leg.FontSize=8;leg.FontWeight='normal';set(leg,'Position',[0.775763604382151 0.804071427320253 0.153316328650661 0.0841836759717404],'FontSize',10);
legend('boxoff')

figure
hold on;
b=bar([1,2],[mpreference_index1;mpreference_index2],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
b(1).CData(1,:) = light_color_saline;b(1).CData(2,:) = light_color_saline;b(2).CData(1,:) = light_color_cno;b(2).CData(2,:) = light_color_cno;
e1=errorbar([x1(1),x2(1)],[mpreference_index1(1),mpreference_index2(1)],[sepreference_index1(1),sepreference_index2(1)],'.');e1.Color=errorbar_color;e1.LineWidth=errorbar_width;e1.CapSize=18/1.5;
s1=scatter([x1(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [preference_index1(:,1),preference_index2(:,1)],scatter_point_size/1.5,color_saline,'LineWidth',scatter_point_linewidth);
e2=errorbar([x1(2),x2(2)],[mpreference_index1(2),mpreference_index2(2)],[sepreference_index1(2),sepreference_index2(2)],'.');e2.Color=errorbar_color;e2.LineWidth=errorbar_width;e2.CapSize=18/1.5;
s2=scatter([x1(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [preference_index1(:,2),preference_index2(:,2)],scatter_point_size/1.5,color_cno,'LineWidth',scatter_point_linewidth);
ylabel('Preference index');box off;
ylim([0.2,1]);
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
leg=legend({'Saline','CNO'},'Location','northeast');leg.FontSize=8;leg.FontWeight='normal';set(leg,'Position',[0.775763604382151 0.804071427320253 0.153316328650661 0.0841836759717404],'FontSize',10);
legend('boxoff')