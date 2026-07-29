%% Code for Fig. 3l, m
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig3/path_direction_decoding.mat')
path_decoding_accuracy_dir1=path_decoding_accuracy{1};
path_decoding_accuracy_dir2=path_decoding_accuracy{2};

Accuracy_dir1=path_decoding_accuracy_dir1{1};chance_Accuracy_dir1=path_decoding_accuracy_dir1{2};
nAnimals=size(Accuracy_dir1,1);
numBins=size(Accuracy_dir1,2);
Accuracy_dir1=Accuracy_dir1*100;chance_Accuracy_dir1=chance_Accuracy_dir1*100;
mAccuracy_dir1=mean(Accuracy_dir1,1);seAccuracy_dir1=std(Accuracy_dir1,1,1)./sqrt(nAnimals);
mchance_Accuracy_dir1=mean(chance_Accuracy_dir1);sechance_Accuracy_dir1=std(chance_Accuracy_dir1,1,1)./sqrt(nAnimals);

Accuracy_dir2=path_decoding_accuracy_dir2{1};chance_Accuracy_dir2=path_decoding_accuracy_dir2{2};
Accuracy_dir2=Accuracy_dir2*100;chance_Accuracy_dir2=chance_Accuracy_dir2*100;
mAccuracy_dir2=mean(Accuracy_dir2,1);seAccuracy_dir2=std(Accuracy_dir2,1,1)./sqrt(nAnimals);
mchance_Accuracy_dir2=mean(chance_Accuracy_dir2);sechance_Accuracy_dir2=std(chance_Accuracy_dir2,1,1)./sqrt(nAnimals);

Accuracy=direction_decoding_accuracy{1};chance_Accuracy=direction_decoding_accuracy{2};
Accuracy=Accuracy*100;chance_Accuracy=chance_Accuracy*100;
mAccuracy=mean(Accuracy,1);seAccuracy=std(Accuracy,1,1)./sqrt(nAnimals);
mchance_Accuracy=mean(chance_Accuracy);sechance_Accuracy=std(chance_Accuracy,1,1)./sqrt(nAnimals);

%% Path decoding
figure('Position',[500,200,550,400],'Visible',figures_visibility)
sgtitle('Path decoding')
subplot(2,1,1)
title('Rightward')
hold on
e1=errorbar(1:numBins,mAccuracy_dir1,seAccuracy_dir1);e1.Color=circlemaze_color_for_direction{1};e1.LineWidth=errorbar_width;
e2=errorbar(1:numBins,mchance_Accuracy_dir1,sechance_Accuracy_dir1);e2.Color=[0.5,0.5,0.5];e2.LineWidth=errorbar_width;
ylabel('Accuracy (%)');box off
lgd = legend({'Decoded','Shuffled'});set(lgd,'Position',[0.566952374101496 0.790654759277292 0.303142863993742 0.0883928597703273]);
legend('boxoff')
set(gca,'FontSize',12,'FontName', 'Arial','FontWeight', 'normal');
set(gca,'LineWidth',1.5);
set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0,numBins+1]);
ylim([40,80])
xlabel('Spatial progress (%)');
xticks([1,(1+numBins)/2,numBins]);xticklabels({'0','50','100'});

subplot(2,1,2)
title('Leftward')
hold on
e1=errorbar(1:numBins,mAccuracy_dir2,seAccuracy_dir2);e1.Color=circlemaze_color_for_direction{2};e1.LineWidth=errorbar_width;
e2=errorbar(1:numBins,mchance_Accuracy_dir2,sechance_Accuracy_dir2);e2.Color=[0.5,0.5,0.5];e2.LineWidth=errorbar_width;
ylabel('Accuracy (%)');box off
lgd = legend({'Decoded','Shuffled'});set(lgd,'Position',[0.566952374101496 0.290654759277292 0.303142863993742 0.0883928597703273]);
legend('boxoff')
set(gca,'FontSize',12,'FontName', 'Arial','FontWeight', 'normal');
set(gca,'LineWidth',1.5);
set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0,numBins+1]);
ylim([40,80])
xlabel('Spatial progress (%)');
xticks([1,(1+numBins)/2,numBins]);xticklabels({'0','50','100'});

%% Direction decoding
figure('Position',[500,200,550,400],'Visible',figures_visibility)
title('Direction decoding')
hold on
e1=errorbar(1:numBins,mAccuracy,seAccuracy);e1.Color=[255,159,221]./255;e1.LineWidth=errorbar_width;
e2=errorbar(1:numBins,mchance_Accuracy,sechance_Accuracy);e2.Color=[0.5,0.5,0.5];e2.LineWidth=errorbar_width;
ylabel('Accuracy (%)');box off
lgd = legend({'Decoded','Shuffled'});set(lgd,'Position',[0.566952374101496 0.790654759277292 0.303142863993742 0.0883928597703273]);
legend('boxoff')
set(gca,'FontSize',12,'FontName', 'Arial','FontWeight', 'normal');
set(gca,'LineWidth',1.5);
set(gca,'TickLength',[0.03 0.03],'TickDir','out');
xlim([0,numBins+1]);
ylim([40,80])
xlabel('Spatial progress (%)');
xticks([1,(1+numBins)/2,numBins]);xticklabels({'0','50','100'});