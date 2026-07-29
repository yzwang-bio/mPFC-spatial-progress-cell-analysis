%% Code for Fig. 6k
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig6/path_decoding_inactivateHPCtoPFC.mat')
path_decoding_accuracy_dir1=path_decoding_accuracy{1};
path_decoding_accuracy_dir2=path_decoding_accuracy{2};

Accuracy_saline_dir1=path_decoding_accuracy_dir1{1};Accuracy_cno_dir1=path_decoding_accuracy_dir1{2};
nAnimals=size(Accuracy_saline_dir1,1);
numBins=size(Accuracy_saline_dir1,2);
Accuracy_saline_dir1=Accuracy_saline_dir1*100;Accuracy_cno_dir1=Accuracy_cno_dir1*100;
mAccuracy_saline_dir1=mean(Accuracy_saline_dir1,1);seAccuracy_saline_dir1=std(Accuracy_saline_dir1,1,1)./sqrt(nAnimals);
mAccuracy_cno_dir1=mean(Accuracy_cno_dir1);seAccuracy_cno_dir1=std(Accuracy_cno_dir1,1,1)./sqrt(nAnimals);

Accuracy_saline_dir2=path_decoding_accuracy_dir2{1};Accuracy_cno_dir2=path_decoding_accuracy_dir2{2};
Accuracy_saline_dir2=Accuracy_saline_dir2*100;Accuracy_cno_dir2=Accuracy_cno_dir2*100;
mAccuracy_saline_dir2=mean(Accuracy_saline_dir2,1);seAccuracy_saline_dir2=std(Accuracy_saline_dir2,1,1)./sqrt(nAnimals);
mAccuracy_cno_dir2=mean(Accuracy_cno_dir2);seAccuracy_cno_dir2=std(Accuracy_cno_dir2,1,1)./sqrt(nAnimals);

%% Path decoding
figure('Position',[500,200,550,400],'Visible',figures_visibility)
sgtitle('Path decoding')
subplot(2,1,1)
title('Rightward')
hold on
e1=errorbar(1:numBins,mAccuracy_saline_dir1,seAccuracy_saline_dir1);e1.Color=color_saline;e1.LineWidth=errorbar_width;
e2=errorbar(1:numBins,mAccuracy_cno_dir1,seAccuracy_cno_dir1);e2.Color=color_cno;e2.LineWidth=errorbar_width;
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
e1=errorbar(1:numBins,mAccuracy_saline_dir2,seAccuracy_saline_dir2);e1.Color=color_saline;e1.LineWidth=errorbar_width;
e2=errorbar(1:numBins,mAccuracy_cno_dir2,seAccuracy_cno_dir2);e2.Color=color_cno;e2.LineWidth=errorbar_width;
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
