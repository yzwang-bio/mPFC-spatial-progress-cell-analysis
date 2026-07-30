function colorList=CMap(type,num)
% 不指定获取颜色个数会默认256色
% CMap(‘rainbow’)
% CMap(163)
% 第二个参数可以指定获取颜色数量，例如获取30颜色：
% 
% CMap(‘rainbow’,30)
% CMap(163,30)
% 将获取的颜色放入colormap函或者某些图像的CData即可，例如：
% 

% 集聚200种colormap
% WYZ
if nargin<2
    num=256;
end
if nargin<1
    type='';
end

CMap_Data=load('slanCM_Data.mat');
CList_Data=[CMap_Data.slandarerCM(:).Colors];

if isnumeric(type)
    Cmap=CList_Data{type};
else
    Cpos=strcmpi(type,CMap_Data.fullNames);
    Cmap=CList_Data{Cpos};
end

Ci=1:256;Cq=linspace(1,256,num);
colorList=[interp1(Ci,Cmap(:,1),Cq,'linear')',...
           interp1(Ci,Cmap(:,2),Cq,'linear')',...
           interp1(Ci,Cmap(:,3),Cq,'linear')'];
end