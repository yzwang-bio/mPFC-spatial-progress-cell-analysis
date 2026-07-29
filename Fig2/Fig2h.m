%% Code for Fig. 2h
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig2/pct_pcell.mat')
num_pcell_before=pct_pcell{1};
num_pcell_after=pct_pcell{2};
nAnimals=size(num_pcell_before,1);
l={'before','after'};
for dd=1:length(l)
    eval(sprintf('mnum_pcell_%s=mean(num_pcell_%s,1);senum_pcell_%s=std(num_pcell_%s,1,1)./sqrt(nAnimals);',l{dd},l{dd},l{dd},l{dd}))
end

%%
categ=categorical({'Rightward','Leftward'});categ = reordercats(categ,{'Rightward','Leftward'});
figure('Position',[797 612 600 560],'units','normalized','Visible',figures_visibility);
subplot(2,2,1);
hold on;
b=bar([1,2],[mnum_pcell_before',mnum_pcell_after'],'EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
b(1).CData(1,:) = light_color_before;b(1).CData(2,:) = light_color_before;
b(2).CData(1,:) = light_color_after;b(2).CData(2,:) = light_color_after;
s1=scatter([x1(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(1)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [num_pcell_before(:,1),num_pcell_before(:,2)],scatter_point_size/1.5,color_before,'LineWidth',scatter_point_linewidth);
s2=scatter([x1(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3,x2(2)+(-0.25 + 0.5 * rand(nAnimals, 1))/3], [num_pcell_after(:,1),num_pcell_after(:,2)],scatter_point_size/1.5,color_after,'LineWidth',scatter_point_linewidth);
e1=errorbar([x1(1),x1(2)],[mnum_pcell_before(1),mnum_pcell_after(1)],[senum_pcell_before(1),senum_pcell_after(1)],'.');e1.Color=errorbar_color;e1.LineWidth=errorbar_width;e1.CapSize=18/1.5;
e2=errorbar([x2(1),x2(2)],[mnum_pcell_before(2),mnum_pcell_after(2)],[senum_pcell_before(2),senum_pcell_after(2)],'.');e2.Color=errorbar_color;e2.LineWidth=errorbar_width;e2.CapSize=18/1.5;
ylabel('Percentage (%)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
ylim([0,0.4]);yticks([0,0.20,0.40]);
ax = gca;ax.YAxis.TickLabels = ax.YAxis.TickValues * 100;
leg=legend({'Naive','Trained'},'Location','northeast');leg.FontSize=8;leg.FontWeight='normal';set(leg,'Position',[0.740261903675234 0.719532829169585 0.148809525982863 0.0892857169935739],'FontSize',10);
legend('boxoff')