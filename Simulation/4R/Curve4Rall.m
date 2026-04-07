% Load the data
load('sim60.mat');

% Extract time and data for the three scenarios
time{1} = Scenario{1}.Time;
data{1} = Scenario{1}.Data;
time{2} = Scenario{2}.Time;
data{2} = Scenario{2}.Data;
time{3} = Scenario{3}.Time;
data{3} = Scenario{3}.Data;

% Plot the three curves
figure;
hold on;
plot(time{1}, data{1}, 'LineWidth', 1.5);
plot(time{2}, data{2}, 'LineWidth', 1.5);
plot(time{3}, data{3}, 'LineWidth', 1.5);

% Customize the plot
xlabel('');
ylabel('');
title('');
legend('\theta_1', '\theta_2', '\theta_3');  % For three scenarios
n=3;
for i = 1:n
    h = xline(20 * i / n, '--k', 'LineWidth', 1); % Draw vertical lines
    h.HandleVisibility = 'off'; % Hide the vertical lines from the legend
end
% Remove x-axis numbers
set(gca, 'xtick', []); % Clear x-axis ticks

grid on;
hold off;
% Set the figure background color to white
set(gcf, 'Color', 'w'); % Set the figure background color

% Load the data from 90sim.mat
load('sim90.mat');

% Extract time and data for the four scenarios
time{1} = Scenario{1}.Time;
data{1} = Scenario{1}.Data;
time{2} = Scenario{2}.Time;
data{2} = Scenario{2}.Data;
time{3} = Scenario{3}.Time;
data{3} = Scenario{3}.Data;
time{4} = Scenario{4}.Time;
data{4} = Scenario{4}.Data;

% Plot the four curves
figure;
hold on;
plot(time{1}, data{1}, 'LineWidth', 1.5);
plot(time{2}, data{2}, 'LineWidth', 1.5);
plot(time{3}, data{3}, 'LineWidth', 1.5);
plot(time{4}, data{4}, 'LineWidth', 1.5);
title('');
xlabel('');
ylabel('');
n=4;
for i = 1:n
    h = xline(20 * i / n, '--k', 'LineWidth', 1); % Draw vertical lines
    h.HandleVisibility = 'off'; % Hide the vertical lines from the legend
end
% Remove x-axis numbers
set(gca, 'xtick', []); % Clear x-axis ticks
legend('\theta_1', '\theta_2', '\theta_3', '\theta_4');  % For four scenarios
grid on;
hold off;
% Set the figure background color to white
set(gcf, 'Color', 'w'); % Set the figure background color
