%% Code for Fig. 2n
% Created by Yizheng Wang
% Contact: yz_wang@zju.edu.cn for bug reports or questions.

clear; close all; clc;
bar_edgecolor='k';bar_linewidth=1.5;
scatter_point_color='k';scatter_point_size=35;scatter_point_linewidth=1.5;
errorbar_color='k';errorbar_width=1.5;
circlemaze_color_schedule
figures_visibility='on';

%%
load('Fig2/pcell_overlap.mat')
mpub_pcell_pct=[mean(pub_pcell_pct_before,1,'omitmissing'),mean(pub_pcell_pct_after,1,'omitmissing')];
sepub_pcell_pct=[std(pub_pcell_pct_before,1,1,'omitmissing')./sqrt(length(pub_pcell_pct_before)),std(pub_pcell_pct_after,1,1,'omitmissing')./sqrt(length(pub_pcell_pct_after))];
mpub_pcell_pct_shuffle=[mean(pub_pcell_pct_before_shuffle,1,'omitmissing'),mean(pub_pcell_pct_after_shuffle,1,'omitmissing')];
sepub_pcell_pct_shuffle=[std(pub_pcell_pct_before_shuffle,1,1,'omitmissing')./sqrt(length(pub_pcell_pct_before_shuffle)),std(pub_pcell_pct_after_shuffle,1,1,'omitmissing')./sqrt(length(pub_pcell_pct_after_shuffle))];

%%
categ=categorical({'Naive','Trained'});categ = reordercats(categ,{'Naive','Trained'});
figure
hold on;
b=bar([1,2],[mpub_pcell_pct;mpub_pcell_pct_shuffle]','EdgeColor',bar_edgecolor,'LineWidth',bar_linewidth,'FaceColor','flat');
xticks([1, 2]);xticklabels(categ);
drawnow
x1 = bsxfun(@plus, 1, [b.XOffset]');
x2 = bsxfun(@plus, 2, [b.XOffset]');
b(1).CData(1,:) =color_before;b(1).CData(2,:) =color_after;
b(2).CData(1,:) = lighten_color(light_color_before,0.5);b(2).CData(2,:) =lighten_color(light_color_after,0.5);
e=errorbar([x1(1),x2(1)],mpub_pcell_pct,sepub_pcell_pct,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
e=errorbar([x1(2),x2(2)],mpub_pcell_pct_shuffle,sepub_pcell_pct_shuffle,'.');e.Color=errorbar_color;e.LineWidth=errorbar_width;e.CapSize=18;
ylabel('Percentage (%)');box off;
set(gca,'LineWidth',1.5);set(gca,'TickLength',[0.03 0.03],'TickDir','out');
ylim([0,20])
% dark: real; light: shuffle