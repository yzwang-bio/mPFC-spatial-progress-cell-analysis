%% Code for Fig. 4o
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig4/progress_decoding_trapezoidT.mat')
nAnimals=size(decoding_error,1);
mdecoding_error_dir1=mean(decoding_error,1,'omitmissing');
sedecoding_error_dir1=std(decoding_error,1,1,'omitmissing')./sqrt(nAnimals);
%% Trained on 75% of trials
categ={'Decoded','Shuffled'};
figure('Position',[797 212 280 248],'units','normalized','Visible',figures_visibility);
title('Trained on 75% of trials')% trapezoid T
hold on;
p1=plot([1,2],mdecoding_error_dir1,'LineWidth',1.5,'Color','k');
scatter([1,2],mdecoding_error_dir1,30,'k','filled','LineWidth',scatter_point_linewidth);
scatter(1+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error(:,1),30,[0.8,0.8,0.8],'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');scatter(2+(-0.25 + 0.5 * rand(nAnimals, 1)),decoding_error(:,2),30,[0.8,0.8,0.8],'filled','LineWidth',scatter_point_linewidth,'MarkerEdgeColor','none');
e=errorbar([1,2],mdecoding_error_dir1,sedecoding_error_dir1,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
xticks([1, 2]);xticklabels(categ);
ylabel({'Decoding error','% progress'});box off
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.02 0.02],'TickDir','out');
xlim([0.2,3])
ylim([0,60]);yticks([0,30,60]);