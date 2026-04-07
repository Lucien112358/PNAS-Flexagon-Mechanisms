%% ================= Figure Initialization =================
figure; hold on;
set(gcf, 'Color', 'w');
set(gca, 'FontSize', 12, 'LineWidth', 1.5);
num_points = 100;

%% ================= Group 1: n=3 fixed, p=2 and p=4 =================
% Strategy: use a unified red color scheme, and distinguish p=2 and p=4 by line styles (solid vs dashed)
group1_color = [217, 193, 107] / 255; % 
files1 = {'sim60_2.mat', 'sim60_4.mat'};
labels1 = {'p=3, k=2', 'p=3, k=4'};
styles1 = {'-', '--'}; % p=2 uses solid line, p=4 uses dashed line

for i = 1:2
    load(files1{i});
    time = Scenario{1}.Time;
    data = Scenario{1}.Data;
    
    % Data segmentation logic (kept unchanged)
    extra_x = 0.5;
    if i == 1  % p=2
        extra_y = 180 - 360/(2);
        num_segment = round(length(time)/6);
    else       % p=4
        extra_y = 180 - 360/(4);
        num_segment = round(length(time)/3);
    end
    
    segment_time = time(1:num_segment);
    segment_data = data(1:num_segment);
    
    % Resampling
    resampled_time = linspace(0,1,num_points);
    resampled_data = interp1(segment_time, segment_data, ...
        linspace(segment_time(1), segment_time(end), num_points));
    
    % Insert midpoint
    mid_index = floor(num_points/2)+1;
    resampled_time = [resampled_time(1:mid_index-1), extra_x, resampled_time(mid_index:end)];
    resampled_data = [resampled_data(1:mid_index-1), extra_y, resampled_data(mid_index:end)];
    
    % Plotting
    plot(resampled_time, resampled_data, ...
        'LineWidth', 1.8, ...
        'Color', group1_color, ...
        'LineStyle', styles1{i}, ...
        'DisplayName', labels1{i});
end

%% ================= Group 2: p=3 fixed, n=3~7 =================
% Strategy: use a unified blue color scheme, and distinguish different n values by line styles
% Since there are 5 curves but MATLAB provides only 4 basic line styles,
% the fifth curve is represented using "solid line + markers"
group2_color = [96, 133, 175] / 255; % Standard blue
files2 = {'60sim.mat','90sim.mat','108sim.mat','120sim.mat','128sim.mat'};
labels2 = {'p=3, k=3', 'p=4, k=3', 'p=5, k=3', 'p=6, k=3', 'p=7, k=3'};

% Define 5 styles:
% 1: solid, 2: dashed, 3: dotted, 4: dash-dot, 5: solid with circle markers
styles2 = {'-', '--', ':', '-.', '-'}; 
markers2 = {'none', 'none', 'none', 'none', 'o'}; 

for i = 1:5
    load(files2{i});
    if i == 2
        time = Scenario1{1}.Time;
        data = Scenario1{1}.Data;
    else
        time = Scenario{1}.Time;
        data = Scenario{1}.Data;
    end
    
    num_segment = round(length(time)/(i+2));
    segment_time = time(1:num_segment);
    segment_data = data(1:num_segment);
    
    % Resampling
    resampled_time = linspace(0,1,num_points);
    resampled_data = interp1(segment_time, segment_data, ...
        linspace(segment_time(1), segment_time(end), num_points));
    
    extra_x = 0.5;
    extra_y = 60;
    
    % Insert midpoint
    mid_index = floor(num_points/2)+1;
    resampled_time = [resampled_time(1:mid_index-1), extra_x, resampled_time(mid_index:end)];
    resampled_data = [resampled_data(1:mid_index-1), extra_y, resampled_data(mid_index:end)];
    
    % Plot settings
    plot(resampled_time, resampled_data, ...
        'LineWidth', 1.5, ... % slightly thinner to distinguish from Group 1 and reduce visual clutter
        'Color', group2_color, ...
        'LineStyle', styles2{i}, ...
        'Marker', markers2{i}, ...
        'MarkerIndices', 1:15:length(resampled_time), ... % sparse markers to avoid overcrowding
        'MarkerSize', 6, ...
        'DisplayName', labels2{i});
end

%% ================= Axis & Legend =================
xlabel('Normalized Time'); % Recommended: add x-axis label
ylabel('Angle (deg)');     % Recommended: add y-axis label
yticks = get(gca,'YTick');
yticklabels(strcat(string(yticks),'°'));

% Optimized legend:
% Color represents group, line style represents parameter variation
legend('Location', 'best', 'NumColumns', 1, 'Interpreter', 'tex'); 

box on;
grid on; % Recommended: enable grid for better readability
hold off;