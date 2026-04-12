% Load the data and store time and data in cell arrays
load('60sim.mat');
time{1} = Scenario{1}.Time;
data{1} = Scenario{1}.Data;

load('90sim.mat');
time{2} = Scenario1{1}.Time;
data{2} = Scenario1{1}.Data;

load('108sim.mat');
time{3} = Scenario{1}.Time;
data{3} = Scenario{1}.Data;

load('120sim.mat');
time{4} = Scenario{1}.Time;
data{4} = Scenario{1}.Data;

load('128sim.mat');
time{5} = Scenario{1}.Time;
data{5} = Scenario{1}.Data;

% Initialize the figure
figure;
hold on; % Allows multiple plots on the same graph

% Define colors for each plot for better distinction
colors = lines(5); % Get 5 distinct colors

% Define the number of points to stretch the data to
num_points = 100; % or another suitable number for consistent length

% The additional point to add
extra_x = 0.5;
extra_y = 60;

% Plot each dataset with its mirror image
for i = 1:5
    % Determine the portion of the data to use
    num_segment = round(length(time{i}) / (i + 2));
    
    % Select the segment of the data
    segment_time = time{i}(1:num_segment);
    segment_data = data{i}(1:num_segment);
    
    % Resample the data to have 'num_points' points
    resampled_time = linspace(0, 1, num_points); % Rescale time to [0, 1]
    resampled_data = interp1(segment_time, segment_data, linspace(segment_time(1), segment_time(end), num_points), 'linear');
    
    % Insert the additional point (0.5, 60) at the middle position
    mid_index = floor(num_points / 2) + 1;
    resampled_time = [resampled_time(1:mid_index-1), extra_x, resampled_time(mid_index:end)];
    resampled_data = [resampled_data(1:mid_index-1), extra_y, resampled_data(mid_index:end)];
    
    % Plot the original resampled data
    plot(resampled_time, resampled_data, 'LineWidth', 1.5, 'Color', colors(i, :));
    
    % % Plot the mirror image of the resampled data (y-values negated)
    % plot(resampled_time, -resampled_data, 'LineWidth', 1.5, 'Color', colors(i, :));
end

% Customize the plot
%xlabel('Everting motion');
%ylabel('\theta_i');
%legend('n=3,\alpha=120°', 'n=4,\alpha=90°', 'n=5,\alpha=72°', 'n=6,\alpha=60°', 'n=7,\alpha=52°');
yticks = get(gca, 'YTick');
ytick_labels = strcat(string(yticks), '°');
yticklabels(ytick_labels);
legend('n=3', 'n=4', 'n=5', 'n=6', 'n=7');

% Set the figure background color to white
set(gcf, 'Color', 'w'); % Set the figure background color

% Set axis properties for better visualization
set(gca, 'FontSize', 12, 'LineWidth', 1.5);

% Use a color palette suitable for scientific publications
colors = [0 0.4470 0.7410; % Deep blue
          0.8500 0.3250 0.0980; % Reddish orange
          0.9290 0.6940 0.1250; % Yellow
          0.4940 0.1840 0.5560; % Purple
          0.4660 0.6740 0.1880]; % Green

