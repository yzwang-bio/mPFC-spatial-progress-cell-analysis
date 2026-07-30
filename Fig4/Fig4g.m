%% Code for Fig. 4g
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig4/progress_decoding_singlepath.mat')
nAnimals=size(decoding_error{1},1);
mdecoding_error=cellfun(@(x) mean(x,1,'omitmissing'),decoding_error,'UniformOutput',false);
sedecoding_error=cellfun(@(x) std(x,1,1,'omitmissing')./sqrt(nAnimals),decoding_error,'UniformOutput',false);

%% Decoding error for spatial progress calculated using binned neuronal activity from trials in three paths as the training dataset and trials in the other path as the test dataset
categ={'Naive','Trained'};
figure('Position',[654.1429 659.2857 734.2857 253.7143]);title({'Decoding error for spatial progress calculated using binned neuronal activity from trials in three paths ','as the training dataset and trials in the other path as the test dataset'},'Visible',figures_visibility)
hold on
for i=1:size(decoding_error,2)
    % b=bar([2*i-1,2*i],[mdecoding_error{i}(1),mdecoding_error{i}(2)],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
    % b.CData=[[255,159,221]./255;0.8,0.8,0.8];
    s1=scatter(2*i-1+rand(nAnimals,1)*0.5-0.25,decoding_error{i}(:,1),35,'filled','LineWidth',1.5,'MarkerEdgeColor',[182,114,158]./255,'MarkerFaceColor',[182,114,158]./255);
    s2=scatter(2*i+rand(nAnimals,1)*0.5-0.25,decoding_error{i}(:,2),35,'filled','LineWidth',1.5,'MarkerEdgeColor',[0.8,0.8,0.8],'MarkerFaceColor',[0.8,0.8,0.8]);
    e=errorbar([2*i-1,2*i],[mdecoding_error{i}(1),mdecoding_error{i}(2)],[sedecoding_error{i}(1),sedecoding_error{i}(2)],'LineWidth',errorbar_width);
    e.Color='k';e.CapSize=18;
end
xticks(1.5:2:8.5);xticklabels({'Long','Zigzag','Direct','Short'});
ylim([0,60]);yticks([0,30,60]);
ylabel({'Decoding error','% progress'})
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');

h1 = scatter(NaN, NaN, scatter_point_size, [182,114,158]./255, 'filled', 'LineWidth', scatter_point_linewidth, 'DisplayName', 'Decoded');
h2 = scatter(NaN, NaN, scatter_point_size, [0.8,0.8,0.8], 'filled', 'LineWidth', scatter_point_linewidth, 'DisplayName', 'Shuffled');
legend([h1, h2], 'Location', 'best');
