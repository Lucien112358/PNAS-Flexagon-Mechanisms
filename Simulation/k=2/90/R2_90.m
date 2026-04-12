%%计算三角形6R杆件的各个角度曲线并绘制
clear all
nmax=4;
Ev=zeros(1,nmax-2);
Esum=zeros(1,nmax-2);
for n=4:nmax
    thn_p = cell(1, n);
    alp=pi-pi*(n-2)/n;
    
    %alp=5/3*pi
    % 定义th2的范围（弧度）
    %th2_values_rad = linspace(0, pi, 120); %3R时
    th2_values_rad = linspace(0.01, pi-0.02, 120);%2R时起始容易爆炸
    th3_values_rad = ones(1,120)*pi;
    
    % 将th2从弧度转换为角度
    th2_values_deg = rad2deg(th2_values_rad);
    th3_values_deg = rad2deg(th3_values_rad);
    
    % 预分配th1_values数组
    th1_values_rad = zeros(size(th2_values_rad));
    

    % 定义匿名函数表示方程
    equation = @(th1, th2)  1/((tan(th1/2) + tan(th2/2) - tan(alp/2)^2*tan(th1/2) + tan(alp/2)^2*tan(th2/2))/(tan(alp/2)^2 + tan(th1/2)*tan(th2/2) + tan(alp/2)^2*tan(th1/2)*tan(th2/2) - 1))^2
    %equation = @(th1, th2)  ((tan(th1/2) + tan(th2/2) - tan(alp/2)^2*tan(th1/2) + tan(alp/2)^2*tan(th2/2))/(tan(alp/2)^2 + tan(th1/2)*tan(th2/2) + tan(alp/2)^2*tan(th1/2)*tan(th2/2) - 1))^2 - abs(3-2*sin(alp)^2*(1+cos(th2)));%3R
    %equation = @(th1, th2)  ((tan(th1/2) + tan(th2/2) - tan(alp/2)^2*tan(th1/2) + tan(alp/2)^2*tan(th2/2))/(tan(alp/2)^2 + tan(th1/2)*tan(th2/2) + tan(alp/2)^2*tan(th1/2)*tan(th2/2) - 1))^2-abs(1-sin(alp)^2*(1+cos(th2)));

    % 初始猜测值
    %initial_guess = 0; %3R时
    %initial_guess = pi-0.01; %2R时
    initial_guess = 0; %3R时
    if n>4
        initial_guess = pi/2;
    end
    
    % 逐个求解th1对应每个th2
    for i = 1:length(th2_values_rad)
        th2 = th2_values_rad(i);
        th1_values_rad(i) = fsolve(@(th1) equation(th1, th2), initial_guess);
    end
    
    % 将th1从弧度转换为角度
    th1_values_deg = rad2deg(th1_values_rad);

    % 去除非存在位置，将起始位置设为th1=th2时，也就是类平面态

    % index = 1:length(th1_values_deg);
    % indexv=length(index);
    index = 0 < th2_values_deg;
    indexv=sum(index);
    %index = th1_values_deg < th2_values_deg; %n=3,4
    %index = 104 < th2_values_deg; %n=5
    %index = 110 < th2_values_deg; %n=6
    %index = 112 < th2_values_deg; %n=7
    
    th1_values_deg=th1_values_deg(index);
    th2_values_deg=th2_values_deg(index);
    th3_values_deg=repmat(th3_values_deg(index),1,n-2);
    

    
    % 将数据首尾相接
    thn_p{1} = [th1_values_deg, flip(th1_values_deg), th2_values_deg, th3_values_deg, th3_values_deg, flip(th2_values_deg)];
    for i = 2:n
    % 循环移位
        thn_p{i} = circshift(thn_p{i-1}, [0, -2*indexv]);
    end
    t=linspace(0, 20, length(thn_p{1}));
    pplotn(thn_p);
    % th2_p = [th2_values_deg, th3_values_deg, th3_values_deg, flip(th2_values_deg), th1_values_deg, flip(th1_values_deg)];
    % th3_p = [th3_values_deg, flip(th2_values_deg), th1_values_deg, flip(th1_values_deg), th2_values_deg, th3_values_deg];
    %pplot(th1_p,th2_p,th3_p);
    %energyplot(th1_p,th2_p,th3_p);

    %pplot(th1_p,th2_p,th3_p)

    % % 计算曲线
    % curve1 = 1/2 * (th1_p/180*pi).^2;
    % curve2 = 1/2 * (th2_p/180*pi).^2;
    % curve3 = 1/2 * (th3_p/180*pi).^2;
    % % 计算曲线和
    % curve_sum = 3*(curve1 + curve2 + (n-2)*curve3);
    % Esum(n-2)=(max(curve_sum)-min(curve_sum));
    % Ev(n-2)=(max(curve_sum)-min(curve_sum))/mean(curve_sum);

end
% 绘制第一幅图
figure;
% 绘制第一幅子图
subplot(2, 1, 1); % 创建2行1列的子图，当前为第1个子图
plot(log10(Esum), 'LineWidth', 1.5, 'Color', 'b'); % 设置线条宽度和颜色
title('Logarithm of Esum', 'FontSize', 14); % 设置标题和字体大小
xlabel('n', 'FontSize', 12); % 设置X轴标签和字体大小
ylabel('log_{10}(Esum)', 'FontSize', 12); % 设置Y轴标签和字体大小
grid on; % 打开网格线
set(gca, 'FontSize', 12); % 设置坐标轴刻度字体大小
set(gcf, 'Color', 'w'); % 设置背景颜色为白色

% 绘制第二幅子图
subplot(2, 1, 2); % 创建2行1列的子图，当前为第2个子图
plot(Ev, 'LineWidth', 1.5, 'Color', 'r'); % 设置线条宽度和颜色
title('Ev', 'FontSize', 14); % 设置标题和字体大小
xlabel('n', 'FontSize', 12); % 设置X轴标签和字体大小
ylabel('Ev', 'FontSize', 12); % 设置Y轴标签和字体大小
grid on; % 打开网格线
set(gca, 'FontSize', 12); % 设置坐标轴刻度字体大小
set(gcf, 'Color', 'w'); % 设置背景颜色为白色

function pplot(th1_p,th2_p,th3_p)
    % 创建极坐标图
    figure;
    set(gcf, 'Color', 'w');
    polaraxes; % 创建一个新的极坐标轴
    hold on;
    % 设置极坐标图属性
    ax = gca;
    ax.ThetaAxis.Visible = 'off'; % 不显示极角轴线和刻度
    ax.RTickLabel = ''; % 不显示 r 刻度值 
    % 转换角度为弧度
    theta1 = deg2rad(th1_p);
    theta2 = deg2rad(th2_p);
    theta3 = deg2rad(th3_p);
    % 绘制极坐标图
    polarplot(theta1/pi*180, 'Color', [0.6 0.2 0.8], 'LineWidth', 3, 'DisplayName', '\theta_{i}'); % 紫色
    hold on; % 将图形保持在同一图中
    polarplot(theta2/pi*180, 'Color', [1 0.4 0.4], 'LineWidth', 3, 'DisplayName', '\theta_{i+1}'); % 红色
    polarplot(theta3/pi*180, 'Color', [0.2 0.6 0.2], 'LineWidth', 3, 'DisplayName', '\theta_{i+2}'); % 绿色
    % 添加图例
    legend('show', 'Location', 'best');
    % 添加标题
    title('Flip Path in Polar Coordinates', 'FontSize', 14, 'FontWeight', 'bold');
    rticks([0 60 120 180]); % 设置 r 刻度为每一档 60
    % 设置字体
    set(gca, 'FontName', 'Arial', 'FontSize', 10);
    hold off;
    
    % 创建笛卡尔坐标图
    figure;
    set(gcf, 'Color', 'w');
    hold on;
    % 绘制极坐标图
    plot(theta1/pi*180, 'Color', [0.6 0.2 0.8], 'LineWidth', 3, 'DisplayName', '\theta_{i}'); % 紫色
    hold on; % 将图形保持在同一图中
    plot(theta2/pi*180, 'Color', [1 0.4 0.4], 'LineWidth', 3, 'DisplayName', '\theta_{i+1}'); % 红色
    plot(theta3/pi*180, 'Color', [0.2 0.6 0.2], 'LineWidth', 3, 'DisplayName', '\theta_{i+2}'); % 绿色
    % 设置字体
    set(gca, 'FontName', 'Arial', 'FontSize', 10);
    yticks([0 60 120 180]); % 设置 y 刻度为每一档 60
    xin=length(th1_p)/3;
    xticks([xin 2*xin 3*xin]);
    xticklabels({'1', '2', '3'});
    xlim([0 720])
    grid on;
    hold off;
    
    figure;
    set(gcf, 'Color', 'w');
    % 半径
    r = 1;
    % 上半球极坐标线
    phi_up = linspace(0, 2*pi, numel(th1_p));
    [x1_up, y1_up, z1_up] = sph2cart(phi_up, pi/2 - theta1/2, r);
    [x2_up, y2_up, z2_up] = sph2cart(phi_up, pi/2 - theta2/2, r);
    [x3_up, y3_up, z3_up] = sph2cart(phi_up, pi/2 - theta3/2, r);
    % 下半球极坐标线
    [x1_down, y1_down, z1_down] = sph2cart(phi_up, -pi/2 + theta1/2, r);
    [x2_down, y2_down, z2_down] = sph2cart(phi_up, -pi/2 + theta2/2, r);
    [x3_down, y3_down, z3_down] = sph2cart(phi_up, -pi/2 + theta3/2, r);
    % 绘制上半球
    plot3(x1_up, y1_up, z1_up, 'Color', [0.6 0.2 0.8], 'LineWidth', 3, 'DisplayName', '\theta_1 上半球');
    hold on;
    plot3(x2_up, y2_up, z2_up, 'Color', [1 0.4 0.4], 'LineWidth', 3, 'DisplayName', '\theta_2 上半球');
    plot3(x3_up, y3_up, z3_up, 'Color', [0.2 0.6 0.2], 'LineWidth', 3, 'DisplayName', '\theta_3 上半球');
    % 绘制下半球
    plot3(x1_down, y1_down, z1_down, 'Color', [0.6 0.2 0.8], 'LineWidth', 3, 'DisplayName', '\theta_1 下半球');
    plot3(x2_down, y2_down, z2_down, 'Color', [1 0.4 0.4], 'LineWidth',3, 'DisplayName', '\theta_2 下半球');
    plot3(x3_down, y3_down, z3_down, 'Color', [0.2 0.6 0.2],'LineWidth', 3, 'DisplayName', '\theta_3 下半球');
    % 添加图例
    legend('show', 'Location', 'best');
    % 添加坐标轴标签
    xlabel('X', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Y', 'FontSize', 12, 'FontWeight', 'bold');
    zlabel('Z', 'FontSize', 12, 'FontWeight', 'bold');
    % 添加标题
    title('Flip Path in Spherical Coordinates', 'FontSize', 14, 'FontWeight', 'bold');
    % 显示网格
    axis equal;
    % 隐藏坐标轴和网格线
    ax = gca;
    ax.XColor = 'none'; % 隐藏X轴
    ax.YColor = 'none'; % 隐藏Y轴
    ax.ZColor = 'none'; % 隐藏Z轴
    ax.GridColor = 'none'; % 隐藏网格线
    % 设置字体
    set(gca, 'FontName', 'Arial', 'FontSize', 10);
    hold off;
end

function curve_sum=energyplot(th1_p,th2_p,th3_p)
    %energy
    % 计算曲线
    curve1 = 1/2 * (th1_p/180*pi).^2;
    curve2 = 1/2 * (th2_p/180*pi).^2;
    curve3 = 1/2 * (th3_p/180*pi).^2;
    
    % 计算曲线和
    curve_sum = curve1 + curve2 + curve3;
    
    % 绘制原始三条曲线
    figure;
    set(gcf, 'Color', 'w');
    subplot(2, 1, 1);
    hold on;
    plot(curve1, 'Color', [0.85, 0.33, 0.1], 'LineWidth', 2, 'DisplayName', '\theta_1 曲线');
    plot(curve2, 'Color', [0.47, 0.67, 0.19], 'LineWidth', 2, 'DisplayName', '\theta_2 曲线');
    plot(curve3, 'Color', [0.3, 0.75, 0.93], 'LineWidth', 2, 'DisplayName', '\theta_3 曲线');
    
    % 添加图例
    legend;
    
    % 添加坐标轴标签
    xlabel('Index');
    ylabel('Energy');
    
    % 添加标题
    title('Three-joint energy change diagram');
    
    % 显示网格
    grid on;
    hold off;
    
    % 绘制曲线和
    subplot(2, 1, 2);
    plot(curve_sum, 'Color', [0.49, 0.18, 0.56], 'LineWidth', 2, 'DisplayName', '曲线和');
    legend;
    xlabel('Index');
    ylabel('Sum of Energy');
    title('Three-joint energy sum');
    grid on;
end

function pplotn(thn_p)
    % 假设 thn_p 是一个 cell array，每个 cell 包含一条曲线的数据

    % 获取曲线数量
    n = numel(thn_p);
    
    % 创建极坐标图
    figure;
    set(gcf, 'Color', 'w');
    polaraxes; % 创建一个新的极坐标轴
    hold on;
    
    % 设置极坐标图属性
    ax = gca;
    ax.ThetaAxis.Visible = 'off'; % 不显示极角轴线和刻度
    ax.RTickLabel = ''; % 不显示 r 刻度值
    
    % 循环绘制每条曲线
    for i = 1:n
        % 转换角度为弧度
        theta = deg2rad(thn_p{i});
        
        % 绘制极坐标图
        polarplot(theta/pi*180, 'LineWidth', 3, 'DisplayName', ['\theta_{' num2str(i) '}']); % 根据曲线编号设置颜色和线宽
    end
    
    % 添加图例
    legend('show', 'Location', 'best');
    
    % 添加标题
    title('Flip Paths in Polar Coordinates', 'FontSize', 14, 'FontWeight', 'bold');
    
    rticks([0 60 120 180]); % 设置 r 刻度为每一档 60
    % 设置字体
    set(gca, 'FontName', 'Arial', 'FontSize', 10);
    hold off;
    
    % 创建笛卡尔坐标图
    figure;
    set(gcf, 'Color', 'w');
    hold on;
    
    % 循环绘制每条曲线
    for i = 1:n
        % 转换角度为弧度
        theta = deg2rad(thn_p{i});
        
        % 绘制极坐标图
        plot(theta/pi*180, 'LineWidth', 3, 'DisplayName', ['\theta_{' num2str(i) '}']);
    end
    
    % 设置字体
    set(gca, 'FontName', 'Arial', 'FontSize', 10);
    yticks([0 60 120 180]); % 设置 y 刻度为每一档 60
    xin = length(thn_p{1})/3;
    xticks([0 xin length(thn_p{1})]);
    xticklabels({'1', '2', '3'});
    xlim([0 length(thn_p{1})]);
    grid on;
    hold off;
    
    % 创建球坐标图
    figure;
    set(gcf, 'Color', 'w');
    
    % 循环绘制每条曲线的上半球和下半球
    for i = 1:n
        % 半径
        r = 1;
        % 上半球极坐标线
        phi_up = linspace(0, 2*pi, numel(thn_p{i}));
        [x_up, y_up, z_up] = sph2cart(phi_up, pi/2 - deg2rad(thn_p{i})/2, r);
        % 下半球极坐标线
        [x_down, y_down, z_down] = sph2cart(phi_up, -pi/2 + deg2rad(thn_p{i})/2, r);
        
        % 绘制上半球
        plot3(x_up, y_up, z_up, 'LineWidth', 3, 'DisplayName', ['\theta_{' num2str(i) '} 上半球']);
        hold on;
        % 绘制下半球
        plot3(x_down, y_down, z_down, 'LineWidth', 3, 'DisplayName', ['\theta_{' num2str(i) '} 下半球']);
    end
    
    % 添加图例
    legend('show', 'Location', 'best');
    
    % 添加坐标轴标签
    xlabel('X', 'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Y', 'FontSize', 12, 'FontWeight', 'bold');
    zlabel('Z', 'FontSize', 12, 'FontWeight', 'bold');
    
    % 添加标题
    title('Flip Paths in Spherical Coordinates', 'FontSize', 14, 'FontWeight', 'bold');
    
    % 显示网格
    axis equal;
    
    % 隐藏坐标轴和网格线
    ax = gca;
    ax.XColor = 'none'; % 隐藏X轴
    ax.YColor = 'none'; % 隐藏Y轴
    ax.ZColor = 'none'; % 隐藏Z轴
    ax.GridColor = 'none'; % 隐藏网格线
    
    % 设置字体
    set(gca, 'FontName', 'Arial', 'FontSize', 10);
    hold off;
end

