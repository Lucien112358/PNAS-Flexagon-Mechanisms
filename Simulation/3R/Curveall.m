% Load the data
load('60sim.mat');

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
title('');
xlabel('');
ylabel('');
n=3;
for i = 1:n
    h = xline(20 * i / n, '--k', 'LineWidth', 1); % Draw vertical lines
    h.HandleVisibility = 'off'; % Hide the vertical lines from the legend
end
% Remove x-axis numbers
set(gca, 'xtick', []); % Clear x-axis ticks
legend('\theta_1', '\theta_2', '\theta_3');  % For three scenarios
grid on;
hold off;
% Set the figure background color to white
set(gcf, 'Color', 'w'); % Set the figure background color

% Load the data from 90sim.mat
load('90sim.mat');

% Extract time and data for the four scenarios
time{1} = Scenario1{1}.Time;
data{1} = Scenario1{1}.Data;
time{2} = Scenario1{2}.Time;
data{2} = Scenario1{2}.Data;
time{3} = Scenario1{3}.Time;
data{3} = Scenario1{3}.Data;
time{4} = Scenario1{4}.Time;
data{4} = Scenario1{4}.Data;

% Plot the four curves
figure;
hold on;
plot(time{1}, data{1}, 'LineWidth', 1.5);
plot(time{2}, data{2}, 'LineWidth', 1.5);
plot(time{3}, data{3}, 'LineWidth', 1.5);
plot(time{4}, data{4}, 'LineWidth', 1.5);
% Customize the plot
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



% Load the data from 108sim.mat
load('108sim.mat');

% Extract time and data for the five scenarios
time{1} = Scenario{1}.Time;
data{1} = Scenario{1}.Data;
time{2} = Scenario{2}.Time;
data{2} = Scenario{2}.Data;
time{3} = Scenario{3}.Time;
data{3} = Scenario{3}.Data;
time{4} = Scenario{4}.Time;
data{4} = Scenario{4}.Data;
time{5} = Scenario{5}.Time;
data{5} = Scenario{5}.Data;

% Plot the five curves
figure;
hold on;
plot(time{1}, data{1}, 'LineWidth', 1.5);
plot(time{2}, data{2}, 'LineWidth', 1.5);
plot(time{3}, data{3}, 'LineWidth', 1.5);
plot(time{4}, data{4}, 'LineWidth', 1.5);
plot(time{5}, data{5}, 'LineWidth', 1.5);
% Customize the plot
title('');
xlabel('');
ylabel('');
n=5;
for i = 1:n
    h = xline(20 * i / n, '--k', 'LineWidth', 1); % Draw vertical lines
    h.HandleVisibility = 'off'; % Hide the vertical lines from the legend
end
% Remove x-axis numbers
set(gca, 'xtick', []); % Clear x-axis ticks
legend('\theta_1', '\theta_2', '\theta_3', '\theta_4', '\theta_5');  % For five scenarios
grid on;
hold off;
% Set the figure background color to white
set(gcf, 'Color', 'w'); % Set the figure background color

% Load the data from 120sim.mat
load('120sim.mat');

% Extract time and data for the six scenarios
time{1} = Scenario{1}.Time;
data{1} = Scenario{1}.Data;
time{2} = Scenario{2}.Time;
data{2} = Scenario{2}.Data;
time{3} = Scenario{3}.Time;
data{3} = Scenario{3}.Data;
time{4} = Scenario{4}.Time;
data{4} = Scenario{4}.Data;
time{5} = Scenario{5}.Time;
data{5} = Scenario{5}.Data;
time{6} = Scenario{6}.Time;
data{6} = Scenario{6}.Data;

% Plot the six curves
figure;
hold on;
plot(time{1}, data{1}, 'LineWidth', 1.5);
plot(time{2}, data{2}, 'LineWidth', 1.5);
plot(time{3}, data{3}, 'LineWidth', 1.5);
plot(time{4}, data{4}, 'LineWidth', 1.5);
plot(time{5}, data{5}, 'LineWidth', 1.5);
plot(time{6}, data{6}, 'LineWidth', 1.5);
% Customize the plot
title('');
xlabel('');
ylabel('');
n=6;
for i = 1:n
    h = xline(20 * i / n, '--k', 'LineWidth', 1); % Draw vertical lines
    h.HandleVisibility = 'off'; % Hide the vertical lines from the legend
end
% Remove x-axis numbers
set(gca, 'xtick', []); % Clear x-axis ticks
legend('\theta_1', '\theta_2', '\theta_3', '\theta_4', '\theta_5', '\theta_6');  % For six scenarios
grid on;
hold off;
% Set the figure background color to white
set(gcf, 'Color', 'w'); % Set the figure background color

% Load the data from 128sim.mat
load('128sim.mat');

% Extract time and data for the seven scenarios
time{1} = Scenario{1}.Time;
data{1} = Scenario{1}.Data;
time{2} = Scenario{2}.Time;
data{2} = Scenario{2}.Data;
time{3} = Scenario{3}.Time;
data{3} = Scenario{3}.Data;
time{4} = Scenario{4}.Time;
data{4} = Scenario{4}.Data;
time{5} = Scenario{5}.Time;
data{5} = Scenario{5}.Data;
time{6} = Scenario{6}.Time;
data{6} = Scenario{6}.Data;
time{7} = Scenario{7}.Time;
data{7} = Scenario{7}.Data;

% Plot the seven curves
figure;
hold on;
plot(time{1}, data{1}, 'LineWidth', 1.5);
plot(time{2}, data{2}, 'LineWidth', 1.5);
plot(time{3}, data{3}, 'LineWidth', 1.5);
plot(time{4}, data{4}, 'LineWidth', 1.5);
plot(time{5}, data{5}, 'LineWidth', 1.5);
plot(time{6}, data{6}, 'LineWidth', 1.5);
plot(time{7}, data{7}, 'LineWidth', 1.5);
% Customize the plot
title('');
xlabel('');
ylabel('');
n=7;
for i = 1:n
    h = xline(20 * i / n, '--k', 'LineWidth', 1); % Draw vertical lines
    h.HandleVisibility = 'off'; % Hide the vertical lines from the legend
end
% Remove x-axis numbers
set(gca, 'xtick', []); % Clear x-axis ticks
legend('\theta_1', '\theta_2', '\theta_3', '\theta_4', '\theta_5', '\theta_6', '\theta_7');  % For seven scenariosgrid on;
hold off;
% Set the figure background color to white
set(gcf, 'Color', 'w'); % Set the figure background color