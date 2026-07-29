function max_win(handle)
% 最大化窗口
% WYZ
screenSize = get(0, 'ScreenSize');

set(handle, 'Position', screenSize);
end